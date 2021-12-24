Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0847EE8C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 12:25:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251299.432612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0ihE-0002AA-Pw; Fri, 24 Dec 2021 11:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251299.432612; Fri, 24 Dec 2021 11:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0ihE-00027i-LW; Fri, 24 Dec 2021 11:25:12 +0000
Received: by outflank-mailman (input) for mailman id 251299;
 Fri, 24 Dec 2021 11:25:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t0dA=RJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n0ihD-00027c-06
 for xen-devel@lists.xen.org; Fri, 24 Dec 2021 11:25:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 259b2314-64ac-11ec-9e60-abaf8a552007;
 Fri, 24 Dec 2021 12:25:09 +0100 (CET)
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
X-Inumbo-ID: 259b2314-64ac-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640345108;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pv/EiIDrSwxPlE4nLOybsoU0i8XT0YOMYgp1BEm26fE=;
  b=F70c0bjiEX1r17noYyqripF8/AO2lKS7HKcjcnt+foR8ndTwT26ee/BL
   6hpC/5bmujCe1DoN+XVaQO/2oNHgfiC/4yOIhaREHgpwqgPFre5Bpy/jO
   rnLK4d9MCSPJ8VjfzuzJIfVDyM5fwjRYCVYYT+1KzxYmGkjGCmauZO6KJ
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: f8LxSjo10dZl8lj8DPvK0lTr1nRQXRcBXZ8zAscZkVRtgT1IBoPXq2rvVQFDC8wL4qhSX7aIaW
 kmie+fdHlyJ6BNjIjXctwNwvgQFRV7QugY1tIfG5xradwDJjq7QgWfT1IdueJCjnhN0FjY1OtU
 IXuYjZItIzeyI8Kf9YQkr6MHyKTu31tugD4DvqbL4o9hJZvplSQgItYp4xJurvlbY1n6BV0kaW
 YWedS1k3Ahd0JxbOkPL5I10qJkXFEb61swbzI5aQbLCN7GUS0k6vdu3lan4jOGG9RYCvfTypDx
 C+NV4HqX/IJm8MhRiAkGD1KR
X-SBRS: 5.1
X-MesageID: 60669053
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:l84NBq4GvYjhJopIDEhlfQxRtPfAchMFZxGqfqrLsTDasY5as4F+v
 mMeXmCDM62MNjP0LdgjaYWzo0JUv5LQz9dqTgQ4pXxhHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wrdj2NIw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z6
 fp1spWzED0VDrzviu8/YjRdAgFCIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgm9u2JEWQK22i
 8wxZwY+QQn4X0B2OV4dUak/x9+jlEPSWmgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/RBYAO7S3xzuf/3ehmuLIhwvmQ48ID/uj8eNwi1CdwXYcBVsQWEfTnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjdzyXmHmNvUcmZ+pBMP8xyjCgz7v03xnMUwDoUQV9QNAhscY3Qxkj2
 VmIg87lCFRTjVGFdZ6O3uzK9G3vYED5OUdHPHZZFlVdv7EPtalq1kqXJuuPBpJZmTEc9dvY5
 zmR5BYziLwI5SLg//XqpAuX695AS3Wgc+LU2uk1dj70hu+aTNT8D2BN1bQ8xaweRLt1tnHb4
 BA5dzG2tYji962lmi2XW/kqF7q0/fuDOzC0qQcxQ8F7p2n2oyXzJNw4DNRCyKBBaJlsRNMUS
 BWL5VM5CGF7YRNGkpObk6ruUp93nMAM5PzuV+zOb8omX3SCXFTvwc2aXmbJhzqFuBF1yckXY
 M7HGe7xXSdyIfk2l1KeGrZCuYLHMwhjnAs/s7iglE/5uVdfDVbIIYo43KymMrpksfja+VqNq
 L6y9aKikn1ibQE3WQGOmaY7JlEWN3krQ5fwrs1cbOmYJQR6XmomDpfsLXkJIOSJRoxZybXF+
 G+TQEhdxAatjHHLM1zSOHtidKnuTdB0qndiZX4gOlOh2n4CZ4ez7fhAK8trLOd/rOEzn+RpS
 /QletmbBqgdQDrw5DlAP4L2q5ZvdUr3iFvWbTalejU2Y7VpWxfNpo3/ZgLq+SRXVni3uMIyr
 qeOzATeRZZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3On2LI2
 RyXDBEUofj2j7U0qNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVtH79h8HrJswf5s7tfjveYHnAFtHXGNZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQ5DPhchY8SCyeoQy2vb4vkCKUnn4DN6oeicWkJIMhjQ0CFQIdOZ6m/+L
 TvNbCLO1zGCtw==
