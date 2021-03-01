Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22683328970
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:59:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91908.173478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmpZ-00054F-5P; Mon, 01 Mar 2021 17:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91908.173478; Mon, 01 Mar 2021 17:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmpZ-00053q-1P; Mon, 01 Mar 2021 17:59:41 +0000
Received: by outflank-mailman (input) for mailman id 91908;
 Mon, 01 Mar 2021 17:59:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju5b=H7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lGmpY-00053l-05
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:59:40 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adc30c75-6da9-4b44-a643-2940c724ddc6;
 Mon, 01 Mar 2021 17:59:38 +0000 (UTC)
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
X-Inumbo-ID: adc30c75-6da9-4b44-a643-2940c724ddc6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614621578;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HtEbb7+yjILyEipvhEJ/t0xFBDZKakY0hz3Ddxvp1Ng=;
  b=SueSg2cZF/h/fa7OcCMJSY3nZOT6vbZ2bsd6H0XIwuV1C0pjaM2RzHcE
   oz2zOwayhxcJnb8hU8EKRxLWghF6Xo1zKNUc+NIGe9puqTVbVTBeXmSRR
   nElo1tqxKTA7mVWSH2ATuOULuwbjbceQBg4bz0yn9Dos8ODcTDJ9k48bI
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TGBOvHx8lMx0MkIa56QrgFGalQzgNFy68i5jBIf8kWn3X8wsDL68zL9muBhBrIZFYzyJvTPGTS
 1RMbYKM+fbmqZoAgwQLjyHtM0fmZWvIm/WrH0aC1N+iZ/uCkVqHH8O58EE8qBD9kbzqd+jyBol
 XxbDS1l2hzG1N2cYybEu2FA5NrhwR9MmTCDCJ/3EG9h/iiQ5qr5q2HxofrYGH3Dtfg6S52B3my
 0j7KnnOSjW4d1N7utF4BPS4O5Pk3x17tRAojNOd2oXgV+1IwXtpzPTAtu8ZtgwBBTqa8fAnYC/
 Bls=
X-SBRS: 5.2
X-MesageID: 38187969
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="38187969"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9XQ7h+AY0yZijgfAYomS3Pwc252QKhRpUgxYBLY/kmA0f6iZQIbW4nFB9bEzUuwKd3l1GTA9F5mDodHkJVvme0FPMxsI6xQDf/si3O0YVaIwbyXPSJ0IXdfZDNBCfKuvXaHgX2naIWVpf+4Ly/gEQt91NiUEpxPR6xcGsrG0Ha3lHdcZazMWG3RELgAdtIpzyIiPOmIFqO/voR1Q87g2go5h9ejocbDYTRmwXwaSuq2mNacbie74aeDezVIJWGDivNDi0Hmz/uDwHP2+8xKSjZiQWkHwteqwUFVXEVBJdpmJ13GwoMVmUNZtcPmDGAYO+qCb30ql/TuATUdzU+acw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbE2TLslXZAIN/rh7uQ2isg/FWiaHHj3AnL6pkxUJZ4=;
 b=dGj6eBPc1DytpPlaUahcwLcoCy2PkEonIkBXLL6hFkiAgfUU+QewbARcP/iM+tXjd9lSupf8EH1tguNxZxxITHMSMt5MGnYccjX9wmopNC4sNM4azyi245wJpAAKQdrR1hBudC8hSC0rLGTKdMfJOJPQEBrR6gBIwT9Af2zVobs8ISUARQV7k/IScA2HbjAcATDUPhc6pskoBI1JKI5v5PnKoStmxPRg7+LC+pUAUcE0yDtukKCIZtOwR909glNu1XJV28Rboe07viJ6Qs4RtqV0D93KNmqXFq3actu4DQV2Sbu/TUav4cAz2ec8Mxs7kmxBkJJCC8DxlOV9VDk8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbE2TLslXZAIN/rh7uQ2isg/FWiaHHj3AnL6pkxUJZ4=;
 b=k98Ag43fkiy7X4FLA3a+BkMFIP/bSxSB8TNKk+UAOm3uPGeJOBKuPgIX/bU59+mTYjtLzSQzy6yucrN3IoiVe+3AmBlL8Gg/JVlwPaTaRSmb1q5t6V5imuuj8kkpAwtWpgepXAXvATgLYyRIE1qLsrCQucCA9R108ig70yQJQ+c=
