Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3137A4333C2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 12:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212978.371061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmZU-0002Lb-8t; Tue, 19 Oct 2021 10:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212978.371061; Tue, 19 Oct 2021 10:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcmZU-0002Ik-5P; Tue, 19 Oct 2021 10:42:16 +0000
Received: by outflank-mailman (input) for mailman id 212978;
 Tue, 19 Oct 2021 10:42:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXNP=PH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcmZR-0002Gl-Tl
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 10:42:13 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 611308a7-bb44-4d75-970e-4a6bd4f7e7bd;
 Tue, 19 Oct 2021 10:42:12 +0000 (UTC)
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
X-Inumbo-ID: 611308a7-bb44-4d75-970e-4a6bd4f7e7bd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634640132;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=AXneeOTQKsAlTcgPB1kSIh8tax+d8CpOZ0a2tjgH0E8=;
  b=XkBBr+nqs8+aCyr1QlAHoDuRz9d5tWUVf7d4J2BO6cJzfzfpJ2TRTUGI
   s69tGIbO16EB0gWZ8n0bAkjeYOG/BNoZp0VT9sEnpImBKjN7a1GsSl1sw
   nUa/s+BOADkWocUe+wXODCYn9GvWbWw198RqNIUEl5ahx9KsrqUUavN2b
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Mc2dfLteMG8BdqlyW3WA2KDOrHmOwrxl9v0Q1nXjIYIEyWJkHFMqA52lxxOVCVVJcsia8qA0GD
 +pDo8ozDOk/JYbAdZJyAVLajp7jplJrp70GdB9oBTt/KMYuA8KmM0f36AYQewq1GAucfGQLNbQ
 9PyH4b5dvaMM3sWOi26sTPZlP5oLculR/mf1C9ALOvf5Y8XsaW8ZmuSDJrWcssXvoEmvBWHiOu
 jkG+ynHggfHzigJoZTkt6V8H1Hj5VLJCF5D6T1abrqJR0E49RSuuGvGwQiduHR6UkDqLF21/yU
 gG39LXSbprL/wvc6b+BvNjYD
X-SBRS: 5.1
X-MesageID: 55082217
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Kd0ekqolastKipLULt9xcZBZMoReBmLMYhIvgKrLsJaIsI4StFCzt
 garIBnQa6veZWChLdp+a9y19RsBsMTczN5jTFZqqC5gFCsapJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd84f5fs7Rh2Ncx2YHoW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbCQb1xwDJTIpP0iTjtiFjx0G5xc25aSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0TRaaEP
 ZNGAdZpRAjmTDweNHANNI1kluGTtEPuWRd0r03A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9Qv5Uo8PELyz9tZxnUaegGcUDXUruUCT+KfjzBTkApQGd
 hJSqnFGQbUOGFKDYvnbBESKmXq4pyEBeeBVDucc2Ruu4/+Bi+qGPVQsQjlEYd0gkcY5Qz02y
 1OE9+/U6SxTXK69Ei3FqO/Fxd+mEW1MdzVaPH5bJecQy4C7+Nlbs/7Zcjp0/EdZZPXOEjbs3
 yvCkiE6g7gC5SLg//TmpQ6Z695AS56gc+LU2uk1dj76hu+aTNT8D2BN1bQ9xawQRGp+ZgLZ1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zoCL+LdoOuGsgfRcB3iM4ldnBO
 h+7VeR5v8c7AZdXRfUvP9LZ5zoCnMAM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3Z5LblUQPDregCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FngMqOB4Fag13DBNyuQbXVvNOHmUZpl9CppNi0wJ1e4nXMkZN/3vqsYcpI2e5gh9fBikqEoH
 6VUJZ3YD6QdUCnD9hQccYL58N5oeiO0iF/cJCGiejU+IcJtHlSb5t/+cwLz3yASFS7r59Amq
 rit21qDE5oOTghvFujMb/erww/jtHQRgrsqDUDJPsNSaAPn940zc379ifo+IsctLxTfx2TFi
 1bKUElA/eSU+t076tjEg6yAvryFKeomExoIBXTf4Ja3KTLeojipz7hfXbvaZjvaTm71pvmvP
 L0H0/HmPfQbt19WqI4gQa1zxKcz6taz9b9XygNoQCfCY1ixU+4yJ3CH2Y9Et7FXx68fsgyzA
 xrd9t5fMLSPGcXkDF9Oe1Z1MrXdjakZymvI8PA4AETm/ysmrrOIXHJbMwSIlCEAfqB+N5kow
 Lt5tcMbg+BlZsHG7jpSYvhoylmx
