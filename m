Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAC735F1F1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 13:11:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110508.210935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWdQp-0005cX-OZ; Wed, 14 Apr 2021 11:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110508.210935; Wed, 14 Apr 2021 11:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWdQp-0005c8-LI; Wed, 14 Apr 2021 11:11:39 +0000
Received: by outflank-mailman (input) for mailman id 110508;
 Wed, 14 Apr 2021 11:11:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UoOq=JL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lWdQo-0005c3-6k
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 11:11:38 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0ef1841-4c3f-4daa-a357-b43cc526e59c;
 Wed, 14 Apr 2021 11:11:37 +0000 (UTC)
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
X-Inumbo-ID: b0ef1841-4c3f-4daa-a357-b43cc526e59c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618398697;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=M0KSdhxdbmY7WYtVzfLnZqivsWL3jfFP0YsE3yo6sMM=;
  b=Qd1IQlkY++tIfZukIq1LWls3rMitqLNcrhTqwBNrx8DJYXme5WNPj7u6
   lCgcuZZtzarqnSpwg0EjfL3A5Bi4JchRASzkBU6JGtbvE+D5NssW1EtCg
   XfZxheu1EyNpYqAgDbmLfNPJuOqBMMk5v9SnBlSDpqgWx5Rl42s8vY9zw
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mt4bSELrh4jLOQ+06n3Qf8o0BM/W4Prcmj/otBwo3myjbANkAt7jSEk30AaGdQcLJcAD06wAi+
 gTWnhoKHW40qGbjuIolxS1MrQMs8CU+Ko4avFA8tyAfpmBL+Db34J5EoV4V/P3ILjQCHcfnHqU
 t1CEqUp2EQeCjXTXsLl+kn0JFny+KePwwakzXT/YyfqjOYcCn9k8AuGFy9oJTgnfp3G2aahy04
 rZ30j5kmZmyvLOKNZB6burGN3wQgSs1mae74Rtpbj0uerzpS5cfRq9FggzJ3cAic8FuV/woOat
 E4g=
X-SBRS: 5.2
X-MesageID: 43037078
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gseOVKvSS5v/uZBmNT+Rq1F+7skCpIMji2hD6mlwRA09T+Wxi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmwybde6+AqXYuKdg/gpWeuMcVe/ZLvqgeQfxHW28x88e
 Nbc6Z4AMDtFlQSt6zHySSxDtpI+ra62Y+yg+O29RlQZCVLT40l0AtjEAacFSRNNWx7LL40Do
 CV6MYChxfIQwV1Uu2BCnMIX/fOqrTw/fqLXTc8CwM68w7LtDu06dfBeCSw5AsUUD9E3N4ZgA
 r4ujH+j5/Dj9iLjiXy+kWWxJRQldvnxLJ4dbGxo/lQEBrAoEKFYIxgXpeLoTw6pvq+gWxa7O
 XkklMbEOlYr1/XY2GpsTvhsjOQrwoG2jvZ5nKzxVvlvMDjSzoxB6N69PxkWyqc0WUMlpVY8s
 twrgWknqsSNzzstmDBwuKNcBdQmk+9sRMZ4JUupk0aa6QyQvtst4AFlXkldqsoLWbBx60MNv
 JhN83Y7OY+SyLhU1np+lNix9GhRR0Ib267a3lHvsSU1g5fl2xiw30Zw9QCnmwB+IhVceg929
 j5
X-IronPort-AV: E=Sophos;i="5.82,221,1613451600"; 
   d="scan'208";a="43037078"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMPxztCPWbH2lNlxQbpiJP04RcEB5MyTec0ulxC4B3VMgoyIuFs/emqtQiWW+dNraZ8x3Rnb/LiMXoa6LnIyGbOMq9ecfWJNG2oS90zGqSr+APTNbKb/bHvd0URuPX4DfgAvu10Hze60Lvag6+h/BcqweOqSS1bQL9kzBEQD35TPFpMoKF/7ZgZg+/qRF+rWy07z0MSVajA2IK9Mrma1iBxkx5Aunpapt7HO0HIklZy5JD7ylt8PvlzD3rQIYOkUe/xZ608yT4TPhY4dDmRud3FfRLpMnVZneozZ9oIQ4KtjQt0OD3dENP3p4N9h0dL/g77RAkaBz9vw0x9oQAhErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0KSdhxdbmY7WYtVzfLnZqivsWL3jfFP0YsE3yo6sMM=;
 b=R47QwC772sxF0dXc72XQRHAJPGNnSrMd6sOYgXrbs4bc9PekuOJY7NcvwogKNQrlG7oMgSOz29tcLIHoRhJfCpE+c/jp9tHVX6wgP4rMUaZSJa2B/zzAcQyO7GLjfy9KwAEPnY029pNJU68ZpAEF7g3lCwdzonaJTD/lwJyXh8Us3Tr/55VPum0su6ZC6CYtjIW0TNWhozj8aGvsCdF63ORRb/tEthhtO3gbNHSYb+ZvhCP+Y1T7OLG7QpJvY6n1fkvQkw86jm4t95uTA45u1He3FJX6Wxux14gws3GExqPi208zQkXSE/+IxZxBuhtWSbGoskKr39zoPbEGPDOqbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0KSdhxdbmY7WYtVzfLnZqivsWL3jfFP0YsE3yo6sMM=;
 b=nRPVSSBC7VuYeUsNOHuOwkIWkCr920/v+XO5kDPBskevuGtQFqVDdzwx7uDjay4pb3GwIztDSlNg0qAkf1h02O+TDwIhF/yhMQqPoMCWHOwoPQumiVeYqCUBsFV9bRW7s4CYDtDzwM57Nr1N41ljhUJ620OOI4852FNOYQvwDT0=
