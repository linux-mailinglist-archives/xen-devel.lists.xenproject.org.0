Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE477EAAD5
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 08:23:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632158.986249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2nki-0005UM-Sk; Tue, 14 Nov 2023 07:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632158.986249; Tue, 14 Nov 2023 07:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2nki-0005Rl-Pn; Tue, 14 Nov 2023 07:22:28 +0000
Received: by outflank-mailman (input) for mailman id 632158;
 Tue, 14 Nov 2023 07:22:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5ZB8=G3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2nkh-0005Rf-Dp
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 07:22:27 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f6c1be2-82be-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 08:22:26 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7953.eurprd04.prod.outlook.com (2603:10a6:20b:246::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Tue, 14 Nov
 2023 07:22:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 07:22:23 +0000
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
X-Inumbo-ID: 8f6c1be2-82be-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sg/0ccnz+ogi75mnGMwpDFki4mhBQnGd49WrihfprxZ+EmWsc1SC3ZHKu3uyeii/GSHKNcNse/vDkoFnCwHfATaJJHNKXFwym4O/XQL88lXHyr/MNXDlpEOmo38LYCccdajng1L/0iViKnKY86d1o/Kx0NGaQCd3sZXPGnN2+CxW+qay6ISt6HlW1x5Lk6CuN/p5+ykvjpLtgs8l3Y/lxQBFWBhtYW3Dmr7K9iw4ImuSu3Jnf+ZBLMSl5ocXJOBi/93BJS64IkE8+3ly9in+QL9ry6S/aa/UaFcG57XPLTtEtBlhsE9dxCZ1FW8x7a8KIvq4MZRU8yWBJdhkwqNCLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSzbgR3+3qZmdaT63JtEpabEZcYBnUtFp8pHYgBWfB4=;
 b=CZ18z6o2vnZPv15V3i8D5Ur1z6k0TFdP0m/1rZ69hoojGvOIFijszcTCbiWxZNDfjjknlUmrthsyM+OSYm6otU8QVX4KJF+HNOFpLlkHzyHhbuWkHe+Xf6YEiDL9KF04U5kXAHTowUokmz+Bild3p5xOZTzyGhu+FLpmlTAyP978URhWtucMbNhjOnTE8BIlQPVNmMCOjRVHLaN1a15aIv1GPrRC96UKfIKV1F6B+hn3+X+g+iNKwb9LNFka5BZNJSrLQK2MWCrBO6SpcVuF6iM9hrnjwKxvkYbPAqjVnoTmWs3Z7uIpxV0+blYLEgrYFxOdD2CEgNQnNS5jlYeFQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSzbgR3+3qZmdaT63JtEpabEZcYBnUtFp8pHYgBWfB4=;
 b=guJmiGVoVR/8dT7NbST0OaGeWw5ReLtDutzMH6cUjLmKGzBydnUyNukfh3TBQk4r+jsryR50xmP0wyts8VnxHb5afTx92xkk5Yf1IaKH2E/WNtH2ZA7t+ZaLaNKAqd0q0rx1KN03Ve/qYAkDs0N4FhcKNYCnM39QlT3meBJZAID6n/r9J+s9kEly9v2W0I7fZKiVSbdXM6XMjzKTRgF40MVwYKd9UlLZlehR7eCr3eb7TQ3wx5fLrCThU6/5ufkhGB/TCo64Mz6inRMU4dDfT64/+f7XBWl8opm404YqHyrB29lCrrsalsNrRcQi4xhjwKLpE2nhMtSpk32zwhZT9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <82df8d73-0fe2-ab8b-3a47-069eed353a7d@suse.com>
Date: Tue, 14 Nov 2023 08:22:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Faking the number of CPUs for dom0 with dom0_max_vcpus
Content-Language: en-US
To: Jimmy Lee <jimmylee4930@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <CAFyR2DVCuDyufB-EWHTSurQ69Dc7PZ9CQZdN_T-Ym2rjVaRPNw@mail.gmail.com>
 <b020592a-d528-d420-9eb2-7b6e39ea1cad@suse.com>
 <CAFyR2DWo9+NxeyCvExNGmBBXOM85ak8V1UgN56xNfOxBa2BUvA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAFyR2DWo9+NxeyCvExNGmBBXOM85ak8V1UgN56xNfOxBa2BUvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 05fb64d9-0e60-43b4-ad50-08dbe4e2723b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OPPR//Z9yNqODvtikJsk20JGYkM2xj+0hhFvcwNRLLF5GRguGvsmp+zUW0CnvprRGo2QLD+KTWSTfPjebabsjmrsL/GWVejOfcjeLAhS3byh5qGDecbOteYTkU9MQ8CEc3QRrmQDqLKeKvHqAPBRgHV7F9b/xitwg3DokHaNEBqEmpYt+GycGUvoXpBzrkj+K5HmC0xnmSyyoc95rqZLe3TtkVnhq6SwUjVMCschgaOCePs435ilgYTWUfmfRJezvNAIFvtUJSZYtlPcU1iqcWE30BhS8NmH6vN7vHXfoubxzQHZ9CTHVsZJzH+oJ0tOzHw/hqFDHF8es7tpM/zfle1+FzdHjFmJoOSBfVEMa27O4tPbLnYAZrGwrTKuzYcFJIEC+sW8i4qO+/DXmfdV3eq/8hC0+sUkA2cm9joZnXaEdrAaAFNqBDejjvn2db4lHTVARtOHs2ldy3Y9ZNzM/UOHxjSkKC/QsNY7SZDIaaH/cKIAYl53RopmjbFOnrv9IOiLwykvAHliSAEMnkhXL4XYgezm4up26FH22ibmtavXclfML6PpHztXoJdhhf/F8nJQRPXORqx0ri3QEgbAn2ejE1QHGs6Fs8Xv7ez5kw8WKJ9KETBa/Uik2ycbXwxD/eD0P0pVsWW3XR4lNB6fTEeRBXDKoImrCtqERcNgH1lRe4CgR/cu770QiTcVBpoG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(366004)(396003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(36756003)(31696002)(86362001)(83380400001)(41300700001)(2616005)(4744005)(6486002)(2906002)(26005)(31686004)(4326008)(8936002)(8676002)(6512007)(5660300002)(6506007)(478600001)(53546011)(38100700002)(6916009)(316002)(66476007)(66946007)(66556008)(43740500002)(45980500001)(131040200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkE0OGNoS3hOTnFQdThISnFXTTg0em5GZXUxbDlPeGNTa0w0UnRjNHIvS04r?=
 =?utf-8?B?alNDYlZwSkhHM3kxekl1MEhhb0dhR2VDTWlsbHJLVElwb0tGZjRLSkZjc3N6?=
 =?utf-8?B?NFFQdUU1Y2ZZK2IrTUJHNE5iSVRTZDFhRUhKNmRYaTE1RnNsWnFmRXZPb29l?=
 =?utf-8?B?UHdFenFmbkZ0SDQvOU5teVpYNVdMeVBjTjRZTlpLQkwxdGgrQ1hSZDUrTHJI?=
 =?utf-8?B?Zml3QTlkNVJnSnF3WmdJcW1oWVRwc3hqOXRLV2tVQjlVUWk4NUlLeDFBL2hZ?=
 =?utf-8?B?R0pnNkF1ZXAxWlpVd3FWY0NJS2VaTWdUczdIU0M4MDk5RFJwZDV0Z3BDWkxE?=
 =?utf-8?B?WUZjajA3MFVxSk95YkJYRkZFVVR4VFA3UGJjQUJCOGpUekFxOEgwSEl0dzV3?=
 =?utf-8?B?b29UUlRRVm5iRVFYUmw0clRBd29yWnpCK2RwQzhwOGR3ampNdlF0WjBpSGpR?=
 =?utf-8?B?bEhZaVpOU0pVY1MycDhGZThRZWdSRWpHVncxWXhQZjlzUlV3QWx3TCt3NWlP?=
 =?utf-8?B?U203UlVoNURXNUxqTmFqTUVjQ05jZkNCOHNDdldjTmQxbCs5MVNsZTlLcTgy?=
 =?utf-8?B?VE4zRU5QdnE3encxVkdaVTlIMFdMT2dQdXhaS2xkaGp0dUFlbG5FQmF6N2F0?=
 =?utf-8?B?QUNHSGhkSXh3NEZOM1FlSFYrNVBjNXNlTkpmcXp1NkxPSVFtSVF5TFdqQ1NX?=
 =?utf-8?B?S3N2dGthaVhlcGI1Y3diR1BxcnFIYUhobHFBVGJnejR4ZTlHZE9TYmNmTzQv?=
 =?utf-8?B?V3hJL0VmVmQvNW9PS0R4NWdqazJCbk5hb2xSTFVsQ1NYQ1EvQkxqRVloOVF5?=
 =?utf-8?B?aURqTjc5S3ZVNVpXY2tWM2JvY3QyUDQ5Zk9idWRad1FpdktoUitDMXBQNTNX?=
 =?utf-8?B?OUIrRWJuR0l2akxqS0Q1WE1CbnBaSGtpdkE2N1FuSXVpUFBKUVRpNmx4L1dF?=
 =?utf-8?B?d2c3RVRYYnczRGhPUk9zb0hBQktnYjA4UndZcFAweXRKVkY3WVBTS2JSaVJ0?=
 =?utf-8?B?QmlLQVc4VC9GaDBmMWoxSytwYk5ZSi9vYjFOdUpic2NOVnlEc1A1cHhKU1ow?=
 =?utf-8?B?VUpZSlA0dGJEU3RDa0lRalRUN1A5bUJzTHdCSHlEQnR5VlFvL0RjQWJla2JP?=
 =?utf-8?B?T3p0aVRESXpRdk93ekl0b0JoeVQxdVV1OVI0ZGttYm1nWjVPbC9Bb3hTblZn?=
 =?utf-8?B?WG9PcStna0IrTDlVS3ZoeWxjMzRBcFJHVWVSaGgraEtrMlBqSEpPNzRDSzlC?=
 =?utf-8?B?SUtyd0VjREpvMTV5eVlWY3YxSFlWajh4MCt0ZXloTUxJTDhSc3IzbGswOHVo?=
 =?utf-8?B?M3pycmpnWFRPZmpraTVEN2tSaFErTFRsR05PL0U2emlETGFrWE05ZlZrNU04?=
 =?utf-8?B?REpvS1BZbTBhS21maUlDSnE4a2FmYTZsWmd2U0k2T01OWW5mTFVFN0Yyd1A1?=
 =?utf-8?B?amRJWHZpemxoMGJwZzZXVmJadUlpSGFGZ2lma1M4ZjdIcU9Db3J0VDd3MHc0?=
 =?utf-8?B?ZmdvSm04OWFPMTJLck1ZNy9LR3ZMZVg4UE12QzlkQTdVRTE4MWFNZjBTQlI0?=
 =?utf-8?B?NlpzOW1rVkhCSnRFKzBPdi96T3dJcFN2ZFN3NHYweFFvZFozQ3B4UFN5a0dj?=
 =?utf-8?B?V1RKMnN6MU9GcDkvZGhkRTZUdXZrWjMva1IxaUViUVlrdmtJdFFHV0Y1S3l3?=
 =?utf-8?B?VG96eEJ3dElDaTZBdTVnVDhtcncwRkFqN2dNcDIrdW4yNXF1Mjh0TnZjcmFo?=
 =?utf-8?B?Z1IxeDBHbFd1SkFtVEdJTHM2ZENJd2dGLzNsTnM4d0hJK3YycWhka3dxUzBJ?=
 =?utf-8?B?T2JNRHIvRWJIR2Y2dGVUeFRLMEF4TG4ydG41RDRVL1cvaE9takZYNk9JRCt5?=
 =?utf-8?B?QlVROG1CZ3BQdWgwOXQ3NTl4eWZ6OGhEQjlFR2NmRXBqckExVmNjR1BMRVBh?=
 =?utf-8?B?bEFWeWlwYWZXNUlvelJtVUdaQjJKWUxFUDlhd0JZSTc5Q2RLQmxHaVBTSmdZ?=
 =?utf-8?B?T2ZhY3ZIUGlzVVo3UmFnWHFFT3BWWVo4L1BmTFBNd0pSMFlZcm9EZzJ1MTlX?=
 =?utf-8?B?K3grZkh1WXZ1NERJVy9BKy9OL1R2aGhEZnRld0duZHR4bVFqZmZJT0w1emZz?=
 =?utf-8?Q?e2hSew3K+jAJo9QVZ2DXYBrE8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fb64d9-0e60-43b4-ad50-08dbe4e2723b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 07:22:23.4323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3aiTJ4+vXILv16cO/c2fEHFZS+uN/yOxMmG9QfFyUH36CAosTQ0wDEqnBxIRuEstPddVSVTc1osntugwywF2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7953

On 13.11.2023 22:40, Jimmy Lee wrote:
> Hi Jan, thanks for the response! Adding more details and log files here:
> 
> 1. I installed Xen 4.14 on CentOS 7 with yum:
> 
> [root@test-xen ~]# yum list xen kernel
> Loaded plugins: fastestmirror
> Loading mirror speeds from cached hostfile
>  * base: download.cf.centos.org
>  * centos-virt-xen-epel: d2lzkl7pfhq30w.cloudfront.net
>  * extras: download.cf.centos.org
>  * updates: download.cf.centos.org
> Installed Packages
> kernel.x86_64
>  3.10.0-1160.45.1.el7
>  installed
> kernel.x86_64
>  3.10.0-1160.76.1.el7
>  @updates
> kernel.x86_64                                                4.9.241-37.el7

I'm afraid neither this ...

>  @centos-virt-xen-414
> xen.x86_64
> 4.14.5.24.g87d90d511c-1.el7
> @centos-virt-xen-414
> [root@test-xen ~]# uname -r
> 4.9.241-37.el7.x86_64

... nor this counts as recent kernel. I did point you at the commit you
(minimally) need.

Also - please don't top-post.

Jan