IronPort-HdrOrdr: A9a23:1lSsu6sb/Fwe/K7IAS/975jV7skC7oMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzI4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kHEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 PxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72OeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu55Dq
 r/Q+BVfYp1P7wrhJRGdZM8qPuMexzwqC33QRCvyHTcZeg60iH22tbKCItc3pDeRHVP9up0pK
 j8
X-IronPort-AV: E=Sophos;i="5.88,232,1635220800"; 
   d="scan'208";a="60669053"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFDfbiuoJuO7r8K9qUBYeNwoYULzi5zB3dc4cCPdteZkSorcluLPxWQjTUfh2rzOt+E9IfXIhoPNlDEy5ILGCOZs3XHqebv12JfprR0nmAQcuNxqTO7uSS141X8I0NHOI/wmfeG0HobOVy8Z5cyuXSwDzWdYmFYvUXN4QfNHDvoLrDdwf+lRDbVVXDgfRkULqSow4yNOhjZea/vRxdkibmdCUuZTjysPxVbNASA2xyiUtpHelu3saEx/wZXauT/YGu3eoRGJsQH+hEFh6hWILb9TZEASYzTbRREovZ2nyrPc5Sxx35yVBzOZjivecrmaR6j/EW7YXEFGU4tVweVWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ek2+P0CpzQYy9MxFuVw/G7r2hLewoWTF/WsBc6/N5io=;
 b=UJ4xyr/mTpNswn7VdMqJu2Yu9Ko4MRqkq7K5y70ALeOQxXpb4Hbj226Hu5up4l1dtQWbzncp4LIDgYI/f806UX+X797qbglBZ+h3DDWkpCFjDRA63iriax8QvBAWv7Agnat4KlftsbKzmbMHGHPiz+C3qk5SDuLzD+QpZIqgpZR+HSm/v7HUJT0fT97IIbTPAvQOZrFu7caqCg7zrYo/YXTu5LNZDVCMFhFIE5aO7WadluyzH6nQyvgqUz8+tzh6i/hmYUMZbBvXWc+GqtNxu6xmqWbIuVzQLHoZFtWMNLbRvpmGedCOEtbcRe+mLyCkl2SscA/X+aDn59Ge7crYNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ek2+P0CpzQYy9MxFuVw/G7r2hLewoWTF/WsBc6/N5io=;
 b=WhtFZgZEhny+VIZpGDa9fhYEQwJgula9GX3j7fTZMcvCQiAGbbo4FMDa3oAjdKVRMxu6YB/T/nzPa7bDCdsdpycfg4+eMmwzSw+lgBSONtDsEJOFheDMp0FKSUvmFSVBPoik4Kk+gpJmcnUxQYpdQ29HNZTeRI84s+B3Dk7lryg=
Date: Fri, 24 Dec 2021 12:24:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: G.R. <firemeteor@users.sourceforge.net>
CC: xen-devel <xen-devel@lists.xen.org>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
Message-ID: <YcWuCgYWestnlDSH@Air-de-Roger>
References: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
 <CAKhsbWYLC+cEuaJefi4Zy1ZcZaOtM6_2WV+9uq8=pTdi5NYLJA@mail.gmail.com>
 <CAKhsbWbv-Poscajj=Hwe3g6WO9b8VaZm39ygFnsbEfHTpRzrfA@mail.gmail.com>
 <YcHbuug9AECvKXm9@Air-de-Roger>
 <CAKhsbWZkSoM-N=HXfb_OeSGLqYMdtcxRph+=_vqp6tjHgikYVQ@mail.gmail.com>
 <YcInKtCNgA9v0k+c@Air-de-Roger>
 <CAKhsbWZMRMfrsWDcZLSS7q4ciR0UbyGE2sO-tN1dr+9juuEfsQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKhsbWZMRMfrsWDcZLSS7q4ciR0UbyGE2sO-tN1dr+9juuEfsQ@mail.gmail.com>