Subject: Re: [PATCH for-4.15] automation/alpine: add g++ to the list of build
 depends
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Ian Jackson <iwj@xenproject.org>
References: <20210301095806.68518-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a1d8e537-af33-3ef8-412a-6422fb4cf4ea@citrix.com>
Date: Mon, 1 Mar 2021 17:59:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210301095806.68518-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8369d2b-d0f8-4537-9651-08d8dcdbc5a9
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3623E5C5A5E4C83CD4344473BA9A9@BYAPR03MB3623.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XEfhG7sEpixQ0KnfKDxmip7rtYEI+hlJ8k0iEHb67T02eGJOT2TmXwrCTWNsVwbsflNYvfjwN4kC2LUMpJ27TOZ39fX13lBki5CxW8FCG03SOsytRq4YVhWpe+Oif/rjc5Nx/yyllbH9nJK6Z251bikLIemIyapB+xr+T7lGFNATlBlyprXdMOcJOLigXK8PBAw8UqgkCBicTRgRFmebiLObu3gnuorBdwcn3StUgSj+5X6MCOf4cWaA9vnE3AvjWamzBeZactmHyvTaDPD6TbUFzID5eqny4R4UWoyXE94wNmGyDbcuEF4tUMq6ZrKgHipuDWzRkZ2Bm3sQY4tdKhT7Ir9d0osFH4zoQq4Pz57de/3Tm8PNTaFxH0IFjS+izfEXz4eiA/XZEiVnsfB6/uqaZz5kjZakla37ykGfiMFBYe+3ArUy/MXdHWMhtk3hi4/Ha17RG2QW+yEkSRLxGt0EDPvzU1Rbew1SP3fsLhbj7defuxZmnyEn+JjoT957bTCehJe4bYiITE4m3XuXbMm5pKJ88Ebeoy4zW4KJXBRNogiA0xtZjKdNGbqXS+3u1PKBiRCspwHgx4oevPS06vmzMPJC8B76g6jBxXbJR4g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(54906003)(86362001)(6666004)(36756003)(478600001)(8936002)(83380400001)(16526019)(8676002)(31696002)(31686004)(2906002)(6486002)(16576012)(26005)(186003)(2616005)(53546011)(316002)(5660300002)(66946007)(66556008)(4326008)(66476007)(4744005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MlMyMUdsN3JlNDBlYUo5Z2hrelVrbWdhclVTQVUvYS9EK0YwTjlPMU9kN1BR?=
 =?utf-8?B?dExTc1NOYTJ5SEZyb256OEgvdjdHcy9nNzA1SFdzMGJ6aStuQ3lvSUxxaURQ?=
 =?utf-8?B?NWpBcGlnNzkwaG1ucGZ4NWdDMVhVU25vcjMxeE1VYXFFSGQybFFxaG9Xa0JN?=
 =?utf-8?B?Qm0vaEtlVUFiU1RCcWVzYVlhczlWM21VL3NXMENuMW9hTW0ySWRxSVdqd2Nw?=
 =?utf-8?B?Zmt2K3dlNnl5bDQwMFIxSEczemE4Q1NmTjNVVlJQaVRqT3R0VkFhVUI1cWlJ?=
 =?utf-8?B?TU5FdGJXbHFteS9ybFhaOEZrZUlwSjFtSWd4TG14WHFSTW9pRkV4QkdnM2ZU?=
 =?utf-8?B?WGlmTkc2VU9oWlZ0aVFBM0hFY09Oa1c1aE5ISWFMbzhUcEx4VzV6Y2k3Tllx?=
 =?utf-8?B?ZGVuZXcwOUtwUzBwdmVDTUtpenNoR1cyQk1UeStlMjFyejdXRG9hTkJSdDJW?=
 =?utf-8?B?SGQ0czRZMktCczlXZkhxeDNkZGs2di9hczNlTWZuSFF3SjJKOEhvWEpSSEQ2?=
 =?utf-8?B?dHNNVXFKZ3FXdDhsNXhhMG1STEkvMFoxSTgwdU1QZ3pwYjYxQ2lXNjEzUkp1?=
 =?utf-8?B?V2Z2QVg0eU9BeTdYNzNpWVFpQjU2RlV6ckJHcnJrWTNXa0Z4YW1DT1Q2OEZZ?=
 =?utf-8?B?NVZYdjV4UkZpeElnRWJMaG94YlJDVzN2MlgwcXpKbXVuekExWXl3cGtIRXJE?=
 =?utf-8?B?OXV3LytLVHlBcEtBSnZwdUFhL3FGSDhXMGphVDlSNGNEMzhNbXBlQWpyZWFR?=
 =?utf-8?B?UjJDU1psS2xIazgyMjhXLzVnQy9KOEcrRmYybXl6aGM4bmtGOTQ5S0k1b0FN?=
 =?utf-8?B?YW5OZWFtZkJCS2NhS0RxQVArZVZFdUNYL2pjMEZYT0JHUmV6aTdpbWUzWlBZ?=
 =?utf-8?B?TTdmRkQ2Z2tVQkwyNklOVHN1cVZOaFJKQUphY1htVGh1RlFVSDBpeUNsVVVM?=
 =?utf-8?B?SXVucDBid3REaFBtVEw0cWl3Yy9uS1Jmcml2Zk1UbVJnVVhtN0dKeExFRExi?=
 =?utf-8?B?dnRXZWQrcmFhcWJQS2tHRGUxdHgya3VxZzBldnYzQmp6ZEJMMDJqYzVUVFZB?=
 =?utf-8?B?VFZSU2VIbVRuMmh5dVJnOTBRSzFQWWhIcEx5aEJTcXVrZUNaTmlpSndacGJC?=
 =?utf-8?B?WXkrT2YzMk92UW9DSnNoNWhqaVBZRmtiVGRadU1ObUZxQlZ5a1RSVkt1YjVr?=
 =?utf-8?B?S0hENktDTW43d2kzQ2htMUpaUnA2MXhIbFYzRUM1cUtUSHBzZ1U3UnhZQkJz?=
 =?utf-8?B?dlJUL0lIQitVV2pqOEo0ck84SGRmNkJjK2l6UWI1OUZ6eHA3Q2l1RGFGNEM3?=
 =?utf-8?B?bUdqQ1hzWWllbUgxbmxGQ0xka213UGZxVnZtaFRDY0JrWktsalRUUkxBS3R0?=
 =?utf-8?B?WDQ3LzN6eU5kU3B0Y1hCc3lUV3R3SmZzWUZKdmtwc1krODA1aXdadUhmekZj?=
 =?utf-8?B?Uk5Ycys2L2lSNHgvL0VCOVhnUzRTRUQyNnlsTjYwNWIwSnVHbG55dVcxa2xN?=
 =?utf-8?B?OUl5SHpCZmJpc3FEMW1UaXdPU0JHU0RvVE9OZklVbWdrQk80MFlGMnR5Q1Rx?=
 =?utf-8?B?dlZKVXVyWXpXekM0SENJbjhOZXllZEJia1VKeGNXTCtpdWV0V1FMbkYyMVVF?=
 =?utf-8?B?MVFST1JWWXpTYUx4OCtTZXpVMGdpVXNoQzRaUGdlNUpBODFJMHE5OFV2WUhT?=
 =?utf-8?B?L3lGVEMyZjZOeHZKcVIvN3hlRDJ3MThCTTlxSWJ5OGtOdFdhUElkNHFxRHh2?=
 =?utf-8?Q?SQMOiPtEb4y1O9NOH+OA86YB/eVljMAeltVjvDB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8369d2b-d0f8-4537-9651-08d8dcdbc5a9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:59:34.8887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aq1SVlu0fcYdoegvaK9PuCKCa9OYLpzadQhZQQeg/gAubjvTtvXcw5JmrVodACGBEHTEMe9lXPCGLimCzPGe/i06JWeAl69ZVhVOioZ2XVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3623
X-OriginatorOrg: citrix.com

On 01/03/2021 09:58, Roger Pau Monne wrote:
> clang++ relies on the C++ headers installed by g++, or else a clang
> build will hit the following error:
>
> <built-in>:3:10: fatal error: 'cstring' file not found
> #include "cstring"
>          ^~~~~~~~~
> 1 error generated.
> make[10]: *** [Makefile:120: headers++.chk] Error 1
>
> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> No real risk here from a release PoV, it's just pulling a package
> required for the Alpine clang build. Worse that cold happen is that
> the Alpine clang build broke, but it's already broken.

Shouldn't this be fixed upstream in Alpine?  Its clearly a packaging bug.

~Andrew

