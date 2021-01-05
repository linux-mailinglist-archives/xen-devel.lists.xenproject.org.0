Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A9E2EAB9F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 14:12:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61943.109305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm8L-0000w3-5e; Tue, 05 Jan 2021 13:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61943.109305; Tue, 05 Jan 2021 13:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm8L-0000vV-0o; Tue, 05 Jan 2021 13:12:21 +0000
Received: by outflank-mailman (input) for mailman id 61943;
 Tue, 05 Jan 2021 13:12:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onuC=GI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwm8J-0000uk-IS
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:12:19 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 258eb589-bd80-4938-9274-6b84a6b61366;
 Tue, 05 Jan 2021 13:12:17 +0000 (UTC)
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
X-Inumbo-ID: 258eb589-bd80-4938-9274-6b84a6b61366
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609852337;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=JJzjdVF2VlMNFrJF2xKqvkD1NSGOLlsrHIMsWjCiJSI=;
  b=exIUj/CW5eHgZlEC8jsZuE8TxVkFX12Yjh4A0PdsHEVgZ4zaJAekx0wx
   kqQ2V+4YGgAHAdZx9MMEHczfxyCsPWM+uGnfDaSHCaoZpo//lARwh1Pm5
   C0K7Q8k2hl+bDLMMG8N4B4RtIprnFjL3XekWnDUJ2kpNXkKb0KxqBQaCF
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: m3ucHoJD55r3Vw1CdBHqyXsr/KRI6QJ921LRECvvl7y1xzQAMTe+tpEOQJwbmHr1DCDIzD05yD
 d2QGoyyPF9YXBcCNpH4zy9MxcEs4TDdcJGv9Omlw7iwR5/j2Jbdz6d7b3isA5YDV439bQfcr2A
 ifn18PVvFs0VGAFdNL+8nlKemXI1Jc2sUaJRBKp5kVZiiz6/ZfLwZ/AKqUtuzJLT9zNlVXXG9G
 r6St11ivV452cqOHdciKQf8HnFUR/A9hbcTkYx80CNnHHa43jYnnykvU8SrNvo/Wb38uZiNXQL
 Md0=
X-SBRS: 5.2
X-MesageID: 34415028
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,477,1599537600"; 
   d="scan'208";a="34415028"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cz3j4DLsuMeP2GtPfrd0+Naja0nOs+Xo+8B6pkZ9AJtUa4a+5AaqcAvV9d9xOQDr4T7KCz4fNAN9O4WA8MeRuB+eEiqPmeyRwPyJNDdtqdOwLVVAR+xrC/66PVGCw+oDqb/qOjl1chERN9FSNcsAGTAHcAOI4zYAoM+95nLXM8JkbIHLLsl9w126a/yUzy8dAirhyCBj0dSQXc4s500oKFu2P7Je6zGXIXsHi/MQStAF56xcDEsBjkaElspeftu6JfcdTCiYQpzb41R+IZHNlDeHOvTDxlYwBKEbPtvDfXWKZT/Jwf1vm05qXD4pyckv12g9j01NjExqbLWNBXudIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJIMqH+zSSaz3lWxj5+X6LttCdzUqpoDWqaD2upskak=;
 b=DJPSRVd+JVN1Wo4+vKc+nzWMHYDWyYdKr+SXxeznUBKcREb0V11UdXh0vpXEq1peEJIGdf2H0qbI0g9ogTdoLva0ibSvnnAj3YSRdrNM9y4g3Y1qykwWRwp8js/ITEw7A+R3KZG/Md54vOJJ4zJyzXKYe1oQSxNmCmwR3ICaKqEoO23IfAEMf9x9Fx3kK+tIQOZmPdYbCJW0YT0ngt3XXuhmsqdfxijbPp3bP/ycCPNQK+1EpXSymPjXKpcwBCUGKuiSF4aXpKgAr+cKUhtwkN8KMPNadJVDkngRsgY3DdQrpl1leHuIVud4l/dE2FEg8KDVvQO4PC9+euM6jGcEgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJIMqH+zSSaz3lWxj5+X6LttCdzUqpoDWqaD2upskak=;
 b=TRDA8JUClLTPhKoIVcTIUClRlc8oVKUdyIvU3XxygHkNzyZaGEmtdB+QhVx4N8f5AdsmVHPh3a9Z2PsC1NN6hxxXjMCMB9u2/xJ7JTTz4s68FDXykbQtFNMA/tGrjpS9lzA3/j4QqAxbKDw7h/pCLdhLxtZiHvQRfm+4qvbcj8Y=
Date: Tue, 5 Jan 2021 14:12:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] vPCI/MSI-X: fold clearing of entry->updated
Message-ID: <20210105131204.e6kboucvp2th5kor@Air-de-Roger>
References: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
 <e642e8f9-be34-8998-66ae-3fc64dcb16cc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e642e8f9-be34-8998-66ae-3fc64dcb16cc@suse.com>
