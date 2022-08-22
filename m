Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B16B59C11C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 15:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391440.629266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ7vs-0000KQ-FJ; Mon, 22 Aug 2022 13:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391440.629266; Mon, 22 Aug 2022 13:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ7vs-0000HF-C9; Mon, 22 Aug 2022 13:57:36 +0000
Received: by outflank-mailman (input) for mailman id 391440;
 Mon, 22 Aug 2022 13:57:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQ7vq-0000H5-UZ
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 13:57:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80084.outbound.protection.outlook.com [40.107.8.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ef7e265-2222-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 15:57:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM4PR0401MB2260.eurprd04.prod.outlook.com (2603:10a6:200:4b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 13:57:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 13:57:31 +0000
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
X-Inumbo-ID: 5ef7e265-2222-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+IjN8e1SJMxQyax7zl5fR84Ql/hGWzCifK1hX7gfdAvqNjB0XEb6keHywZnMnssgFlJhXZbZYEFXYh+rVrdvak79KElIJDq6GcCLe5R3cb1RMiMgm3neJdRSZpTMyupOdvXUlRDWqHY+cYTeOYCBABJ/zq3oIB22DqRP0qJEB303bXZLYTvnQgFoomdmvnLGEqj8il9GaS51ssSz5bOiO63cOXLhn0T6Eb60m5obO9jDzaCX2xa/dy28sUasNpybpv77QPQcl2MRK86wmPTJzyaB+ItcOa5Sg2ojXYqc4y4sqyZuFc+18MDytY4i/ii1BnHAXyq9QTb7o7D7KtFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOhoqf85HhXvVaBx4frqSYxmu+xXM13k0MZJKwJlvhI=;
 b=FgrDDrHRIh7ZY9Qv7+XVwcJkeDWyuxZrCLJnhy74vpDluthl8JLaX1QUotRho9LetWrinOSi/+zJOz7UWLC0ByRqM9iyQRlPTRUcJDSOV2z45gNrcyG0lW2QIM9wJfZhwLRffGhZ1Aa9wn1m7GABJzaZO8nzv3BzlR7ptbhwWyq2lACRbp2ksN9Sv71L7uHkAatP5Qd6FlfdNBhMp32PciuPEvwX9dMii6g9Es4KfbEoTWHjd5E/BC5CBkyms2xQb4Y6KWU071tXvkKniKb8C/kKT5mxIinC3klVS3Ez99feOmg4F+z3ODFRb3JCo36f6j9juB3YnnRGk52Ceks9Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOhoqf85HhXvVaBx4frqSYxmu+xXM13k0MZJKwJlvhI=;
 b=kkEPvhWaqLCPS+sCPtd/Qpq4a/gNN6X0Nda/24ztNLXPxAEHw8SYwCUEHpbJTGV93s9M/+5BZJgsAVl5nD/s7idYZPkCBrNZKlZRBvBggAQJL2wz7KCW0Wnw+4+fo9ADNylNxoTTGwZ8z1Ex2Hw8ElDityASHGx2n2E5Ext3jxDx0c3sscKYXF84UGlJQTxZIYlSXrlQd5DbWMGhqtv5N5Dtt8DL2YkLkqTFk+CZN4wcf/f5k9MhxhfvuJ/NiM2rR3bNPnZGMW4HFVS1kJdVeQFVbAS8wdym/mgQFX0svoEbZ/AbPIEMdW5AxlygdkHeDWNy1iPD+/l5SCJ/+a21iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8c439b00-4ceb-0119-fd2e-a7ab240e403c@suse.com>
Date: Mon, 22 Aug 2022 15:57:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 5/7] xen/evtchn: modify evtchn_alloc_unbound to
 allocate specified port
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1660902588.git.rahul.singh@arm.com>
 <02234e7aab1e8f3d18e5398f1c4745203df77364.1660902588.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <02234e7aab1e8f3d18e5398f1c4745203df77364.1660902588.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0062.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::39) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce19c587-7341-4af7-8bbc-08da844641a6
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2260:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2GLUe0DdlkT74pYxrLU6tbhY8Z6kt5HeDDFMcyA9WUMVXSR6dDmhCge+JlLqDQu+N9Xhbk4AX+rV8x+oMhm99cv3lakOsD8FZmpQNOPhNFZR5dyUfohqZpEVcw42/1LhFLOrQHwI3OTAQ2ci/hv683/S/uva2NOWB6JcDQaVHaYpmPKQSRD7ci46VqTDr/6+Pi1OJ+34WcQx+Sm9CCNFXwHxO1HRrzgpFoHy9/cRqijFBl/51cXWJaphVilGbEoBhIEqUkHFLy6NPAwKF+T1YISoQU9NzOgNIgpTVOjwig++pERDwFpUQzGyslHj5u/bfSuGYTtVznFSdulsVd1bGEhwLged7wmTCfNkQtLKvciDN4G85PIa/DyO4dUrrsv14fnYYiDwpF7Qnp4x2dt8ZcFiZ/e1ySPnWPGXglxpxX3eeTcbxNklb+NmxWvVl090Mwr8rgIsOdtrsPbQu7VDC0WE4THuoV6SS5flLiFz337P6Oqj2H0gPzPzFiW2v1hpWBn+NXl0uw0o3/MbAm2tY7IgBHn/YsWPw+8G5eOSkArNAfveKjh5GndiBB98mZPKvBTB9+b4nw9RKbhKa+qzPqOLR1SmVs4YDjf5oh0VaGZpP9eT+LG1JrG0bbGbz925274S2tlJZJWigyTxDSDq78pzg9NoV6k/nQ4BXQUzRQGYGRwuf/LErzkEi4X8SRJ5CYX1yvdmP2vtZz2IVGJQwe9P+7ylZVElHo8v43ESQwucq6cDuGHtQv9kSlXlt/Da3eV0RJ2g97yL3sIil5eTZfGdL2+EYP4IOxz33mSuVHo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(136003)(376002)(39860400002)(396003)(38100700002)(2616005)(36756003)(66476007)(54906003)(31686004)(316002)(4326008)(6916009)(66946007)(8676002)(66556008)(4744005)(26005)(6512007)(6486002)(5660300002)(86362001)(31696002)(6506007)(53546011)(186003)(41300700001)(478600001)(2906002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDlGa2tObkNtMjdhWlAxdVM3YjdUUmJkemswcHFadFUxVzdJK0doa2ZNcWg1?=
 =?utf-8?B?NUZiaE1JU3ZNU1FOQkVzTm1rQmN5YnZuK1htYnB0N0tpTzZZNkdIbTV5b1di?=
 =?utf-8?B?MlFtVGlobnBXb0RUZW1aYnJJOXl6ZFlueUhDMngzSkxqSTlqdmRjcUVtK1NG?=
 =?utf-8?B?WmJtL3cwcE81M2ZEdEl4YnFCUHE4N25qVC9Uc0dFYVpxdk9WNWlyYmhxaVBR?=
 =?utf-8?B?azJjZ0pHVXQzZUE0alppdHJoU0ZXd3RTSFpKV04yMFFPSEdFMzczdFVrV28v?=
 =?utf-8?B?UTdOWjYxMFVqK1dURGZOeDRxd2dzR2VaM2JxT2VLVlg5OFRWR2ZZRnRZMWs4?=
 =?utf-8?B?UXZ3ckE4U28wSTNraWVUWHR0TzZybWtvQW9hQXBOZ21vODJGZU50M0ZWeTFZ?=
 =?utf-8?B?cSs3V3F0V2xGMVRXcWNYN2FhTXVuLzVsZnpqeGwxLzQxNGNQTlM5N1NTdWlV?=
 =?utf-8?B?N09NV0xOUXJQT2Q0Y1NlSTVqRnAvSUNMb2NOK0hIYldVVHJtR1hZakkydk1E?=
 =?utf-8?B?VjN6US9tK0pVOWxnNTAwTkZZbW5Ka2lNcm5ydmNDVSt2N0RrZHRSenZZMHRl?=
 =?utf-8?B?ZjNGaGEvY1FGdEVyR01waWtITE1tQ1B3dFhhb0dQaUQrcTVUWkZvdHpwVEM3?=
 =?utf-8?B?UndKajVhK3ZXY2MvUFNsVERJa2NDcWU3UVlhMjRyUkNsYThvem4zaURTTmY0?=
 =?utf-8?B?VGJmM0pLUmFCSTZ1cENyb1oxQUJ0ZWhQS2xzZi8xMHFUZXJPdWtLZk1Ka1lZ?=
 =?utf-8?B?V0QyNEVTMGRQWDdsdUYwdnVRNUQ4dzVxM09XWVREck9QeTc1NGw4TDBhTnEr?=
 =?utf-8?B?UENjdkpwMmV6K3J3WUpZSDdJaU1OakJXQ0xVT2E1cUVualVMU2hWOG5MdDBh?=
 =?utf-8?B?WHpkdjFPcG5ScVA1T245NDVsRXpMeCtCS2hOajdkTU9oMnNIWUJna0tLUmNX?=
 =?utf-8?B?SGpWRlRGcUw3b1AvRWczWkdobWd1Z0xhd1NxdXVIWURvUzh0VzAvODhqcVNH?=
 =?utf-8?B?OHNoTU5YSTdmM0dYMFIzMjVYdStyVlNBVTI4OUQ1OVVWeUNOU3hiT0VaMzd4?=
 =?utf-8?B?V0RRZWpUazJmR1Byb1VDQVR2YUdDMTZ6K203RWF3WEFJK1RoQWY4Szg3bUpC?=
 =?utf-8?B?dzlnNXEydGtOQ3lKamVaVFRzUDUrSUJjNWRpcmt0V3hNdkgzMTg2U0NUOE4y?=
 =?utf-8?B?UloyY09hZmFRdDVXdmxBWTRlNnc0dmZUUFlxRVFaU2k1eEJHQ3dwQnlCWVMx?=
 =?utf-8?B?N0RRM2k5QUNsSkxMcDFiZytobWNiUjlXRzdINHV5a2J5d0RVL1lNNnhVNnkv?=
 =?utf-8?B?TU9kM2VGVGlRNUJHNGxBQkorbTM4RGw4Sk9ISUF3ZW1YUjFKQVVqaEcrWWNE?=
 =?utf-8?B?Y01GNTd3WnZDQzhYbHljWnBRYlhib1BMeWl0bGNNaExnbGNYRGpKR3dxWGd3?=
 =?utf-8?B?bTZzYmtUcU1DaVdDZkc3VEc4WmRnTFNwalg2T0xCUlo0UlIybWcvbUU4Y2hu?=
 =?utf-8?B?eGRnK0tqeDdjV1RBaW9DaVhBd2dWa2hvekJUREFsemVmMkRra1hhbzNHbWQz?=
 =?utf-8?B?cVIxZXFYenk0NTJtNWRYQXpld1BTcmZibHlWYW02bndmZzdob05nd01sRFdE?=
 =?utf-8?B?MnZWQlY4Q1QxNEdzL3N0dmZFcDloS0l2OHpCQVZVTW5hYTIrbExWN3Q4VUhn?=
 =?utf-8?B?VmZiOG5KRTIvODFDbkxXOVhOcFVhTWQ5RVdpTFdtd2hQd21pQ01VWjE3V0xB?=
 =?utf-8?B?cjNMbk5TV2RXVzRML2Q2TGJKdVhsekppL0VxRHRGOHZYQ291WHlvYnhwbDBi?=
 =?utf-8?B?dkhuNmI4T05RWGtWSHlzRXRSYUhUbXlZbFUxMGRZU0grbkNEcXFjeUtZZlFs?=
 =?utf-8?B?Z3lUbHF0ZEprME5aV012VmFQM243eGlWVG1uQkxUSUZwbmdyd2ZKNjR5Y0oy?=
 =?utf-8?B?WTdsOEU5Y3BuZVl3Yk1JNG9EL3NPUFE3aUIwZDBXSTlGQXI1MU5ZdXFsMVF5?=
 =?utf-8?B?RE96NGp5UFNmQlVIZm9SOS9kanAwRHovbmF4eitXdWcyTFVaaURxZEdsYklR?=
 =?utf-8?B?NmtRdk9VN1lhY2FlcnhKTjlGNnZ0dkdydnFTQ1R0TTFWM0FuSjQxUm5xZk9Y?=
 =?utf-8?Q?CHDtLGaJ8gdLM0apAexHTv0/i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce19c587-7341-4af7-8bbc-08da844641a6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 13:57:31.1451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZ6eAqfLIDnVN88tX8rPMJZ3UHf3/J+Tw/1g12FQX2ZJu/rfEMBW+/yw0M/PkiGWSYorQ+qWnSfDoh0WYjm7/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2260

On 19.08.2022 12:02, Rahul Singh wrote:
> evtchn_alloc_unbound() always allocates the next available port. Static
> event channel support for dom0less domains requires allocating a
> specified port.
> 
> Modify the evtchn_alloc_unbound() to accept the port number as an
> argument and allocate the specified port if available. If the port
> number argument is zero, the next available port will be allocated.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

As a minor remark: Personally I'd find it more logical if the alloc-unbound
adjustments came ahead of the bind-interdomain ones.

Jan

