Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A89C4542C8
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 09:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226641.391697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnGTV-0000C2-JS; Wed, 17 Nov 2021 08:39:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226641.391697; Wed, 17 Nov 2021 08:39:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnGTV-00009J-GM; Wed, 17 Nov 2021 08:39:25 +0000
Received: by outflank-mailman (input) for mailman id 226641;
 Wed, 17 Nov 2021 08:39:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnGTT-00009D-Tu
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 08:39:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcf5feec-4781-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 09:39:22 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-mb5sSacyOMaySOKXuRiMvw-1; Wed, 17 Nov 2021 09:39:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3536.eurprd04.prod.outlook.com (2603:10a6:803:2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 08:39:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Wed, 17 Nov 2021
 08:39:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0102.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.16 via Frontend Transport; Wed, 17 Nov 2021 08:39:18 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: dcf5feec-4781-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637138362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c1NbKMx+BVB28B1tLkPrIUq7uBVGcrCysKxVsq2OPr4=;
	b=F7anT3/c0mFgs6FGqq7TtqkKthLJIRk2kAg30gcaowKVYrJpIpuhv2U5op1PtmZLPY36++
	78Jkz6NZArAGG1rkCPSwyuUjV5Thrby/h76BwR5+MYvPkQO3GMKwvgKybru+Z5Ia95w0Zj
	tDFHy4VEOgU2V6W61+nQT2j4qQUncSA=
X-MC-Unique: mb5sSacyOMaySOKXuRiMvw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIzAStwSOHbEGCZe+Lixy7tbrB9ZW3nL5pWkkf78LTcE0eJDhVTMJeer/ofLAbwGAe1OVMlkDCfzir5ewEbK0+yArbTMtz73xwLm0JwOmCzcOVxYGJ/CtV0qCeEERhb/6HXJBFWO1FkT8wZys4OOpCLNjVdliO2KF0nsHorPY9Mfj4vl6/mE2CzByuLADtVQUtx19Bz9hs7hNFdipt4NsdKFyrgM05L5qv4d9JPiHurMlDBmMs04QIDXzl+NpQX2xweCC3S8yLO1yqbujf03Fzpa6hhpQWs6gEjiLaR1czB0jMfv/OXHRWVlFXkNmGmrxSptgEm8ZtxcIZjUyr2ldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1NbKMx+BVB28B1tLkPrIUq7uBVGcrCysKxVsq2OPr4=;
 b=kdQWLILk6Gkh3g44NUjqwDhpVZzjL4jleoPWxaKdWP+xInS4evj+WfImi8f/KBEXbh4/1y8vxrc6rQhlBZYexkhx60j+3vqTwI+YSGVgWeU1eTrgpkGuywC223Oj+xw5sYVMiQocLdvfo7q2IGMBVrFW75ypu6uveZGCzsGQe3jKGAAxG8ZFoDPYHoEuUXa5DxeHQkyThRvoG6DCHBDT3nSeC6Ik+kKU6sw3aSVfkF0pig+bBbbJqgUIBRQcPTB9cb6dsoR4VNd1evkWAcwthfVnKpw2bOtewm6EvFKS8cVfh6XZJbWiBBvddX9gtCRng5+Pb2wLuBfABGDLZ3pMlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b62a87ca-b68f-76fd-51c6-114e8b8e125b@suse.com>
Date: Wed, 17 Nov 2021 09:39:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: PCI pass-through vs PoD
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <b6d598cd-c244-2b7f-c731-fe839df3382e@suse.com>
In-Reply-To: <b6d598cd-c244-2b7f-c731-fe839df3382e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0102.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::43) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fa7f8a8-8e95-4648-d9c8-08d9a9a5bf14
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3536:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB35364EF677205341125B2FDDB39A9@VI1PR0402MB3536.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rt+EJzVUsjKXheDwFlGXQtkvugXOjD3DNyssmemMAPQ6Ch+SNoxcvUJxXNdEKpI1KTZebk76Ib0nedTZw7o6VFwdpMaeIuMwH395aq8eLTeSzok1zRs2b7VrHiT6f7p4MfaJ1UZgKvxrTATn85/bUkQ1dpIQ/OXx9p8pp9sNQ626MFDm5vLSRkF7uswshDY6qrEKUHw7rHPaYDUCyc6CaOkeQJ0nHUjCRteEyRjJOY4hgHj8AEKEt9w4V8NGLn29DvJ9hfx9bXkI090cQAG8wcq2qv/admK/88IoXlzmdNtqkIgHJ8oPEVN74DroViMu/jmMc4f65WChQ7cEJMg4kY/OPbVrtzWc9m00VqDUFaKrf+fjf51DExHTDlMQr1xzfp6EKOgnAkIjgrAmvdTVjwy3b3KNWzM25ki9sSL/kB8j6HlFgD4ja5rDXn6MA66fHyEArpUwGaeqUeBFskD3M9GQnvZUV72He9l/j76oqw/mxrt2A2N7P9ZhC3GYODYakQ4DU5D/ARVDwy6GmIaFG1umakTB2F3mld3jlPffRD1PgQEzLVkklmUz/3Fu+GEv47RbT8fe2hzeGqquxLjvBdvEpK38We5BLkOxZQYCHg4lhL5xPzUBPPwbbYd9RZnUDr3YZwzLcwCq9qVzD5Fb/az+PQnFvjZy+Z8HiJmbEghXEXRRpJ/D+o7h/ShRE+FTNeT5W1dZ1sKBHnPl+BjTEoGiZItQyri/Ju2xuxqbF19upWTVHFnJE93rGFnfJynb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(31686004)(66476007)(8676002)(4326008)(316002)(36756003)(6916009)(38100700002)(66946007)(26005)(53546011)(508600001)(66556008)(956004)(186003)(2616005)(3480700007)(83380400001)(54906003)(86362001)(8936002)(16576012)(6486002)(31696002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3FVZnI3SVZJUWd1cjh4NXVQY0FBTTJqUS9wck9qZXY0czZld2NkM25PSmdR?=
 =?utf-8?B?aTlmdG9KOTBHQXBxSFhjUXZBMEFra1VVZUhXVDJ3N2VlaGJ2YWVJT1BxdTVr?=
 =?utf-8?B?ZnorVHdxN2NVWm1PRjE5TDFDQW1XOEdMS21BcXVqM0VqclV0MFMwREF0UU11?=
 =?utf-8?B?ODRLaXhXbFFYOU5uOHlwRi9JbXdpZGRLc0x3aFlnb0l0SHUzV1haUG1iQWtD?=
 =?utf-8?B?RzFiaEZjVjlsdGM3bUNlaFBPcmFEQk1rdm1iY01CQWl5NllPcFBZUENtK05V?=
 =?utf-8?B?M3FZNzBISXFrbE5JQ1pwYXB5ZlNLSWJYL3UyNFp4ZnFMdS9jV3p4SW90RGds?=
 =?utf-8?B?bTAvNjA0SEN6WXBWWlVwTDhablk5d0VjQkpjY3kvZ05sL0duajdzRmhtWnJ0?=
 =?utf-8?B?bjV2UzZyTUNJQ2ZFSVFlVnVIK2Z5TDU2SWNmcTNYcVBEOW9WVXFINlZ0Ry9T?=
 =?utf-8?B?c0g3RTlpVHFTeFhvRTdqbS9mSXMwbHVETktwenJYaUlTMk5tZ2hlWFdycWN1?=
 =?utf-8?B?cnU2OXdEQ01qWm5OWHM3Rm0yeWdYS2RBN20vUUNWV2Q1MnE5ZkNMRFR5cGcw?=
 =?utf-8?B?MDMxR1RKVmxnYTl0VXZaRWcvR1lGd0hic1lPNTg5UUMyMjR4REtDeVd2MzN6?=
 =?utf-8?B?bGNFc3FtVjljb2lhZVNyYlkrNXRWcUx6ZnhiVEdCVGg0a1pUY0VQVVBUclRJ?=
 =?utf-8?B?a2g1R3FQa2M5MFlUYnp2ZnB4cXAyYVpRci9PYVZwZU12aU1TMWN5WDJITm44?=
 =?utf-8?B?eEw5b0FueTJUSnNXaG50VGJpV0dBbkZURjQrbnN1dkpnZDVpSk90OTllcVRv?=
 =?utf-8?B?VVhyTEljdkpPNEpOejRGL0M3TVJ3Znc3RUJVTnYzSUd4bStBVnVqVU9ialdY?=
 =?utf-8?B?NnRVVGloVHExWWV2TU1XeUdYeHp4SVRvb1BGU09aVWtaUEtkM1VDeDc0dWFW?=
 =?utf-8?B?eGxNUWNDSFVOTHQ4c2FacUhZTFZFWmVOVkMvY09vZjBHcHZNVDl2K2tweTZw?=
 =?utf-8?B?VlVpa0VRZzJZc3RWY00vRnFkdEo3QTZtWGw0cTl0T0p5RGZIVTU2WHE3YVlU?=
 =?utf-8?B?cEIyNVdlMjVOZlFtUG1GM3NRTHUrSHlZZU9IcFBPVW9xQ0hmUzZ4N09KUnpV?=
 =?utf-8?B?QmN5aVFSbjl4RWNDVW1Kd3M5NWNtRVdhOTBHTjgvQ0JtQ1JhNm1GMmVyM0JG?=
 =?utf-8?B?cU82ZWZUT0xhbGJadXFBTjFXdU1mMWdaTHR2M2RnVGc0MkpCNzRCbnoyTnJW?=
 =?utf-8?B?cTBEWVNRT3J6b1VEekJncU1RVktDa1RoWDhRQytzejBUMzdyZkU5VUZCcmMv?=
 =?utf-8?B?aERVYnNDMXR5TU8wYmhwM3VjSjlKaTB4ZnJ0Vzc0UXlLd3psMzk4WDNoM0M5?=
 =?utf-8?B?c2xVek5ZTG5wcDdCclFmUlFGUzUyZjZFb0piUFBpWWVIeHgwNmJjQjdLa0pL?=
 =?utf-8?B?WXNsb0xhczd1cHVaUS8yQkxPM3BKdEJOVEhxazd6UjJES0RjOCtYYzhzOGN5?=
 =?utf-8?B?Z3o2YjYrL3l2UHd0bHlJdjZ5QU01RmhLZ2hKdkhrZ0dRWkNWOS9xVHpTVTVL?=
 =?utf-8?B?QUdkMUc3bkhVb01lbC82R05rYkJCUUxpMVFkcUlUZERCb2lPeWsvZUFEejhT?=
 =?utf-8?B?d1V0QWJVQVN3dkUxM3Z2RGNsakVPMkhQdmR3QW5pVHAwcVNRWDJtY2p0eHVZ?=
 =?utf-8?B?d01mdFFDcnRyMWFCR3g5eXRGQ3o1K09EVytROTBlSE1IVUhuU0swdmZIckhB?=
 =?utf-8?B?OStzTExwckVCNkNFbmEzTVBha3VXQU5oVGUyZjVQRng2UThwYnNpUFZjbjJP?=
 =?utf-8?B?YW00dVE5Sk1aclNvOENzK3czUnp5TFhybXBFZjV3RXBIQXd1dlF1T3EyWGZj?=
 =?utf-8?B?R1p4eHl4a3VDQ1RuUjZ2QTltclA2djdJdXYrWXhlR1dlQ0RuOVFzK2xIb28r?=
 =?utf-8?B?alJqMjcrR3VrWFlJVEZ0bkZOS00vajkra2FmUWdpbTF5WFFDUzhhZE00QnQ2?=
 =?utf-8?B?Yk03ckZqdEswTGc2S2hiV1B6anNyRGdpaThVQXRpY3ZacDNyY2tZKzR3cnFv?=
 =?utf-8?B?aVVMNGZ1SU02UnkyLzFCemZFa2dOOG9SdzY5dkx3ZURhTEo4aEhYaVo3SDRO?=
 =?utf-8?B?dWJOSUxHa055WVFVbGIya2hFa2Rqamt5QXdTMEVrY3QyTWUrcVBnTHBaL1Za?=
 =?utf-8?Q?ORq5SACacMFCL6PM4QZaN4w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa7f8a8-8e95-4648-d9c8-08d9a9a5bf14
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 08:39:19.1467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEUNSUNmtKZk4dDOyyeGwrWkeTFjrK345Qdb/t9z3aEKSoVXD4Ru99pXwumPnhFUCfnAxAzbj4TMKYXLVbl0uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3536

On 13.09.2021 11:02, Jan Beulich wrote:
> libxl__domain_config_setdefault() checks whether PoD is going to be
> enabled and fails domain creation if at the same time devices would get
> assigned. Nevertheless setting up of IOMMU page tables is allowed.
> However, when later assigning a device to a domain which has IOMMU page
> tables, libxl__device_pci_add() does not appear to be concerned of PoD:
> - xc_test_assign_device() / XEN_DOMCTL_test_assign_device only check the
>   device for being available to assign,
> - libxl__device_pci_setdefault() is only concerned about the RDM policy,
> - other functions called look to not be related to such checking at all.

I've now verified this to be the case. In fact creating the guest and
assigning it a device while the guest still sits in the boot loader
allowed the (oldish) Linux guest I've been using to recognize the device
(and hence load its driver) even without any hotplug driver. Obviously
while still in the boot loader ...

> IMO assignment should fail if pod.count != pod.entry_count,

... this holds, and hence assignment should have failed.

IOW this approach currently is a simple "workaround" to avoid the "PCI
device assignment for HVM guest failed due to PoD enabled" error upon
domain creation.

I'll see if I can find a reasonable place to add the missing check; I'm
less certain about ...

> and all PoD
> entries should be resolved otherwise (whether explicitly by the
> hypervisor or through some suitable existing hypercalls - didn't check
> yet whether there are any reasonable candidates - by the tool stack is
> secondary).

... the approach to take here.

Jan