X-ClientProxiedBy: MR2P264CA0170.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::9)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c922d7c-2dae-4fdb-9b08-08d8b17b8252
X-MS-TrafficTypeDiagnostic: DM6PR03MB5067:
X-Microsoft-Antispam-PRVS: <DM6PR03MB5067D7CDE1617A4BA37559BD8FD10@DM6PR03MB5067.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x1608YRo/jEt+fxmZrZ0jMbU6C0CfK/ceU55v0iLpg7qmSQK52cYmvTsJNHqqLxfW7uYhr1RFJa5TBmmXU1ed3M8KjvywP3vCgyqTSjDufKfiz1/se8rE1lm6aCv9dyLeyx+UgQvwK02TkMmWgd3ArgkGRGzFouilD4L2GluJuMElpJ4uCBkQI5TJFrH7b+SdBS4BreWD5cMfiXTB7NV0sUi4m4Uc9LfY9xErCgIJU9lQiYibHXosedGM9MqFuDyWoGQLmSTX8jOq3Nu6w+Ch602m1mHZzzTHwLOElSJZ99+Gi2YqHj5tNqcw3P+TNwz6zonvWkdgdzr4Ya8LiIr3OTpFA3cNieiSo+JvdgBjvI+Pb6Nb3pVvO6MPXxsVTCgVUHV1RHYSj0wv7hNTAhvXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(396003)(39860400002)(346002)(366004)(376002)(6666004)(6486002)(26005)(66946007)(316002)(83380400001)(9686003)(86362001)(8676002)(2906002)(15650500001)(8936002)(4326008)(4744005)(186003)(16526019)(66476007)(5660300002)(66556008)(6496006)(478600001)(33716001)(85182001)(6916009)(956004)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VkZuK29xYUVxMTBySHhCNmtNY3NJRGR4d2hYUTk5T1pXVnNxRThYNW4zczBK?=
 =?utf-8?B?NVVpclh3Z1pXQWo4eUhaK2Jua2N6bUhjT1lUTFZXK3V3MEhJTmhkTXhieU4y?=
 =?utf-8?B?NSswT3lBbGpxTTErQXMzazVqZEc4M1l5dXErU1M4RE8xNXdoNUpZR2RObmVk?=
 =?utf-8?B?U3I3L0J5OFIyeHh3S3l1RnJaemxwUzhlUmZreCtaVHJOazEweDhhUS9rVmdX?=
 =?utf-8?B?Z1FIbWNQbkJ3WUZWZC81THkxWnZuSGJOb3hIWW94UkFkRVZKaHRWSlpKTVlz?=
 =?utf-8?B?alJpT1BuTjNMK1R5SHBnR3MzWWtFck9oQ1lGRjRyRk5HVG9MeFp3SFVLdlJL?=
 =?utf-8?B?YTY5ZkNHdHU2aTQ5Q0RRRDlyVVdRbnBnenVvTWppeTZHSVhHbmxoQmRmYWE1?=
 =?utf-8?B?MCtmSzNlK2hnY3pSMUlxMnF5NWxvN1lSRXhZWllscmw2R2pJK0NOS3ozcDBy?=
 =?utf-8?B?b1pjempwQzNQK0VOMVJsVmFlYlZxaXhPWUlkSWNJWnl1NWVZWk1tNEwzRFJS?=
 =?utf-8?B?T2J1OXRuTjh6Qm1CTjF6dE5jRi8vMGtKdmRaa1F2Yk9uVjk1N0VmU0xZQVJE?=
 =?utf-8?B?dnR6WFBsejlwTFR4MWlCamlDRHNEYVQrUXI5WisrTE5LNGdVUjBjbStKNUh2?=
 =?utf-8?B?ckZ3bHp1VS9mN21Fa2FtbWdrb2N1ZjVYVTZLQkRzNXpyVnVxQ09GSXZlVjE3?=
 =?utf-8?B?TTUvc0tMeGlYMVhpYmNEeU56Z3RPdUwzN09qVWFVcjNLVmxReDJEMnFoY2c1?=
 =?utf-8?B?eFBxRWVNZkhLb3lPVUpab1A2UXY3UnhqUjl5R1hvazdBYVZlZWNBVSszMEVQ?=
 =?utf-8?B?aGJsdm9hQmhGVWlNWWlwd1BwZUdDcStwQXVwa2tDMm8wbTl1SWNzeCtkTzdE?=
 =?utf-8?B?N2lFT1lmSnE0M1ZZVy90d0hxZ3lFcGpkeUU5UWg2dXVxOFVmajhRWkhBMzVI?=
 =?utf-8?B?ZjBLTFFCN3BWa2JGV2gwcnc0WnNSRGQ2UCswZnorWUV4cjU4OTRHUnpkWFZF?=
 =?utf-8?B?S0RuSHJTemdVT2NHcC9EY3pOTVFLelZ0cFRadUhPVzBFZEtUZ0xobXhpVnl1?=
 =?utf-8?B?aXRUU2ZaSXFFYVVVdGhBZUl4VjdFRFp0WWNVZk1LUmozTlY4UUpUVDJqT1ND?=
 =?utf-8?B?Rmk4NjNycGh2c09oM3Fjai9vREhnQXdpK0JRWXQ0YWNtNlNsSUsxa0ZabDc2?=
 =?utf-8?B?d3d1OFArR21Hd3E1bzNOZ0RadlR3WmEwb3l1SFBpK3RzeUV0VEVHdFh6aHFh?=
 =?utf-8?B?OHhwY2hHd3VOK212TEFUTkxDM0lIRDB0Q1Z0MVA2Q01TY3ZTUGlIU0swOEV2?=
 =?utf-8?Q?VJbkFk2bi5bhATX5SRNvIkLHgwzusuzwuY?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 13:12:09.7863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c922d7c-2dae-4fdb-9b08-08d8b17b8252
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gK6XD8e8QtOAmwljp+CDMAKWUfhn9hxQ9d6hC46Gu0HnW8ldUaaMkO6f4ooU5rVhkN1R/ZQfjJdKGeBLtyypCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5067
X-OriginatorOrg: citrix.com

On Tue, Jan 05, 2021 at 01:39:54PM +0100, Jan Beulich wrote:
> Both call sites clear the flag after a successfull call to
> update_entry(). This can be simplified by moving the clearing into the
> function, onto its success path.
> 
> As a result of neither caller caring about update_entry()'s return value
> anymore, the function gets switched to return void.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

