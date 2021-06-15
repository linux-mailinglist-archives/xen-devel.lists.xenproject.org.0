Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14573A87E0
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 19:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142361.262694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltD0c-0006IJ-Ko; Tue, 15 Jun 2021 17:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142361.262694; Tue, 15 Jun 2021 17:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltD0c-0006GL-HI; Tue, 15 Jun 2021 17:37:54 +0000
Received: by outflank-mailman (input) for mailman id 142361;
 Tue, 15 Jun 2021 17:37:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6ws=LJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ltD0a-0006GF-LU
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 17:37:52 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d923501-c852-4489-aa92-54b89c0d5d29;
 Tue, 15 Jun 2021 17:37:51 +0000 (UTC)
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
X-Inumbo-ID: 0d923501-c852-4489-aa92-54b89c0d5d29
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623778671;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=C0oNPe/Vx80/WG46LOPMcXjPYzVJH0JaIpDpC91+vuw=;
  b=YEc9Tu8faWo+WO+wEHHyAXXRzKKcuq15SrSBId5kb7qouw4UwB5JkQvj
   2HnsmNiRw50sguSWzOJtATA+FLfSStCuckfWj4L42hsnS6CE/S3WCl3rA
   N7T0HeWs8vp55d3+gWVkbEe1fS2+e+CqyD0EG/eEXp7kzEyPdYSJxys9Q
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4jieiF6kxJJIla+bNk5PqiSYRlMOZ8KSKpyB0fNam2iKyBxRXKFRJUPTmABlJUvLDVxcsTgZK9
 FToEGitqz5JF8sKO3YvYBifWMAU7pWg2fAKAuuBx/2zCmG39C6mH4YPM06u4nmn5RttK+jOS6y
 cddrjkCSUZ0s8apKDtLBBMK7aRfsvDbQdgKbsNscVvla7xpLvVWyjotzlnKToRxGm6kg0f/cVv
 QoSFe/L0h7wKj2eJGN9A3tCRA+saDWuGHZ18JunfkJzA5BMjhcoSXxwZKQADbYA4O1UpSB1+jN
 ZTo=
X-SBRS: 5.1
X-MesageID: 46171399
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:uDQSE65zk+5rODmBSQPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-IronPort-AV: E=Sophos;i="5.83,275,1616472000"; 
   d="scan'208";a="46171399"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c99VlHrIBHuJ/JZENmPbYVEpJhUsV2zPUPcDFV/xkybg0lOo+jB6Vls2NbJ8CR3gcdnFalWAVztu8IaVBXLAslMB+pRO4xVK3AN15Y0noC1GCUZ8+/v2ubzMw4X+/z/SYT2tBHfzJ1a0Rnr0nWZ5LyqTFaWIQO80J8otRnNDyhYG7i2dLGofxk8mWDzfnI2R52+hZy75jikBRFFBJVmM9iQsYcPjxniKxRZ6iDewexT30GwJtwDU9+6VBKHTm4MRevdM7lVJ5WWaUifGtrNuxJDNRlU/2QgM3lXsLfLzApeCildWF4ZB6vsH114O6MEohsYJN87hl6G+BwkuorK5iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tC+0/rovNW2+KKahxeQKvJeOaITeWpng2PD17awFUEM=;
 b=RPOZ8FZGjg31uZSqmhShlzGajOSesyx4NQIkDVHcSPrdH746O0WR0f9x6q7mKvP08qPDSFukXOyQW0fMkZ3CLfxOpOJZNOZKCoroLqG4VxzQsqX6sRynto/5oTQDSKQ2CX49f7SSAJLQJIYYVgLVYW3yUpV7lMDwVi7kWWxj+ZF2LpfPYVVxUSISXXYqsP4HACn5K2Ll52wqWc0JZgTpEY7HQ0SmtQOKhLunC8Dv+2oL7iNcBb6AM9/91h6OZejH7Z1jR7TtCx7I5QezHgAF4+M4thqlJ7Tq69ZZi8befh53gtHwtwVqREPjQ39D02dSnyLj63DdmnEOvtTFZpyVlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tC+0/rovNW2+KKahxeQKvJeOaITeWpng2PD17awFUEM=;
 b=hjGWhkA6xV2pMQLeKSmJ2kAJX/ntUejcEDNZPHzJjYetUS8x66dX9E6/damY7Ji5fCI3v1em8ta0mLEI7lPe6K9ykKWjB7RstwjUIEyYjXn3k+8MWK0WDp8dtlQatrm0w8LI/bg+MdEVjnNwk1z+MAfIP5xGLnrK/eO1b9x8+Jk=
