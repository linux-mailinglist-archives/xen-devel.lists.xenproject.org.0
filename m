Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DC63F86AC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 13:45:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172942.315575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJDov-0007Xk-KH; Thu, 26 Aug 2021 11:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172942.315575; Thu, 26 Aug 2021 11:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJDov-0007VN-H0; Thu, 26 Aug 2021 11:45:21 +0000
Received: by outflank-mailman (input) for mailman id 172942;
 Thu, 26 Aug 2021 11:45:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q24O=NR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJDou-0007VH-CT
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 11:45:20 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16018d4a-0663-11ec-a9eb-12813bfff9fa;
 Thu, 26 Aug 2021 11:45:19 +0000 (UTC)
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
X-Inumbo-ID: 16018d4a-0663-11ec-a9eb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629978318;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QP8uXsb8Q6fwgJZ9M9kV7cbSDs2T2CWo2VqPqqJd4oQ=;
  b=hZQ6eJRuHXuJR+LSDgi0oL9xdPytKDdbVC4RjC8+i32+/5fyuiYsQay6
   FuZOGJGHlSw31RpVhRhWOsrDGqcWELUCmT8QuHPVPiaXqIlWnaSzXihHf
   ZR1I2yfeXyDRwR4WGRPvRb7qTqkt1Trb1o++hzXCIy+WXVEIMURBzEQxC
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: oZL5sevcbJtElBc7JAFNQft08XXr7ecgc8IPu34eu7DlOeQdIW33nVuVeB+iPSFHkOdeo9ytZP
 GoOkzEe8J+SNcjzZu2ZNcCmdCunX4sLtIo1Zo7fSPy4RQKkOb/75BTwR9L3DK5zp1+Kl5jMqqT
 N+hXUrRVglI0OuElxojpiY/b8Uw8e6Z+r+oHZ6mF4IDjBl9CzJ/DKonZrkqMRp0CLemxO/+7sS
 zPj3EdZRSGuj4dt1sbQm1PpVMbo2vSaEGSW9tEyoukkAeLyHEvi+WZC+7hBXO+LHLYP6r7pWD1
 HRXWtpFiDvf+dI1V4o6jkyIO
X-SBRS: 5.1
X-MesageID: 51355897
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:030xgaFoBWPxhBKSpLqE7MeALOsnbusQ8zAXPidKOHtom62j5q
 STdZEgviMc5wx8ZJhNo7+90cq7IU80l6Qa3WB5B97LNmTbUQCTTb1K3M/PxCDhBj271sM179
 YET0GmMqySMbGtt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.84,353,1620705600"; 
   d="scan'208";a="51355897"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBM3qOsXPiZh7aruZZOeFFixru0s9H1vwK1HdhPA47cJYJQHB3Okud9KrTjYsaGTCdVEpGKvF/PsZRy/J9LHMPeGBfIltvmhAVeO0EDL08qOk4qHt8CmhBcUXy85MjBKPPH2I6rubTEtwDEe0OGST205Kv2StAukrst6Cve9o4vlzkMHsD1aRZM9Kdv5/gnaHqp3LfomAW1JMlLtA5dKLOlnbxuvy/b3T8OxywdzBOVohqHG9uZDmkNBxBUGA2AuETBGkEJrlUH9+HVTkaVgzxCELNAJw+cxaWy9/3UVugIEnP4U8hEjXDwcKJhkEy4rMmJ9EXoNKZNU2YaI9YeEhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QP8uXsb8Q6fwgJZ9M9kV7cbSDs2T2CWo2VqPqqJd4oQ=;
 b=XnsPg+8iqKP6G6cuqzsejqeFuYNm5L1DRhEBDrmmtvOsi4sv4KScTywSC85umpTbqUnY4w+IY2hxyzZE1Zvokb9KQtWPuwdBj+PAttmI2Yry+7TQXofrQjGupwP1xcYB5iMY2CqTWkBs7LgD582fNW4BSIrL3JPs+kssG0yVpMNkVtPyBnX03tjQZ7cN17GGBTiGQw9IfzEDIgCtE3ibROZqiuUYDbr1Y0Hoc8bp9s+ZPnc1U7fcuzFt37q5ed6bRQ+VuXIdWkwHuOhajoWT1YE9Bu6Kwj+/5bpCpOT8PsNVw0z2eilNq2lG5zSQ6VUEDThTl3oT1YSiPtpSmTIDyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QP8uXsb8Q6fwgJZ9M9kV7cbSDs2T2CWo2VqPqqJd4oQ=;
 b=vJofrMOj3InP1/Y1AVK9NV9NhEhWbOwdzZ+wQjFsjNEMQ8xvLQ83OmXfq+ROPYmz11hxru27W2QKQITSOdG6YQm8rTHFGEF4KRcMTwWn7ujQp+C04HQnXZdWCYOf8Vu8Rpc93jjr6GASV8keWfMc9cxsocfpG+f3hFHwd0uwFnQ=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <761f3ea8-bfc9-4a8b-7878-2ff9e3047309@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/9] gnttab: drop GNTMAP_can_fail
