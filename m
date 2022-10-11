Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BCD5FAFD6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 12:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419499.664274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiC2W-0007O5-UZ; Tue, 11 Oct 2022 09:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419499.664274; Tue, 11 Oct 2022 09:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiC2W-0007Lg-PG; Tue, 11 Oct 2022 09:59:08 +0000
Received: by outflank-mailman (input) for mailman id 419499;
 Tue, 11 Oct 2022 09:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiC2V-0007La-28
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 09:59:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57304db2-494b-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 11:59:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8770.eurprd04.prod.outlook.com (2603:10a6:20b:42d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 09:59:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Tue, 11 Oct 2022
 09:59:03 +0000
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
X-Inumbo-ID: 57304db2-494b-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4YhkdpI87yQw3JVFCrmChaACLq/5p6s/CwwfJKF1Kazz6Svw10XQfeJYybyrdpScCflAVsZg/ew4XKVdgKF0+4Z/l0G3x0Q3X4+64BLUzOsGnznbxo1uyQohmFC7ZO+twRD69aH394HHdvNunXyOToYXHhi5t3u9azq7BKSkgbyxmUBzN1LvPcrRg8ZIclKtA1l8DnTMRRdXdGdCNZKHZVNw4UrPu5dMxb8Nroqzoah7ZwTeODMzASIzB0SiW7dwK2aiXnXVg2KL4XjzJNNUBOvDzTXS5qMXivzoVIY0IHjUOGUWJnOV1bSJSxe6FNipfyjtUij8avXl+n7woFJsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRFtWcXR6mreWH8ttueUTWqNt+dyzYd70iitrGS0ev8=;
 b=VACyDG7Cy32rLETsGLfkMNXZaBckyEVpeWlh5ynyLM9TpZO5kyShm+kmHcM9afV9u5mF2gIjrls6R3feCwoeBB41fEaA/AgXYSMuQaoO2rN9foVByaS8z6EkovJRAuIx5VsSWRH5D9CMp4tLJlO+TxkWsMEnxYSU7eFGBCfdCWBnB/Ihg2P5ENktrJ688B7KJvWKXvpB+v9eCYb15xtAjW2XHI+q7uMjabQMMB/m9C79sdSB04VG10iZVTJ84navQpJ+ieOcLfddLa20EIAtbWE5JlvZULAadeZo69FWW6tyVfyqBuFkPj7pzciT4+hBWNuFeVm/4bXkZpqggEDgag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRFtWcXR6mreWH8ttueUTWqNt+dyzYd70iitrGS0ev8=;
 b=4QJ7P0Oz+Cio8UQwPgaaUX1dHvP4oJO0B83FspmlvFUQ6fu00BclOola7gGdyeBdpvEYS3ZgmaMS/Iq5LRObKa6ApZoVUWeOfdENwnMiRRSX2FYekHkgEhdmDY9XjdQn3GFOwmGhg/uB45tbnDehpL4bO6EeiieqsCXXF30w4pC2SmNqjvthQOh+XE7k8NQXyO4a5QLur4NP13GhGDHmRVBmrkBLYEIQ1kKjTF9qLxIqZ5R3GHlB4No2ZsET4DtbJRP38T0VZ1HHdpiIYehxishXfGVwKl4Odh3GBucTh27dzexl62zrE+KF+DBM4lexi+8hgb6iU3r+GeweqLpqwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c1731eb-44f6-41c6-cb4e-51abf0c50052@suse.com>
Date: Tue, 11 Oct 2022 11:59:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2] Use EfiACPIReclaimMemory for ESRT
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Ard Biesheuval <ardb@kernel.org>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: bd258242-bb24-4d77-0861-08daab6f3a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ud/Vtpa6F2756aJ+6H4YCsv4y3pDhdQ5edTf2qJKeqzG+007tISSqteD1Z3p5Qfxzd+uToagfdVL9kon4B+pfuWjjeHeXMOZjc3sS0zHOSlPyAixvEdz7AzHSakCqB/nmf56gRBZuXPtTA2NHdXY1UZJ6hJ+zkEDucogYXXGTARi6a+bEW9ACpjJ1jSdWM4X9sIF+7lVb9GDqNtK9UTdSbZ0yKd35KAbD17Ri+l4PW/0gCqODXeN/Geecd0QEHP5Cds9fv2eNcxwOE1gQXpvW2HJ/6OXJz7eWbSdwOgCR6sKKZkwu+6KwDfglsN9s1Xdt70hDZnFob/rJY1+UkE2xyO+f20Tl6BqrxrV46Ir1oOuUaKLShl8+UyrYN/xj0TN1G0dD5IqadLECr6n5xOrFduEWig0pFSrkV0ZVtaLYFjIU1hMUaMUlt6uGl8/gSUBeDCSFBFrehkhb75q7K7q4LV6qtMY8ROC6eceueD9Xsio81YpbSjBq+ne7Gw6VEsioueOBEigQVLkazcCdCtYolDlRLv2GR2vfmlGZOTVp8+nAHiBd8q+HzXBddHXDXE6NFW0zmTFQk0Xnqtu9C0nrsMEoze7V25C4wip1/z1A/sfHG3usTJ5CSx8tx29gFcY9E3Qa35t86D7qM7hC3W5r2ovNf8KxPHGTs9AcaSutdAcrIslakaA0+mnqfxUW7fs5yhXxPJ8NrjPcOXiRyGLHaLc4s9tlFVCQQiGliLo8ryz+Fsgdm1DYV6UIds65zeV/BPk2HuTZxWdk7uK8MFfLoXkuiAQt/n23w2/JpQ0G/I+QbEskK8OJrkI5cj2GwWTqV+RV8fALC0ykisoD6kGMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199015)(2906002)(31686004)(6916009)(4326008)(316002)(4744005)(86362001)(66946007)(8676002)(66556008)(66476007)(5660300002)(31696002)(54906003)(36756003)(966005)(41300700001)(8936002)(478600001)(53546011)(6512007)(2616005)(6506007)(6486002)(38100700002)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW54Z0hjM1VobUNRL2JYbnBaUk9ETTgrbHp5Nmp1RDNyMnFrN0pOVFZBeDU0?=
 =?utf-8?B?V0VFZTltc1lkWFF6d3B2WFRQT29nbEZYWTVQSWRKMnVHRVpNQzg1WXpvQnhX?=
 =?utf-8?B?bXFGanhYUDg2MWdCekpxRDJtVmlqeXdUREVtd3dqdUg4WWRlSytQTndJRlF3?=
 =?utf-8?B?SHhqWngyM3p6cVVrNDhtNnZrSHlRRTVRZmYzVmYwNGhnV0pUN2JlbnE3eHRO?=
 =?utf-8?B?VGJKTFRBV3haWjBEbkc4RDlZRVZmNWloSDFqclMvMFo4MWk2dEtabnNPUDlr?=
 =?utf-8?B?azFablRSQWxRdEVFa1JDekswV3lEZVhMVXZlQ0NOaW1CNC9XenM2SHU0d1pa?=
 =?utf-8?B?Q1FkNHg0KytZeVV1WUhja0Rva3lZZVNnemJGKzVPNnBCNnI3Q2hRdlNaQVRI?=
 =?utf-8?B?ODZwVTRWaFdRYlp2MmJjWlliR2VuUHlVcDF4bGJ3M0wwcmo5TERXbHB0NWI4?=
 =?utf-8?B?azRWWm5nSzZPTFVIQ0tXMWFKL0xzNEw3bkhBUWJCZTJEMUJCZW5UZ3E0ZXVY?=
 =?utf-8?B?R1NVYmxiMDVFTXhRNlcydWFVc2NCUDdQZ3d4RmtZTTRZM3prNEZhalZVQTV6?=
 =?utf-8?B?UVNsOEpSN3pLSlZ3czdEM2F0VmxKRzgzYXdYYlhhRSt4MThpazgwb2wzaUdM?=
 =?utf-8?B?T0U3YTd2Qm1LdjFFVWdaMFJXSWttNkdXMVNYY3o4SHFFdk5sUkJXdHVueVlB?=
 =?utf-8?B?S2pkYzNIL0VhdWlZaUdaa0x3Njllc2RFSEtVUmZtMGZoQzlGMWNXdFo2OW9M?=
 =?utf-8?B?aThlVnREa0lZT3V5NEpWZ1ZJaytoVzFnUHQ2MGJ3Q2E2Mk82V3V0UzlSNDVu?=
 =?utf-8?B?VnVvVkMzNHptWFNHMFJ4THV0cjRhOGpQTkg2eE9GT29NbUU5TUNhWmIxQytC?=
 =?utf-8?B?SGF3WUxmUFhoUElyN2hLSk10VWRNMXhRS0VQSzE0ZXoyUnNrbHdOeUZzaVBy?=
 =?utf-8?B?VWZQUlVUa2tvV2gzdUpRV3k4ckNMVDRjYkRIaGEwcGxSK3BwdEJ2Vm1mZDlS?=
 =?utf-8?B?Q1VGSzFlNmxxazg2OGQrWkVDSjF4T1h0REZCU1pZREdWczljcERyWXVxMkda?=
 =?utf-8?B?SjJlNW16WEZyVy9xSTduTXFtTHJTT0NFL2theFhXMmJkcXczakttUmlGY2lv?=
 =?utf-8?B?cGlFdHVhaVFiNHpOMmFSci9sUmJJcDU1di93aW1FbUdvNG9JT1JDNlBBNXFa?=
 =?utf-8?B?RERPUW1KNTNBMmVzdGk5VlNCSExoQWh6K1dLSzM4a1dFaGU0djhqMFJKUFh5?=
 =?utf-8?B?Y0gxSzFZd2RvK295L2pyQS84M1NmSnk2dFB5TXdsUGxsYlBRSWdKQmlMMWhk?=
 =?utf-8?B?K1hwaTl6M2JKckVNZjEvcHFmN2tUYnBHSXBFeG9KNHY0VFBMMzJZUkMvb1dt?=
 =?utf-8?B?WitiR0RrY2tJNkgrODA4VXFLczFPWGdBQlR3U09KTlVLSkV4MmIzR08vWWY3?=
 =?utf-8?B?WXdMR0FZamxUWkIrSXZhYWRwRkNGNXZLelpDaEhROVVGVWNlUUFDKzJuVHBM?=
 =?utf-8?B?M2w0SkJqdlJLWlE3UmlxbEgzZEpnbXQyNVIvUS9kTHh3bzRMMk1HYzQyaDZj?=
 =?utf-8?B?SUY4NnAzUEtFcmZKSG8vN0JOSXVLVXgzL2RpMUxKbkJZTEpJQjlQWHhuMHhF?=
 =?utf-8?B?YzZYTXcwYkIvNU91dzNzUUdQS01BekJBcjRkc0doWHkzdkVBZytaR3cyK0FX?=
 =?utf-8?B?dERNaXlSUCtocFZYQklsUXhzcUFlZFpVSDZEcGNFR2JnY2VaVXU3SzEybXJh?=
 =?utf-8?B?K0JSWjhqT3RxUHhMZjZDYlVIMUg2eGVyVlByTDY3QytubVdGUFJycTN4TUZL?=
 =?utf-8?B?VWtkcXRUWlhuWm5uOTF2aW1DUjBHKzcwUU1nbDZ5bmpDL0RvaUlHenF4dFQ4?=
 =?utf-8?B?WkJBRGRBUExPdFF1NkQ2SHM1cFFDTUJKcWdQQ1FFVWlFOCs1ZlpxVVkxeFBa?=
 =?utf-8?B?dlp0Q2pudi8wUWV6YmlEYXVDTjRxRS9rQ3NIaWNEL0k4T2w4SlpPYjM1c1VN?=
 =?utf-8?B?dGxWUzd4dzIzOWF2aGZHeEllamtOQzZUbVlxd2YxUU5aZTArcFJsdmdoYWti?=
 =?utf-8?B?Ujd4ZmpUYUpIaWRjdmZPMURMUCtwRHhRNGZVUmV1V0hadVJoR0FURGFBeWFw?=
 =?utf-8?Q?Ku/jiXv7TqqCeBgGunuwTyxTt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd258242-bb24-4d77-0861-08daab6f3a08
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 09:59:03.1702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCKH1SM9ZHhw4RgYTZ87k//nBmHaDi9VbIbgaVk1R5lhc2e/VjqKqLp9pVXwTB8ySHxQQSIwZWgcG63QAnWexA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8770

On 11.10.2022 05:42, Demi Marie Obenour wrote:
> A previous patch tried to get Linux to use the ESRT under Xen if it is
> in memory of type EfiRuntimeServicesData.  However, this turns out to be
> a bad idea.  Ard Biesheuvel pointed out that EfiRuntimeServices* memory
> winds up fragmenting both the EFI page tables and the direct map,

Can this statement please be made describe Xen, not Linux? Aiui at least
the directmap aspect doesn't apply to Xen.

> and
> that EfiACPIReclaimMemory is a much better choice for this purpose.

I think the "better" wants explaining here, without requiring people to
follow ...

> Link: https://lists.xenproject.org/archives/html/xen-devel/2022-09/msg01365.html

... this link. Since the code change looks okay to me, I'd be okay to
replace the description with an adjusted one while committing. However,
if you expect the change to go into 4.17, you will want to resubmit
with Henry on Cc:, so he can consider giving the now necessary release-
ack.

Jan