X-ClientProxiedBy: MR2P264CA0166.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e61919f-2d1f-42b7-3901-08d9c6d00744
X-MS-TrafficTypeDiagnostic: DM5PR03MB2841:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB2841EEA88654373B457BAF5E8F7F9@DM5PR03MB2841.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6yzfgHcPZEAMTik37Aw2DLqRZSWmx5NYrprs6k352hksyhuJqeulfyaEsgK7YXQexbUnTxfrYO8k9CLRdqpBOy5APQjd1rID8SjctaniG3o8dzNAlWwRjb/o8bss3iSqz+sRwsZlYv+OsgHP/xhUFpdObGmIY/ewyvPYkeX6WdmQSFm87wQrKh7Qlt3Y974qoTb1imNoWE3tOoG+ErejZG8WjyW2G1GhRWYuLpeBGiGB4qSbDb9SDWRJ7fqamYKU+6+o1iLFAno2lhs5jU46Hhz3t9wsS6SsWahMASIvnp2lsgdySJh2tYRPn0A+mKaJOQWNtcjLUIh7zetIVc1va64lBYUe5ysTVNXJWswjjWGctHT4ALdO/vQUQBEsr4z+/jieAsAGUi6UAHv08ZCJUTlTqztHLHN1SiewX38OXfCG5s2uLPJmeVRF0vD2Q35kKTqNMFHwceP+LS7DKd/XRw/EBQpgliy3rEzF45rtSZN9yAS4pG/HKlVtpQm7Clu0Q3o7UkZYUugH8agDTRSYwDj3oqCZAE3oL8ikQgAtm7ZZBdxYWSJOp1wDZJzgmIhyTHkmybjejKla24+q3sAPefBeenZU8ACvw+MSZys7qYTSb5yxI3vIPpo5dyzHvDp2Z7b5Ofn5CvxtXAFmhL0qLWNo2Hx7fC1avCM9w61NMP0QVmExLHD9PBBG2U11/ixO8q2bHWiTq9xSXGoeHmBDQGXXWeCL0svv/rkgk9wTZx4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(66556008)(66476007)(316002)(86362001)(66946007)(6512007)(82960400001)(966005)(2906002)(9686003)(8676002)(33716001)(5660300002)(8936002)(38100700002)(508600001)(186003)(4326008)(83380400001)(6666004)(6506007)(85182001)(26005)(53546011)(6486002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnhmV1BiZkdCK2VZYXVVVk5HNm1RRWhwZmJ6Qk96L0l0YnNJUWcrcEZ4d1R3?=
 =?utf-8?B?K0h1VXpKdTM3dEdBbzEraHQvdm9qcHpNeGtxb3ZJNkJrNFMzbjVnQTNOdVk1?=
 =?utf-8?B?RjBWNGJKQUpVQU1acHJOdmNhUSszT3pSZjlRS2taUXNIYUtHdldnazBYZjdz?=
 =?utf-8?B?UFR4cVlvV2p3Y25VT3MzREVPY01DQnFxaFIvcWdHQVdaZm50MG41SnJITVZO?=
 =?utf-8?B?RTh2RXcveVVRclRZbkI2K3J5WFZlNWc4QS8rSERuMUJkbUFWdG1JZUE0bmN3?=
 =?utf-8?B?dSs1WnpXNk0rbWpUOEpIbkZ5bCswS2F5MXliVkl1cDBWcEZuSFpNeEIrUFVl?=
 =?utf-8?B?dzVoditqL29hSndudXZEQjNaVE8vSlFQWnM4a3BKdS9GSk5oLzkwd3daU3VK?=
 =?utf-8?B?TVNPMy9pOWJDQ3V0b0d5R1liazhnUHl5K2hOeTdHZlMydlRDWDI3NmpEQTV2?=
 =?utf-8?B?N3VGQlpaVVJ1Ui9DMEZHTFhHSExmdFk3dDFBV1RTbUVSY0d4UUcvMHN6NVFU?=
 =?utf-8?B?c2VTTkR4eWRRZ0FGZHJsN1dvcXAzbXI1ZnFzY25reG1oTXJ5R3NMRFJPRXNq?=
 =?utf-8?B?dnpRRFJsQVVRNjR1YlpVd2s1d3JKT2ZRZzk2TEZ5Q0FTTHc3SWJZeXlzT3pB?=
 =?utf-8?B?U2ZwQmQ3Sm02cEJ0dk04MTMxMFBLRkJmcThUcis2bXhvZlovL21RQ3hIUzZZ?=
 =?utf-8?B?MDkybmhnTnNaQjlQME5TRlFsTGpIWnBaRFdub2F3THNxR3BtYnRaanMzT1k3?=
 =?utf-8?B?SnF3YkZxbUhlR3paUFVxbDJTM3B3VGhKOWIxck9aTnFuOTkvVDdGTnRKLzdN?=
 =?utf-8?B?RHB5NHFtUFYzT0lUKzBEVlIyaWFTU2QvNis0bWNudGxjbktqcFZiZFY2aXlK?=
 =?utf-8?B?Q3pwRFNVbG8wUno4Ym9JMDdic1JYN0k3eFNrNnJWbzNRVVJXWE5IQU9YS2FL?=
 =?utf-8?B?a0NGREJtQVZQR3VDdGxjM1poUmFNc3BucmZMbTJNTHJINXBlOEVQeFAwM2p5?=
 =?utf-8?B?bS9UdHByOEFObEt2YmlrZTNKSkJqRXJkMVd3c0VnRnhuLzA0aUg1V1czeVYw?=
 =?utf-8?B?NEo5ZFlUa1h2WnVnQXVvbmtYTlhrUG9vTUZuWWhkL2QwdndnK1hzc2Jmc1Zi?=
 =?utf-8?B?cThBNEJhMTBKOHJ2V2xsUlNVWVNlS21OOHp3d2tqamE5eDJJNkc3SkhWckhq?=
 =?utf-8?B?dnkvVGVXUXZROTRmUGp2d3RNVmQ4a2RHSjI2N0R6c2hTVVprcHd5YkxReTdV?=
 =?utf-8?B?OUNLZkoxZ3lMTzBrQVBJc1dOTUdGUTRNNHFqK2VTVE52Q0o2eG8vNHAyaWtr?=
 =?utf-8?B?SDg4OFZkTHVzMkdRY0YwWU5MRmJEeEJXVTZhNG4zaStjL3VmS1JVQy80dE5S?=
 =?utf-8?B?Vy9jZi9ZV0VmZVcwWXFaRjBhLzg4TnIzRTZ5TGR1SmRUVWVXWU14Wkh3Yzgr?=
 =?utf-8?B?dUFaTWFRMkVDU3pPVDExazBiMlZNSElGRC9HMVBrbU1JcXZ4U1ZjdmhKUVhq?=
 =?utf-8?B?blAyTG9jRTI4Sm1TeFVwRUhjWEQyUXJtY2hDdU52T0RaT25ZdUxhK3RDYlhE?=
 =?utf-8?B?R3NML0I0ZS8rK3RXOWJDVEU0WXR3TWlHVHhqbEZOK2xXK1Rud043eGFkT1NO?=
 =?utf-8?B?Y0drWE9uY3NYbWhQVDZKUzJEWnRtdFQvcTB4S2s0dDhvZDlsVGs4c1d5TG9W?=
 =?utf-8?B?UDV0V1lWWWdBd0hBVFNNbE1vNHliZVg5YzVHUUc2RmJ1a3dHcVhyTlNBamJJ?=
 =?utf-8?B?aWdLdDBKeWJPM25RbXNPdXFSRWMvbVdVNy85M2c0NElHbGN4cUhmUExURFAz?=
 =?utf-8?B?eWlrR29XTVNFeWhjdlJRQ3pOSVBuMWZ0TVhqL1FuRXp4NlJ4WW9PYmJsbUdK?=
 =?utf-8?B?SWFvR1pwWEhITm9TRlJuTlpZK2J0blN3L1BTbHFRbW5ITHhzSEt4M21iT3Vl?=
 =?utf-8?B?dzNVQmlrUTZZcnE0bnBXU00vdDg1aHFJU3ZwbU1aWGtwMjNQOU9rRDB5TEs4?=
 =?utf-8?B?QzJmLzJRVkY0UENVSlRRVml1VXZ1UmpDZkJGV0JSeFp4Q0FMWEFmcjRFZllS?=
 =?utf-8?B?RXBHMmM3MnJBZkhIU0c5RjlNdXpBcU9aOXhadVhVdnZiTVlTTFI2SlE4UTh5?=
 =?utf-8?B?QWt4eWhuckhhd1B0NDlDbS8vbm1sR0hoWU0yaDlYK0dReURQcDdXTUlRK0Mw?=
 =?utf-8?Q?TcDxRJoEXvBJMi8dHPomSA8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e61919f-2d1f-42b7-3901-08d9c6d00744
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 11:25:02.9243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXdpXh+8CfcedQvrDKgWkeg1bvDWgpj0BiD6dcGafS5LmSoaenCFDqgltOzmQOHf1l8xnMHseL7TZnCns6Nujw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2841
X-OriginatorOrg: citrix.com

On Thu, Dec 23, 2021 at 11:49:08PM +0800, G.R. wrote:
> On Wed, Dec 22, 2021 at 3:13 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> 
> > Could you build a debug kernel with the following patch applied and
> > give me the trace when it explodes?
> 
> Please find the trace and the kernel CL below.
> Note, the domU get stuck into a bootloop with this assertion as the
> situation will come back after domU restart and only dom0 reboot can
> get the situation back to normal.
> The trace I captured below is within the boot loop. I suspect the
> initial trigger may look different. Will give it another try soon.
> 
> FreeBSD 12.2-RELEASE-p11 #0 c8625d629c3(truenas/12.0-stable)-dirty:
> Wed Dec 22 20:26:46 UTC 2021
> The repo is here: https://github.com/freenas/os.git
> 
> db:0:kdb.enter.default>  bt
> Tracing pid 0 tid 101637 td 0xfffff80069cc4000
> kdb_enter() at kdb_enter+0x37/frame 0xfffffe009f121460
> vpanic() at vpanic+0x197/frame 0xfffffe009f1214b0
> panic() at panic+0x43/frame 0xfffffe009f121510
> xn_txq_mq_start_locked() at xn_txq_mq_start_locked+0x4c6/frame
> 0xfffffe009f121580
> xn_txq_mq_start() at xn_txq_mq_start+0x84/frame 0xfffffe009f1215b0
> ether_output_frame() at ether_output_frame+0xb4/frame 0xfffffe009f1215e0
> ether_output() at ether_output+0x6a5/frame 0xfffffe009f121680
> ip_output() at ip_output+0x1319/frame 0xfffffe009f1217e0
> tcp_output() at tcp_output+0x1dbf/frame 0xfffffe009f121980
> tcp_usr_send() at tcp_usr_send+0x3c9/frame 0xfffffe009f121a40
> sosend_generic() at sosend_generic+0x440/frame 0xfffffe009f121af0
> sosend() at sosend+0x66/frame 0xfffffe009f121b20
> icl_send_thread() at icl_send_thread+0x44e/frame 0xfffffe009f121bb0
> fork_exit() at fork_exit+0x80/frame 0xfffffe009f121bf0
> fork_trampoline() at fork_trampoline+0xe/frame 0xfffffe009f121bf0

Thanks. I've raised this on freensd-net for advice [0]. IMO netfront
shouldn't receive an mbuf that crosses a page boundary, but if that's
indeed a legit mbuf I will figure out the best way to handle it.

I have a clumsy patch (below) that might solve this, if you want to
give it a try.

Regards, Roger.

[0] https://lists.freebsd.org/archives/freebsd-net/2021-December/001179.html
---
diff --git a/sys/dev/xen/netfront/netfront.c b/sys/dev/xen/netfront/netfront.c
index 87bc3ecfc4dd..c8f807778b75 100644
--- a/sys/dev/xen/netfront/netfront.c
+++ b/sys/dev/xen/netfront/netfront.c
@@ -1529,6 +1529,35 @@ xn_count_frags(struct mbuf *m)
 	return (nfrags);
 }
 