Subject: Re: [PATCH 5/5] tests/xenstore: Rework Makefile
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
References: <20210615161905.9831-1-andrew.cooper3@citrix.com>
 <20210615161905.9831-6-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1b786e0d-bdb5-9d10-15ef-688b09fedbd5@citrix.com>
Date: Tue, 15 Jun 2021 18:37:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210615161905.9831-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0297.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 464c26b4-9622-4759-a219-08d930244a55
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6270:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB627078AB7FCB8C8A69E9A5BFBA309@SJ0PR03MB6270.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cn/EVtmTJPkovmiErxHLDiYHom9JNV2q1rViOavqbgbRR6ADh6Q1pxYhJi3cSjx6J3qR8u0ljhhYlVKF39NyiMtQn/pOzcRfZPBQb4gklNV+ynG/+M4ub9UZN+gHLjqUGQhu6hxrpB3ni8PSXZrfe2Zq40+q0PNgkb52khL4LFA4tp2MFTdgxFTNoc+3iimpYxAF+LgRTwFTHoKwaYZgU9WXueejvtHFDi7yLa8OSJPjZz3fFNBmLYSbYm8fpff5wWzY2pHHYvCiUfyS18i4FSTBZXl/xh6iZDmyPsyjs+kb1XkUs3vxtaHlZ7rh9KeZqHcqWS55bHaFX0LGTkbDUSf2SjaG0BMSN1QNqdtdeQsYrepKxeSYuUocbeRxU+fBI1yytrsZRYTIVzjLCYe+QN/6lLfsb7OePt6owTAicoJEDi1uYlupxov0Ds4cGUT8Ca9QZL+voi2rGy8nCy94ER8yEA5YH3BgSIfTImXThln31pgv26ybwUtHqGYAIoQpbj6N3c/RiUe5owwXrO/xURWE2BCvGxrAse0OnJCLn0OOCmjdtuFxpKJZg3ktsx+vlntDGaIBJuyb2rvxWYcvIUyJvCEWnDl1d1h7JJw8ilvf26O9rGF/3cCQSJlujXH8RK/u+qObNFO996bHHia1xcNZGlzqfZH3ImY593ZzMrZKLupxjpAixAnYfkqFwADB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(8676002)(956004)(2616005)(31686004)(6916009)(38100700002)(316002)(5660300002)(8936002)(6486002)(53546011)(478600001)(186003)(16526019)(2906002)(26005)(4744005)(16576012)(54906003)(36756003)(86362001)(66476007)(31696002)(66556008)(4326008)(66946007)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkpiQy8yTjNsajBFTjQ2MEZSdW9aVTBtMmFqdEs3OFFwZGpjS0cyOGJBQVlT?=
 =?utf-8?B?QlU5T1cyclJSd1FDbjZhSUtnMTJBQzRzR3N6dXJnUGFPVFRYK0tMcjYwQjZM?=
 =?utf-8?B?Ujd6Tml4aHdycXkxREtsNTI4dnlCTDlmbjV3MWFNMlFMSytoY2w2bnlBWEZ4?=
 =?utf-8?B?Y1hBYTFzVG9leVhPTWd3REZCMS9DOEZqUXdUenZ4UGduVDcyUE1aaEtyNk5h?=
 =?utf-8?B?WnNRYkd0YjVSZUVxRWZlVmc1V2puQVc5ZlFHaFBvZlQ5Zktkb3Y2eWU5NnU3?=
 =?utf-8?B?VUtmL3ZzMXhoS3JtdHVqZllGTkloclZlSkYrVlRNcUIwUHFEeTJpamVmQ3dx?=
 =?utf-8?B?eHVVQWdNMlo4OUp0OHM5clBSSEp2L2pvYWZISlNWKzFyTERxRDY5R2pObUhU?=
 =?utf-8?B?MFd3c2dqK0FVOTNSZ050SVg3RVpaV1FFTFErOFVYU2NzUU0vU3JsUXZNSHlS?=
 =?utf-8?B?b0FvTkZrR0FLNXVydzVGWWRoTSs1c0dQNnZ6bG9TVTdJNE9kaUczM2ZnYzZ2?=
 =?utf-8?B?RnRPNnV3UDVyL2l0QjhBQTZ5bnpXNFRhSzdSRGMrSmkraktSV21JQmJjcUJK?=
 =?utf-8?B?S3B6aSt1STZWREhNSkJHb1BvdmNDa21ZeWlDYWhqbFpQUDlhK0x5MVZjMS8x?=
 =?utf-8?B?Y1BIZVFHaE40bGxwY09UWDJYeXZTaG9wV0EvM3AyY1BzQUxyaGVrUmcraGpo?=
 =?utf-8?B?SWZ1RFJGLzBsM3J5clVOYTR1WVQybFZFZlZVa244VGZJeG1wYXNjRUwwOXZX?=
 =?utf-8?B?WG9yOE15NUw1N2xHYWpWNnZGS0ZFK1JYRkxVc0VneTF0RkpkY0JHa2gwTlFL?=
 =?utf-8?B?RkRSc3N3U2tYUFRLZFB6OWpqWmtGdjY4ZGhzTmRLOGZwSFl3WVAySzJHVmFF?=
 =?utf-8?B?Ri9JaS9BS3dWaGJkbGZIamE0QmtWS1VrbWNweDFWL1R5ZGVVTDRWWkIzMjJ6?=
 =?utf-8?B?bnpHc1U3Z0hPZWVLdmdaaUZMYnExM1pDQ0F4WUFSaXNuUG5xM3Z1Uk94RWtz?=
 =?utf-8?B?clgwYmR6SXhMRkF0cVhZVzZ0V25jQ2QrSW05eUVKVDFnbGt2VnBEZmV0bFBN?=
 =?utf-8?B?MGJWVCs1UWtobHZSNHM3QWI4b2ZiOGpTUitIOXhFc2YwOXNvRzJldGthcUtx?=
 =?utf-8?B?d3pWMnNCdUorbDhsdFZWRFNwTGk4dzZMVkVYZVVCY08xbEJ5dUhBMTVJRGph?=
 =?utf-8?B?K3N2VFV1ZXcxQlFhWmJlMWRLdnA1MU50UytWY0tyRXJ5a3VJY1FudmZDRmdX?=
 =?utf-8?B?eVNwZmZNcjJ5MlFyZ2ZOcXNsQVZaalEyQXRPVEpGcTFtNXJySGk3OEo5RGJn?=
 =?utf-8?B?ZWVydUIrOFFlQ0ozVEdWWGtQVzZ5cVF0bnZ2V1R1Wk82YjNibzR1RzJMd0cx?=
 =?utf-8?B?V2VLY2hoSnNGUmpUQWRqeTBZRzNzYnpWU3pscnhzT2RLWDJMeUIwWDlGeVdY?=
 =?utf-8?B?QjcvWk43RmN6ZWd5LzVWb3VoTXpwNU9SWmhBcVZQbFM4SGdnaE9vWkFpc2li?=
 =?utf-8?B?eWc0dSt2ZmZNQWovM2srYVZ3dnNUYStsb0xVSU1KaUJ1REh6YzZ4UXJCMlQw?=
 =?utf-8?B?SFlzdGVFM2oySHg1TGhrUXZ5cm1iNnhTakhqeEJsaTB1SXVid1dmSVEzbXc1?=
 =?utf-8?B?SDZuODJIZ0dPclVYNVRYL1R2U3RFLzIyMnNuTUw5TFRzaXB2ai9KTENWQmZT?=
 =?utf-8?B?b3E1L0h4WVhUWmtUNjQzQmxQOVlWTlFSREl5YVdGd2NFWklzeExhNHJEdXJ6?=
 =?utf-8?Q?c0TQ7ZkHINROrVnMuXSn8fQR9CD0AJc1Y1Mc/BD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 464c26b4-9622-4759-a219-08d930244a55
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 17:37:47.5466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+/BGjUH4ur6d5IJjpvwBaZwppYzt+ZqiHVYv36Qr8yi8KtjNC+sOSFS6/ePpJ5qAGe0eTpmmh0VJ6ky/xMGr3zxIjOkjeBRNuKwoC3GzBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6270
X-OriginatorOrg: citrix.com

On 15/06/2021 17:19, Andrew Cooper wrote:
> In particular, fill in the install/uninstall rules so this test can be
> packaged to be automated sensibly.
>
> Rename xs-test to test-xenstore to be consistent with other tests.  Honour
> APPEND_FLAGS too.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

It turns out that the absence of install rule previously meant that this
wasn't covered by CI.

It triggers test-xenstore.c:486:5: error: ignoring return value of
'asprintf', declared with attribute warn_unused_result
[-Werror=unused-result] on newer GCCs.

~Andrew

