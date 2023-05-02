Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBF56F3E56
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 09:20:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528365.821407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptkJI-0001m8-LZ; Tue, 02 May 2023 07:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528365.821407; Tue, 02 May 2023 07:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptkJI-0001kD-Ir; Tue, 02 May 2023 07:20:28 +0000
Received: by outflank-mailman (input) for mailman id 528365;
 Tue, 02 May 2023 07:20:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptkJG-0001k5-Sh
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 07:20:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cecac40a-e8b9-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 09:20:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB10072.eurprd04.prod.outlook.com (2603:10a6:150:117::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 07:19:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 07:19:57 +0000
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
X-Inumbo-ID: cecac40a-e8b9-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIgnX4Su5oMzTFIjPaDeciXZi6yPfjLIv4l2JxSENMTrlEfskPrHELiL33m7WcJrRTsjWOvNziMn5cDyef+t18cMm0koQ1m1nC2pJjvkemwidO5NuDAydqSGcV4V8WacEzXk3Ni8HMm4CzyJdICm2mpu+RWTT2O6xOT9KU/lm2onRFmALcixsT5Gwq//Jvto+Naey69aT5F3+hHj2jPjiALYoiyvwXEmlCnu7LjOGIF4HBUKA0xTDVJoJN/sa5ftE27lkCkwH/ApJRdT9WTT4rP8xqrTXQnSiER1CK1bYRXNzlvEdqbrzQEVLok4AIvYtirwzizpwf1Z/5JfYbV+2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ge+zmYmWwl76Lvy1vCFAkPgqQs+CeCMIZ3C1bhjNBu4=;
 b=kQRXUKz/nct7A/y1z5cxFiZWGXFm7XFGRfJtklbFb5F1nnM4GSreQD9KDrK2GZ6TR0UnayKKuoEbgJRrXmqnXJ4c8oxtX0GTYws02w/4kE13iCIq8V7wqSj3mcO7PKBmHz71rjmsG+UYuagJIrXZWqDBjXtfTu4hMe3U6dynPb2EO4SpfUobsvTNok4YVCuUdOf19LOm25oyG84B3pqM2BiONwYAj5G7WIMMcy97M03BTNw1vNaC97g3fpSvL1NiIcE5bTR17srrhiy5cqYyeSVIB/4YX8zK/DbLnncmphygUudjfAU8GTOVLA5eypTrVXQJZTIPWuEKV5B662iMaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ge+zmYmWwl76Lvy1vCFAkPgqQs+CeCMIZ3C1bhjNBu4=;
 b=i0Dj0Myrp9pvA1UsRaEkuRiPvS5/ovi7pQ2P2Wt2YFE325qgOHF3kpJeQyjPiI5B40poXV34nCM4Zx71ujxouXnRUwnRCb7CmZDB4hNbnYlxdnxJvLUUZ8Tu8yNVcbFFcqQcQm+N+2XPfxNaJpaBNbvLHSekgqTuEvJeyIjn4w3WWcLA4cXCcw6ICAmKkvcsTvWAnxHPgRQ6scixyvw28KqohUgJjafej7COZYhRVK8cbKipCepSjhgs8Y5iCMYCfOWnbVDO/K1c86XizEs8Ta/MfUYp4bUxcyIckqz4z8itwcCrXqE5t9PTfY8uqOZXYQo9PqNUuse2hmMfwgbvcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c6bbf10d-f4a0-decb-d299-ab2093060b46@suse.com>
Date: Tue, 2 May 2023 09:19:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] xen/sysctl: fix XEN_SYSCTL_getdomaininfolist handling
 with XSM
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230430144646.13624-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230430144646.13624-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB10072:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c97f6c0-4eb8-403d-552f-08db4adda22f
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pItcUnFHYD93FNMHgtH5v7fe//3hS9B4ogemegJqfFles5P+12S5+w3WGSxEgmlrbjChX3yjGRJxcg/aMnfrbRoCfWHIuPQfY6u3KYdkvalVv6S7c7XNsh0XBo6rom9HTb3ZzaYjEnoB3NtC6mDTt2VIscnq1iQoXUk5Wo6005bUAtfuvEIEHP1zf4k74O93HZzgqrp7LqctzOe0okRpTjH+7NJpD43L5sZrCHo9PamGbBLb2EPszwFn2aDB9EFjUVUJ8ZViipXh0t4QAp9wq6GURviQGGgdvvbOiIY5uIevcA/lnYKM+s4jx2QAh7ftyO4LyhsedABZZskHNP5kpLV0M1TrjlrLoX+UNBdawNZSnQpd1NqL7qNmn9a07csQIMo/FRYHk+MPgxkpu7XjKXppOUmj2BoSRnxs6kxfgxOWSKs101fOmZJFCfnSnBa2rnp8oeLtQzs3lGN8p1HCjTT692MCqdwKD0roDJYDVTqeUWFqSIXkkN8V2GGvSQ/3sHsIpUM36ZJHurct34KrnJH67rK8DQwLzdf7Vou30kBI16Wa3OHksP6agtSvrh8u+zS9Uarmy8nVRuElhXG/Qj0MZ86DUrQptJRmNsLfg4zE2Vcx1h0BAnFHd/XD67llLO9BehLGk+SW+TjoPsM6lQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199021)(31686004)(86362001)(4326008)(6636002)(66476007)(66556008)(66946007)(6506007)(6512007)(41300700001)(36756003)(8676002)(8936002)(5660300002)(6862004)(6486002)(316002)(2906002)(4744005)(37006003)(31696002)(54906003)(478600001)(38100700002)(26005)(53546011)(186003)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEJhaHkyMDk0cXZ4K2RwcDFJSGZEQXR6OS9xV09qS1ZFZ1AyZG5zM2lBeDlu?=
 =?utf-8?B?ZHJMam5EQkhIMWgxV20yRUpBR2hNaktkVDB4bU5mNGZwY0MyOEttK3hPd3dU?=
 =?utf-8?B?Nm1lZkxCYVQ4cEN2WnBsOVFBQndmZEMwUWJGUzZnZ0NmY3pyMWlycXgyV2tm?=
 =?utf-8?B?QmdwNkVzczZ3c3lBaGw4TXMzYmlJN0p5UTQxRDZmZ3d2cTdHTGl3WlYxYzRT?=
 =?utf-8?B?VjRHN3dMTGhCR3VFRTRWNGtiNmx5aVl3ZzJJTk9xdWNsMlpTR1UyMXAraTNz?=
 =?utf-8?B?Z0pSb3crS0RPTFhLdlRldUpDYWpqRGpDTzNMK2s4SlhvUHVKN2R6QUYwZUNo?=
 =?utf-8?B?TDBib1ArY3JjUmppN0plMHdWL09BK0x5Z0gyUVRvbjBlSUp0cUU3Q1JxU0xC?=
 =?utf-8?B?WVk3c21JdHRrbW8xNkllVE9WOEViY0Vzb0llMEFQN1VydDBVM1NJbUgxWXNi?=
 =?utf-8?B?aW9XQ04zdTIzbUNDNW4rK1Q2N3gwOW93YW5tVnFEMU54ZmlnamR5MXc1YlRJ?=
 =?utf-8?B?NG95S1hGc21uWk9VMTVBN2FKbkx3UEpHOVN0ZE5JRWFKZUpGQzJzRGU2M25m?=
 =?utf-8?B?RmsraThmOGlBb1Bpc2tVd01aNTVkL0F6WnVqYzdXT2VlNGx6S3kxejE3S3ov?=
 =?utf-8?B?WWZZWjRDR3ZTc3ZaWndsTmgzNm1TaHdPVUd1aUJmbitGaUJ4b3BsK2ptcDlO?=
 =?utf-8?B?b2F4S3FIcGFyaDV2RXNMdUFnTU5tWEJXaDlYSWVCdytOR1VvcG1GUm5XVXo0?=
 =?utf-8?B?QXhyS0Rtd1hiNkFhOUJYMzB2WFcxSXFDbUFTcG5EeW1tVFpVYWhRck8rbklJ?=
 =?utf-8?B?L1labzJZbi9mNDkvQTlsWVpzN29vSlhxTGpkcnFjanpZaEVHSG1xS1pLcGVX?=
 =?utf-8?B?K0pYZFhRa0p2bHY5QW1PZHRGbm95cmJnaS9qcFBNQ2h3d0loT0tjclh5U3hv?=
 =?utf-8?B?THFxSlo5ZU9NbkhqWVVROG9FeDM4WFE1ZncwM1VhNVdHR3pDYUtBRE9GVDM3?=
 =?utf-8?B?WkNTTGE1SW5qOWlPM2lWN01sTFFnbDBkR2FTekd2eURidXZIS3VRTWRSeU4y?=
 =?utf-8?B?alI5ejN5VkpsbllDTWdhdWEwK21XTnptWHhtZ3NLb3F0VCtzaUdJMXAvR29C?=
 =?utf-8?B?M1NDU1E3NE5EMnp2dTZ2T0pTazNDVVp0YWNVZjB3UUtJa0I1eFpXMU0zUHc3?=
 =?utf-8?B?eDRWcjJTc3JjMGl2R2oydTIrb3RQVG9wYkYzVEl6T0I1WDQ1T0oxMnJYd0lh?=
 =?utf-8?B?Yjh2eldmVktxQ3lDcThjelRKeDFnK05RQzJrblByQnRSN2p0c09KSDNUcXly?=
 =?utf-8?B?bGhYNVZoV0hOOFphSFFVR2xOUDh4eXhPYmVBWGhvWDl0eC9EUmd2VS9Jdzkx?=
 =?utf-8?B?OHk0bWpRSzBkYTFKcnkvT1BWYWhhRFJrZFhPZS9nTkpwa2xrdkowWW01bUFD?=
 =?utf-8?B?c3NpcWh3c3NaM3gwanZXWjVKQzZnR2diWGc3bmhrTVM5ZW14d2ZkWmVodENS?=
 =?utf-8?B?c3JIUlNFZm9GQXVaSFFIU0FkaTFwU2RBNW4zZi8wRVE4VEN6ZFZTN3F6b1lt?=
 =?utf-8?B?SE1UZ1Vud0UvVldUZTFFT2JqdDN6VUx2N2VWRWFHYWNOdU5CL2x5RDQzUXQ4?=
 =?utf-8?B?RXNlN2tXd1R4ck16aS9Yc3ZvUVNBczBaVUcxUy9kNU9HOXUrTHhDQlFyZEVO?=
 =?utf-8?B?ck1WS3BudHh4N0tXbkdXZWlyK3JmazM0ejNOY2xPcUxYa3l4WFV6NWg3eXJN?=
 =?utf-8?B?Vm1sbDZrbXVPQVBjWHMyWFdKejZ5bDlxRzdhL0FCRm5rUzMwb3phcnAyaTRz?=
 =?utf-8?B?bERDakw2NGVHcHM1Wlh5SGhGMGtEc2hqbjBWSWhLbi90R3E1Y3dRSG9aY2dH?=
 =?utf-8?B?bW5PbVV0Z05MZXZBZENlMVNsRDlSKzN0Vm45Ym83aDBxUmFjL3NwbndDeGdJ?=
 =?utf-8?B?MlUwbVlXT3U5S0RaOEdocVB0dWxIT3FpOHQyVGw1OFNqWVVPVnRnQUtDcUI4?=
 =?utf-8?B?TUtUUS9ndmM4NDhHVWV1a2U3L25DQWNYR3dyK0VDdTNoYVl0VUI0REwxRzh4?=
 =?utf-8?B?ZEZvT0wwUTVjelJxRDFNYWdKc3dkVlF1VCtHdmNzNFZIUk1CT250TFljVkRJ?=
 =?utf-8?Q?rzaFI4WEproGI7vpjMXbGna/A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c97f6c0-4eb8-403d-552f-08db4adda22f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 07:19:57.4287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VdPxRBuF0fybvU7H6m+DeZgnngmhJR7YjZpTQ14LtVLBQFwCznGEoDfYRK9x2vlROlFGRHuqj7c8Gtw6Me9Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10072

On 30.04.2023 16:46, Juergen Gross wrote:
> In case XSM is active, the handling of XEN_SYSCTL_getdomaininfolist
> can fail if the last domain scanned isn't allowed to be accessed by
> the calling domain (i.e. xsm_getdomaininfo(XSM_HOOK, d) is failing).
> 
> Fix that by just ignoring scanned domains where xsm_getdomaininfo()
> is returning an error, like it is effectively done when such a
> situation occurs for a domain not being the last one scanned.
> 
> Fixes: d046f361dc93 ("Xen Security Modules: XSM")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Should have finished reading the list first, before sending the same
patch again ...

Jan