+static inline int fragment(struct mbuf *m)
+{
+	while (m != NULL) {
+		vm_offset_t offset = mtod(m, vm_offset_t) & PAGE_MASK;
+
+		if (offset + m->m_len > PAGE_SIZE) {
+			/* Split mbuf because it crosses a page boundary. */
+			struct mbuf *m_new = m_getcl(M_NOWAIT, MT_DATA, 0);
+
+			if (m_new == NULL)
+				return (ENOMEM);
+
+			m_copydata(m, 0, m->m_len - (PAGE_SIZE - offset),
+			    mtod(m_new, caddr_t));
+
+			/* Set adjusted mbuf sizes. */
+			m_new->m_len = m->m_len - (PAGE_SIZE - offset);
+			m->m_len = PAGE_SIZE - offset;
+
+			/* Insert new mbuf into chain. */
+			m_new->m_next = m->m_next;
+			m->m_next = m_new;
+		}
+		m = m->m_next;
+	}
+
+	return (0);
+}
+
 /**
  * Given an mbuf chain, make sure we have enough room and then push
  * it onto the transmit ring.
@@ -1541,6 +1570,12 @@ xn_assemble_tx_request(struct netfront_txq *txq, struct mbuf *m_head)
 	struct ifnet *ifp = np->xn_ifp;
 	u_int nfrags;
 	int otherend_id;
+	int rc;
+
+	/* Fragment if mbuf crosses a page boundary. */
+	rc = fragment(m_head);
+	if (rc != 0)
+		return (rc);
 
 	/**
 	 * Defragment the mbuf if necessary.