Message-ID: <871a58f1-e978-6046-db37-037ec18dbb9d@citrix.com>
Date: Thu, 26 Aug 2021 12:45:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <761f3ea8-bfc9-4a8b-7878-2ff9e3047309@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0277.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::25) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32161c43-6ed4-4c7c-e78c-08d96886f5d6
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5454:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5454B3341A50EEE298576401BAC79@SJ0PR03MB5454.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vXeYmXD+0umJF3CTtrDiTJaktPALQIu9+/DOcIkshSCi4loAFy1TK69N5IQzeauGbljvMYxNLYi3ch5hYNUz5S6Rs0nbaY/5d1GEm+T2+ZtR0Q1vNz4QIpJNl7BB9lhzWCMLyeYEWx6vY+YkmMmFVDaukCF7zhFQ/VAqXxu+4MXbek9nWWzGJRePAuN3XESWGSDJVicvtWpVDAN924OZzANjjwvWRpOmXJAu9pkht6zyLwZIWgvM/Tx8etgjw+9QV71iFUexkFtGPCXQZE8hYoJpZIbQwPvhOH2/XiVtmh7tvcU1bxTZ1rAF9whIKnhrs/sxsYhB8SDNIpNP/PYjDVUnz3JxwUtmqEPWtTctOBurBbzqEpebPuOu5RlXpOt4CIGV7Es5cH0M1UL6WDCv6yzlw8glMvGU8FEJ+IGUb/qkL0RYM4RkbWDQAZyhUz7FGZkp3Z69xt2UccY8DT0QGM5Q32khqrHaK23oJAJ56I+zbUDx4DxRkmbh5xKa6146BvX2tX6Sopk2XqHGrzXWtHfiZsif0hVVABL/qG9vzmKfbS9fqYHhGOtS3K8XRCyJ72i6F1yhUkcdcBrikelDHNaA7wp/JqyJkXmCA+LOujW7kPzDV2vPne6bdsKpczABYnZOqywtgVQvsaCfrwYmI6MnpcEN58O/YbzCarcP/xFdk5vLsnTsT+FNiOi1bXyhw9PiGMdDGuufzjt0MTGPOskUohqbaeUHNEOQrzxPgKU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(86362001)(66946007)(53546011)(66476007)(55236004)(66556008)(478600001)(26005)(186003)(2906002)(5660300002)(38100700002)(83380400001)(31696002)(110136005)(956004)(4744005)(31686004)(6486002)(6666004)(2616005)(8676002)(36756003)(316002)(8936002)(4326008)(16576012)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjQ4WndCTlhBL1hpQ3prZGtnKy9qaTJkNTBSNW8veGxyQisrYnpQd3poNURp?=
 =?utf-8?B?OS9pTjVUbzRiWXhvcHM1ZzFjQmVpczR2OHdDeGdJR2plNGs4b05JMndzSDBa?=
 =?utf-8?B?MjFNRDdjazhvdUJWaVplT09uWlNlUVNoTzN1SktwZDJ0bmpTR2ttQ2wveXBw?=
 =?utf-8?B?d0VHbkhrb2lvTXdpT1hFU0N5RU9vQktjWGtTaHVxQWFQNGhQTS9kYlJFL2dn?=
 =?utf-8?B?dEl4VVpqYmEwZHZOd0ZRYk5odjhtNVRCVlAyM1prQzk2WFV3L2s3ZUQ0NVhy?=
 =?utf-8?B?b041OW51bDVjcEZHUFUvVE9PSkYybnc3SzdkUGJNNFBmbFlEbW9Pb2ZvdklR?=
 =?utf-8?B?ejJNeVVUNTJKNytDYW50NUNTUDZOZEtUamFtam44RTRzWVNXRmhFdGdBeFli?=
 =?utf-8?B?N2oxMktuY0tDcVQ1R3FLNGVWZTBnTnEzMGNxQWgwejFzN2FxR2o5d3VVcEc2?=
 =?utf-8?B?b3lkZ2xxeHdOeXpick1sN3VNQ1ZYSS8yYks5Vjg2SmxDYW1ndEd3em91L2Nj?=
 =?utf-8?B?dzlOT08zZS9iYzIwYVZoZ01sTkZ2emFseGFva043c1BSNmdqaEs3VzJCajgz?=
 =?utf-8?B?blY2Z2hjMEVmUkxMVGhMRGtKWVI0akxsRmNuSGdzdjJhZVJDWW9LYmtwSTZR?=
 =?utf-8?B?U29hdGRKL1NHaFpERkltL202Z2RKUnFBL0E1RnpjTER6NnZma1NnNkhXSjNS?=
 =?utf-8?B?TldRbkw0b0F6Q2FDK1ZXaVFoMWs3dmwrZk1NYWZxSEtUZGsvRE9ORnJPd1Nt?=
 =?utf-8?B?ekZnY2pTb0ZtbWwveSszTmdkTjFqVnVlU1Q5Z0twZ08zNXdPUGVTc1NacnZp?=
 =?utf-8?B?OXlQN1luSjhLRFlDd2UrZTFYYTI4WlY0cFpXYWlMK0RTUGJDUStIc2dyc3BM?=
 =?utf-8?B?WEt0OVVQcXZCNmxqK1RhbmlrOGpNUUlIaythWlJJMWtlb05qckcvYS9ncEEy?=
 =?utf-8?B?alFrWWNBc3RUdjE5NHpiQ0hRV2RvbHRicE1WTjZqSENrSVl0cjlVYURBUWVs?=
 =?utf-8?B?aDFBTFZNS09XNHpuSU95UEQvUXcvdG9MRmJyb2NqRFVBV1QzVFU0TklwcnBQ?=
 =?utf-8?B?ZURpcUM1SHZVZTJUY0JMS3V1dWVQd2JHNUZYc0p4ZlNkWkQ4K1Y2TVdVRjJY?=
 =?utf-8?B?QnBuK0hSOGl1cGdka3p2NkJaQS9JaWNWcmFQZEUxUUl5Tjc0bXF1UysyNnRB?=
 =?utf-8?B?azNyRG83bWFRUXhQck1KYmVTOUd6VlF5TlpMSTNYL04xN2o0NVFTT2pKNUxu?=
 =?utf-8?B?K2R4cEROeXZ4dFRCdHNHYURLWW0wN0JTdDZpSWE3TFFaMkpMK2FlNXpLdHFl?=
 =?utf-8?B?SkNZVTJwOTJRek15K3FVRkJBZ1ovaFV3VkoremZONERvbzlBeGNTaDJpTWwv?=
 =?utf-8?B?M1cvV1lMZUhUdldkNk44dnJkYTAra1AyS1ZDUnlxbVRxOGJFRTQzVkNETGxP?=
 =?utf-8?B?Vm11L2x2NSt0RmtPK3FGRjZYS2xYRUpJdnhOdVJHcGFrQmExa2NFM084dnpU?=
 =?utf-8?B?NnI2amw5WlI1YUJMc3ZuWjJaUFhwc2hReWc4M0E2eTZ1RmVPUmhkQWJ5L3Uv?=
 =?utf-8?B?WmcwUHBHVGdlcFd5bnlUUUNUNmprNVBXOWZncUt2QzBzQURlSHkvT3hQcko5?=
 =?utf-8?B?RTZFSCtJNk02UmtBTWtEMDhGRjdRTmVFamkzOW8wOTB2VFNwc3dCR1RScDRY?=
 =?utf-8?B?WWNWQjJ4TEhyalpQMWlZak9PRVp1cTA1a0lnTWN3MWMxZ0Y5OExLVXVuQysv?=
 =?utf-8?Q?JHEwaNUNSdEXDitKsqJxZOI8H6hukHeMNs/YyN4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32161c43-6ed4-4c7c-e78c-08d96886f5d6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 11:45:11.0413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ye0z1HLSpfYSgjto9UodJXf9mFKbLtUjY4ba7TDG+SU7ORVhCUJhn5EMi24v40JiyRBKwbGM8/GuyELv43y8QcZW+N5C2KFJJi735lCOoiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5454
X-OriginatorOrg: citrix.com

On 26/08/2021 11:13, Jan Beulich wrote:
> There's neither documentation of what this flag is supposed to mean, nor
> any implementation. With this, don't even bother enclosing the #define-s
> in a __XEN_INTERFACE_VERSION__ conditional, but drop them altogether.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

It was introduced in 4d45702cf0398 along with GNTST_eagain, and the
commit message hints that it is for xen-paging

Furthermore, the first use of GNTST_eagain was in ecb35ecb79e0 for
trying to map/copy a paged-out frame.

Therefore I think it is reasonable to conclude that there was a planned
interaction between GNTMAP_can_fail and paging, which presumably would
have been "don't pull this in from disk if it is paged out".


I think it is fine to drop, as no implementation has ever existed in
Xen, but it would be helpful to have the history summarised in the
commit message.

~Andrew