IronPort-HdrOrdr: A9a23:xPtVPa/+FMRHDNZB7Vduk+FLdb1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc+9qFfnhONICO4qTMuftWjdyRGVxeRZjLcKrAeQfhEWmtQtsZ
 uINpIOd+EYbmIK/foSgjPIa+rIqePvmMvD6Ja8vhUdPj2CKZsQlDuRYjzrY3GeLzM2fKbReq
 Dsgfau8FGbCAoqh4mAdzU4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kLEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 bxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72zeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlJXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbZrmGuhHjXkV1RUsZiRtixZJGbAfqFCgL3V79FupgE686NCr/Zv2Evp9/oGOtF5Dq
 r/Q/1VfBwndL5gUUtHPpZ1fSKAMB2Fffv9ChPhHb3ZLtByB5vske+83Fxn3pDmRHQ3pKFC7q
 gpFmko7VIPRw==
X-IronPort-AV: E=Sophos;i="5.85,384,1624334400"; 
   d="scan'208";a="55082217"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGHVDf5XsFseNvF12fl0q00RvpsXojIRG4J0/YJMVzPA/SSPp0yJpjcd/+JrKYBtOxE4bQkrS68IV551cWCRXiUeJYWQIjbmK0/peNxHYvAGnb8cyF9JOwaxoiZfwo+eY+qVcMQ5ptmDgfKg2cEmdlyw2Gm4TZm2JOU2m1m7gA9ufwdIKuN2dyTkUy1OgNqp/V4gDtEcLjeqzaphnK8dxsLdstyXbC+Z+vQp0lho6OwywvDZOZCQO0PC66nmX3RuA0w69fPkiHso2TqlDFX8pYl8r4sqYhEufWdRjTokiHlZMJ3HklaSO9asDl2keJbRW+TckPFnnHaKuTRhqpNvoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsSP6w4/vLwWBbNDsKZIpXxgQHZkdvA5hsZ6H5bVsxg=;
 b=BM2oS1pEgeUdhJ6hea5y/4XamGRZv2rLftY8PlLLvLVLH20ZijZBC+AjLsgNXRvbReBJszce4tEht4VmlwcjSnTq+iNolFckqR11RtfVaX7ZV9AQ4A6g/jEA5l1DqHoHRxmeSgZBsIhiDS2Z3kOOmK2NvhQt4f3plsnJuf2lvlaCiMKK0EzeytHQtHKuC0mZbNZyogeivW1RjHp+OssbpcSo77x7peh5fHOM1sayWsDvOgxnuzsajI5ltVLoml6r6lVFmK0Sig0SMsm8W7b/V1Ot6uY/3xaTKogBaNfeOdtVPyKf+pBQqf7LNQnbesc4xmzKJpPmCCQnOEVSSdZXcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsSP6w4/vLwWBbNDsKZIpXxgQHZkdvA5hsZ6H5bVsxg=;
 b=e/Gc+XaQ5CsHhwhVwUeWWOlUCbpb+ThJkzxiJCwP9c9OLWuCV7vnmHSuFFepmw0M7kvAeChX3N/gPKeUMfcf7Z3JTfczj4jPmxeW6W6RketufJFupMCNWkV657/VU75WpXRvvDCCDngisOTWkTV3vEQpH0FcWeXGhLGfcW3li+w=