Subject: Re: [PATCH 1/2] x86/amd: split LFENCE dispatch serializing setup
 logic into helper
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20210414110433.83084-1-roger.pau@citrix.com>
 <20210414110433.83084-2-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <fadf1eb2-6d9a-2488-14b9-a07885690ec6@citrix.com>
Date: Wed, 14 Apr 2021 12:11:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210414110433.83084-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0081.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aea92d03-2748-42f6-49e0-08d8ff360f63
X-MS-TrafficTypeDiagnostic: BYAPR03MB3736:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3736F6204F52ECD0EFC2B7F3BA4E9@BYAPR03MB3736.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uy1/wGAHSdvLk8nXiHnE63VkSnjmVrq6f+eRIjxF9oeZFGQbjUW4xzbTm3A3caDf/wkCLSzd6k6oU9UnzNm4jRyp7FRpLnYXzlx1sUQClWPt52B5dQJQU7H0IeQvHhhchV0LfH8dCjsc5BFk+PlsV/Bw+2tj9Y2dI6UdXQIQPfZZUTMZm/eWPXvCd1FTP6G3aydOrbpfRpg/rW5FFgUajKRgtzzGBRm9hfbhGQPHIrofDnTsT4Yq89D+AmakgB/HhRD3FiQRFkWzH+ib8Vc6IPRQT6gyKXlGmiyH0u9kwf4VARUrAsrTlmzIbdflpOfJ6PilA6+gRTnqc2R+wvjT/6bFBRkV7x0Pqli8azQMpksQq0+XadCZYOVjSUU43nQjy02uufB/1GberEeLsWSxhCrOEVob/OFkXg7YAom4S8hnLDc4r+qi+nq/wahBmpzu638yamCEEh91p7hcGIBRn86a1luYz5TK8OfAdWn9FXNRJTCnqRe+66pzc7RH1LGv3LtfDbbAem4d6UpJ1ENaJhzzwDORHzdxBDdDa1HJxqvWywzrMGDEu7Q2NhIHqFlXmGD1sAN7Wai2JFbTcr6mFAJkazVywe1hhN8nsHxLwAJg7k4GbE3WiohyVzHZjdfJsW8ljWAt4lF+njoH2fYYvVPMv6zJPcNaY4t1xs3CyHfGMR8CFMNMaPZ4XuP5fdxp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(186003)(8936002)(26005)(31696002)(6486002)(16526019)(66556008)(6666004)(53546011)(2616005)(2906002)(16576012)(8676002)(31686004)(4326008)(478600001)(316002)(54906003)(5660300002)(66946007)(66476007)(86362001)(4744005)(38100700002)(36756003)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?alQ5YTgyNStmUlRKZkIwWkNTOElMN2tGWWVjRm4zUXZxRU1HenRyVWNWQ1Z4?=
 =?utf-8?B?Z2doUHVRNmU1d0VGaXVlWFBOSkt2T0dhaWdtV0JFVDZTQ1FnR21IVzdYa0Mz?=
 =?utf-8?B?QXhCV2xJUzBML2QrL1p0R29od0Q2WmVxS0tOT1dDN1RJci9pMjREWEcxWmdZ?=
 =?utf-8?B?UjVOSVpKKysxYVUvdSs1V0lzcFVzYkJHTW1DaG5ia0owWGxyTTNqcnV4M0lF?=
 =?utf-8?B?dGdlY2tWQ1k3QW4vbndldW01azN4cngvZmNWOEZlS1l5dWtmdTB3ZndOWDUz?=
 =?utf-8?B?WFlNazJsZjNqU1ZLSE1FYVlrYnkzNXdPQ1p4RFZ2MUJSZ05UdE9WZ2hmbTN2?=
 =?utf-8?B?ejY5MjlFZDZsNTZRbmJoc0FadUFWcUR6aUJwU2RhcUREamVmNG9BQjVlOWFx?=
 =?utf-8?B?KzRFZXMwaVZRbVUxQVB6SFlScXRJc1AvUXJQTnI5R0kwcWtQbHpPZGQ2d3lH?=
 =?utf-8?B?Z0dubmRZVUJzYThrdnFtL3BjaVdXZjZ5WEtLS0ZKcEFlVVE2TjFQSUVwZGQw?=
 =?utf-8?B?REptK25DTVJhVXZKNitVNVEza2k1V3labURRQmNLOGZsVU9sN2xrblVRQXdQ?=
 =?utf-8?B?SnBTZzFndUVhQVZXSjZjRGFRbXVSVUNSYkdaRnVkZmYvTGtDdzdBQ0ZuVVd4?=
 =?utf-8?B?TWdpcU1QR3JYQ29sbFU4YUx3L2VWYWVwN3lUanBkYlZ1d1hYUDRHdE9wbFhQ?=
 =?utf-8?B?VVZ4TWlXYmJ6L3B4QzBLQVVQQm1ucmdXTUdWa3BtY084MnFLMCtJRE1HWlQv?=
 =?utf-8?B?amxhZ1ZxaEZGRzc1V0dNTDNhQ2lWSjR5bTRZRzBKZ1o1ekdza1ZaaEg4czRv?=
 =?utf-8?B?RVNuZXJITG1XNzJuUitaejF0Z2U3T3I1Mm42R21QUUZZUUV4c2wyS2dQTTds?=
 =?utf-8?B?YjU0UktMbkhiNjBRZ1RZSXRzLy9pRzlTRTVIQzc0aVlCS1hNWHJpWnlTcGlp?=
 =?utf-8?B?NzAzZ1FLS3hpSE1uM0FjNjdqeExYMW9YekwzZUVzQlFnbWpWNytOc3lINE9P?=
 =?utf-8?B?YmhvV1dKcWl3aUFFTzhlb2NTUGpZMVNFd0NVUklMdUNTaThDcWw5SmE0TDJ2?=
 =?utf-8?B?ZWt6amVHRzlwbDZOMk9CalRsdXQzUWh0NUxEcXJWc0JnNng2TkQ1eHFHVERD?=
 =?utf-8?B?a09KaVczVEJ4czI5cGtabjZZY09mYjlsNjdjVFFrRFd4MjdqdUhCVzFFSzA3?=
 =?utf-8?B?SEl1L2M3UVIxYnY5cm8veEJuWUtNMnhsbHFjT1c4djBNWEdYS1UzcWR4ek02?=
 =?utf-8?B?K1YrcStaRjBHMkNqUXZaTzdpdGZWWDNaamx2ZVFKK1RYRW5kcDhweGVHakpF?=
 =?utf-8?B?bmpyNnJMb05BdnRHb2FZQ3htY0RjTGtlaFVGcGE5MlBRck4veVY2aW56M1di?=
 =?utf-8?B?Um00K2hCaXo0UUY0c0VxemF1b2M5UTQ3VnpERFh5MGtrSmNPQ0JTaWJBRVdX?=
 =?utf-8?B?T2RZc2g4cXJnQ0MxenJTTlpSU1NHVVFjZVgyWXY1eTA3ODRZTXA3Y3l1Ryty?=
 =?utf-8?B?Y0MxTGpSWkVhMkc5Y1N1NkpqVEtjMDVEbC82cVN5RnhWbWt2SW9KMWJMLzlL?=
 =?utf-8?B?bHZwMy9oZ3JVd2w5b2dQT2x0REgyWHJkbTFMSVBwWFVGaGNZVElvWmY0K2Fw?=
 =?utf-8?B?MmJ1Sk9HbEtCU1U0U3hiVWJiR1BrdVhCbU9TNjNxYThzeUZZUlg0WlZpR1pR?=
 =?utf-8?B?MWJtUlBxOWZxRnFvV2hpVTUwS1N0MTFpUU9tVEsydGcxeG1oZ0k2MGZJbkQ0?=
 =?utf-8?Q?MlxTvlVeV9ZjQdyp/vQHMg3rsUPYAnNknRiKawE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aea92d03-2748-42f6-49e0-08d8ff360f63
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 11:11:32.8265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bckq3Ai3Xj9TT5ra/d4AGvuZJJ2xX4m0J892ghULjGh7Tw/xA43JNbVhN0rRNWwmE1j0l5ZF8mQHEJDC6kxuUGBEB3rvmee7iKSSi4kEMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3736
X-OriginatorOrg: citrix.com

On 14/04/2021 12:04, Roger Pau Monne wrote:
> Split the logic to attempt to setup the LFENCE to be dispatch

"the LFENCE instruction", or drop "the".

> serializing on AMD into a helper, so it can be shared with Hygon.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