Date: Tue, 19 Oct 2021 12:41:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86/PoD: defer nested P2M flushes
Message-ID: <YW6g9w9XeWKsxYMV@MacBook-Air-de-Roger.local>
References: <e47d51c6-1b4b-2f72-6e12-070df66c30e2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e47d51c6-1b4b-2f72-6e12-070df66c30e2@suse.com>
X-ClientProxiedBy: LO2P265CA0464.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 734e534e-db51-4d7b-bd9b-08d992ed170d
X-MS-TrafficTypeDiagnostic: DM4PR03MB6062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB60621A6DA3D15641703C54E48FBD9@DM4PR03MB6062.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ejs1Vl9uj3wnsX2eqVgEGOs02xSvO+EvnLIcNdclAs8XHi7FpaG9VLYgas2gXlagcTVP2P3xxD9Lr2YAKc7Mj4ZroCYpX84/Anz4yzcyXeMHKRwDcQg0vRAUjioLnaa17DXqj6CUYUDjfwgAuzW/RV2l0lsFhfwYRYjpEe8CRB2TAYmKS8AUZetji6123p7CBribhQsn8/Wxe8dSzyZAwvKFOjlMu3h2vFLaiuaAShS5RP5570b+7xKMdvE7Od6mZQzSq2U9Qlv2ZkMEJ1Vcaou+EyazJUDFFOAXln5A7h1KqUjDtBfiEnb0z4EBMf9lHQTZoi6dG+QbmXKGsCr0oZBBPs5WxEwukMiC+nfaPlwB56yNGRfHGpjnZ/Wl7fpMwKQq6dOrQbr9yncOV+BZZQ+hg0k2puoGi8F2pLOpBBo4Up3nNsjtvr1v+TY/qcDKqqleXWEfhgS1QzSaqPnp77jg/Pr+05Firw/socn6QEwy5hOMhsVRTGjtsE3ord7hkIVNHcS1AwwmvcRLdOVQpdoirgDIycBgDUAvAi++TpUTfYDynKGPRe1Zve54dxaQ4y5YqDkh99N1bjl/LeLCD0ih6SjYunf2gjKtuPQ/jEG/S2HCwYinbDr/K6+I+ypNZOA6vueI45S73rZb3lqYJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(66556008)(85182001)(83380400001)(66946007)(316002)(86362001)(26005)(508600001)(38100700002)(956004)(8936002)(186003)(54906003)(6916009)(66476007)(6496006)(107886003)(4326008)(6666004)(4744005)(5660300002)(2906002)(9686003)(82960400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnZwSENVS0t5K2xSbGR1SFBRVG55amdhTENJQ2lTQnFITWtVOUtJQUpCSHBW?=
 =?utf-8?B?ckU5bGttNTZTTjFFaVltRGkzZ1drUXArUHBIYnp2WEluWHdKRkRMN0VlUmlZ?=
 =?utf-8?B?L1pxUWhLNXp0OS8yOEt2UUJacWV6RkY4ekpQKytST2pWSXFYY3pZc2pEd2g4?=
 =?utf-8?B?QjBVVEl2SElxQ1ExTzRlb1J6MWRVd244YWJMSFVST05udDZzMVhKMjZtYTQz?=
 =?utf-8?B?RGM5UXpwbVBOTUZlTGpaVTB1LzhtVEE0b1ROVWlGb3pMc01LSkVwWXBYbXE0?=
 =?utf-8?B?RFpxbkhQVlZGRmJKS3VwMTRQSm9UNmovU3g3d1BzUEVKQlNCM0hOQlJYcm1l?=
 =?utf-8?B?QVNEV0JhVzl3QnMvdy9YemtrWm5oSlRSbDlnRzFSaUoxc3U3VXNERXRUQ0Ev?=
 =?utf-8?B?TkZCaVhNOCtjeE0rVmRwSjBwTkVSOXczSDVNb0d0VmtHemZIcnBvUXJHSlBh?=
 =?utf-8?B?WlBJaWEzWTI2d1hUMXVHSHhiRmhOVUFHWFNUaUxDTkkrMkh5UG94bEpzREtk?=
 =?utf-8?B?M1J1WGJVeTFIMVRtVnpYb01uWHdkUGhSVEt5clhzVkt3bThONzBJYTlndzRD?=
 =?utf-8?B?cWRxT0thYlZDd09Dend6TzE1RUxqNmhpV2haM29mbGxQbGt2dEtLRGdHdk1h?=
 =?utf-8?B?dWx6MDlkKzhoaGc4dXJ3T1h0eG9NeFczNHVXOXZjVXQ3d3lhaHNYTXY0bHJT?=
 =?utf-8?B?aE1yRFdNZ0ZVNGRxUWRFcExBYytELzFNbjFpRTNRUG42SjJyZUpaazQ2L1ZO?=
 =?utf-8?B?SUtiUnlNRmRrcTNNNVZTVGFIakNqY3dnSzBLbFpyZ1oxZ2pvTzh0S29jUkNl?=
 =?utf-8?B?WitwTXVXdVQ2SGJXVDFnZ2VqTzZxRG5UL3djNE51K3M1TFdZa01FcnZGZ1Jv?=
 =?utf-8?B?aHhZR2Y4K0VRM0F2YTRFMlRETFNYYUhPMXZ4TmZjRGJJdHROT0ZaZi9uVmx1?=
 =?utf-8?B?M01GeXJZRkVTSE9mdVNKNldpSEZSc2hNWnlzbXl6V1Vsdk5nWkpyc2YxcFFo?=
 =?utf-8?B?NUpmMm41M0FhM0pxMGtodFo5dDZuYlFCUUk3RXpWd09lYUFIeVoyekxEMVZu?=
 =?utf-8?B?Z1R5TXM0dlFhQSs2ZWtmcDRJQ3BwZUdhVTBteUtDVWxmVTZXcFRHNVdxNUZL?=
 =?utf-8?B?bEw3VFJzNkp3elNpQU43b0tkT1gxZ0dkaDhUNG81YWdxVmZLWmVKOXZtZU1s?=
 =?utf-8?B?Y3N2eVpiQzNzajgyNTlDa3VJelIxdVR0YngrL2prMUNRZjZ0UTFLZWN3VVZi?=
 =?utf-8?B?VFQ3SUdjYlBPQWlWekFkcTRXUUxhaDBLbmNmV1gwaXNPYi9oUzNOanhVZmx4?=
 =?utf-8?B?a1VIVmNLSkMycm01NUhXbTdXNTdZUHhYdWdZV2JHWlIrblRyTXVTMG1lcVBT?=
 =?utf-8?B?Z0Zjai9PVEVoaUs5TDZDWWhsTmlHdVJERFRrWDh5Uy9RWjVxR3FqbnVqOVAy?=
 =?utf-8?B?TnQrVDFQMG1VUG1FM08xMzRGVEpoS25ndEx4bFV2Q3JTaWYvM2lvUFlBVjl2?=
 =?utf-8?B?QnR2YjRWeTByU1FOVXp5Vk9hQ2ZEYzF0dXVsUmhPT0JGdEwvOVVUZUc0aDZl?=
 =?utf-8?B?eFFQSGViMzdISWdKWkJSOVByMHBOVTlDanNMOG96R3BoS0p2cjNHRW04bXpo?=
 =?utf-8?B?S29Oc3kyUSt6S3BKcndNNTZQRC92Y05MK0lZQS9ieVUrdVNRT2pLeDJnK1hH?=
 =?utf-8?B?RG1tcEZtYU1wWlFmMHRuMHc0cjRhZmRSWE1wZHZvaUU4VGkyeXR0RXJIbTND?=
 =?utf-8?Q?kctYCH5Wn98aMeW+L2g3Ehqa290sVclrMooVyy8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 734e534e-db51-4d7b-bd9b-08d992ed170d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 10:42:04.2362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxcEeZ/yQkxL7AbgXfuRmN+DaglKsS63eNrDWJxpZEaHwk/B8T2EWUP7zebbo/QCtWL0RnWMH1z+IjheH7TLoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6062
X-OriginatorOrg: citrix.com

On Mon, Oct 11, 2021 at 10:17:08AM +0200, Jan Beulich wrote:
> With NPT or shadow in use, the p2m_set_entry() -> p2m_pt_set_entry() ->
> write_p2m_entry() -> p2m_flush_nestedp2m() call sequence triggers a lock
> order violation when the PoD lock is held around it. Hence such flushing
> needs to be deferred. Steal the approach from p2m_change_type_range().
> 
> Similarly for EPT I think ept_set_entry() -> ept_sync_domain() ->
> ept_sync_domain_prepare() -> p2m_flush_nestedp2m() is affected.

I'm slightly worried by this path because it doesn't seem to
acknowledge defer_nested_flush. Maybe the flag should be checked by
p2m_flush_nestedp2m instead of leaving it to the callers?

Thanks, Roger.

