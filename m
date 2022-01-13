Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8399948D5F8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 11:44:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257066.441511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7xae-0007Tn-Mw; Thu, 13 Jan 2022 10:44:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257066.441511; Thu, 13 Jan 2022 10:44:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7xae-0007Rw-Jf; Thu, 13 Jan 2022 10:44:20 +0000
Received: by outflank-mailman (input) for mailman id 257066;
 Thu, 13 Jan 2022 10:44:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=64pG=R5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7xad-0007Rq-9T
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 10:44:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1198481-745d-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 11:44:17 +0100 (CET)
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
X-Inumbo-ID: c1198481-745d-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642070657;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=GvyM8INLhdQI/evUBwzWDA4gocSs4jglUkbFXNMfF5g=;
  b=Bi16i6TU1xhNR5a4leu4QvoAwzPp9LcjE/vp7OjnTl6ZNRHBXeIefulg
   2D54vJV71ascQUliBuZMkIq9WTAB2Qye16hlRjp/vD0fSdjj6KJTOi3GU
   11BqWQNeKe2S56QATbuei6subc4wkiGJmHdWBbV8tijcZk0WCIyeEr0Q6
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: eEjk8EvFIyNFesVo4+7ThAnQFTdWSxTMt110wEHW2hpUGQbJGyvAWT/JsI7KZu27H97d+tml+g
 +lYWkw7F+ZimtjcC6uyQWuHT/652r6anCv5EiPf73YjNXUNVEw3Z3tI2lyQ3ahKmjrk2aJS0gS
 djPjRxLlWLVxW3KtU/gLP7qw/xD8llZvNjbZZVpRpLnvyc3whAw8F0ubq1pyJh7T6+24ZwhejF
 INA7cq08KivmTBEreJ1NmKbkY8kS5UbQvI/Zn4I4WVjPjtohid4ppBcZGicYxMJxqa7eisCIxc
 u9xkOyLgHqg3Bq62xsFSe72R
X-SBRS: 5.2
X-MesageID: 64033648
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eYLkS6jle516uJsbgk05Kh/VX161hhcKZh0ujC45NGQN5FlHY01je
 htvUWnVP/zbM2ejL98lbYm2p0IGvp7Xm99lSwBsritmFSwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcx2oDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1fpMK9ZzgWZZaVwugjciYFNjNEEpd/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u2pgVRqiCN
 6L1bxJWTEjLOAweBW4aM7MdhL+XhWCldRBX/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 nLL+SH1Dw8XMPSbyCGZ6TS8i+nXhyT5VYkOUrqi+ZZCglee22gSAx0+TkagrL+yjUvWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalgwNBdd+LNJh01jXxpT13Fu8FFIrdAcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRON/Ni2+AswGzARN8wGCxFAnpU
 J8swZn20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mumknfx83bpZfI1cFh
 XM/XysLtPe/21PwPMdKj3+ZUZx2ncAM6/y4PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1gmQv7GM6qpzz6gev2TCPEEt8tbQrRBt3VGYvZ+m05B
 f4FaZvTo/ieOcWjChTqHXk7dgFVfSNlVMGv+6S6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLMtsDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:S4EwkqkDa5JFCVivTyHIoUF44JfpDfIu3DAbv31ZSRFFG/Fxl6
 iV/cjz8SWE7wr5OUtQ/exoV5PtfZqxz/FICMwqTNGftWrdyQ6VxeNZnOjfKlTbckWUnINgPO
 VbAspD4bXLfCFHZK3BgDVQfexP/OW6
X-IronPort-AV: E=Sophos;i="5.88,284,1635220800"; 
   d="scan'208";a="64033648"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6zhd1o4BkHpDJ/rk6qPpu6DLeS7ZrXezTGywai1KLLlDHTHxxgzsw9rf1FbC1LWKeG12FqkgaJYupHWTQjHWrZa4Yl7dRAsQyo9dLLv33CyLjero40rY77y6frTv//HAeraCNWbhsHrdv8UrqnB9M/H5k/WZ4LSvaRLM0Q+8498l17X35ScoiyeEtc3njAk5G977vwni1gaU/Ms96qs6Ga0KaTH6ooqVabALISxTXfrr3i963IueLqSWRDUBSFVQfX/9h8HvM08/+O7l9dxiChoSSoZ4lggtAjTBjTwH7MQCNDla+FngT4KOX8uQ1AbX2e/HesMCeaFL8rdbaWZ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJgE/lnFG4lbdOsHNhP4NZqM1TfQh5y+gwICQ3tkiUI=;
 b=BEOXkA7456rzfjTRHFOT70EAUKC5JEeyBU3+CxPMErA+N4N5YWW9q3h43Gg58JHZHG/RQZKD8VOAVIdS1vmw60hszdTtfTiZhOKxIkm40HKd4fNpRiUnCKR/c5if8JFaAR6/SldqK8tdJO9lFoq5vGApMlCLdce855hhPFMVNnaQi7ND8j4oxlluNZMRHOlpWs1ckUJ6oV0bysbXXMYCTOP1qhtMFIWe4Fx+W+U3FLvr5SbqkXaF9cKB/nUzb/CmknK/rDo2iO+qqkbLQ+Yt4XEctnnfUsoOZZLDTy3AHbTmYTe9OoqRK0T5LFxurGJLb1FXt1gWTI9kymU0KRvmXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJgE/lnFG4lbdOsHNhP4NZqM1TfQh5y+gwICQ3tkiUI=;
 b=IxoH5r4OL+jFP+LqwLPpi6ngLN9QbKBg0+1SGUFECnOssssqC5hsqyzxthrKzW8af5q7cam85o9DoVIXbHbiQH9tgL+eZKKnu/YntzhgQYKBlk1vcEbMNd5YJvCqDJmono4lnkRkk1HOabBHeGI+8s263dQhVRjYWOSaObsCneM=
Date: Thu, 13 Jan 2022 11:44:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/time: use relative counts in calibration loops
Message-ID: <YeACeLWPuKDvX4N9@Air-de-Roger>
References: <595b3447-0eba-dfc8-fa24-6bb8b964a137@suse.com>
 <34662095-6f58-4471-8bbf-1bdf67650fb2@suse.com>
 <0bd1cdac-14cc-dda4-90a1-50a1993ff978@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0bd1cdac-14cc-dda4-90a1-50a1993ff978@suse.com>
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 632a0ef3-96f2-448e-e748-08d9d681a317
X-MS-TrafficTypeDiagnostic: MWHPR03MB2864:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB28642501F5161E95AA678B9C8F539@MWHPR03MB2864.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MwVi3iEw0E+2zadgtC/D47k5gcT7jn508xBAqySfFK8Sts9kHrFS2CqcMaHD9Cmd0qAP5/dc/8WAdM2VjTrSfle9CI5ggkNbGG1GsbcC9wOZQcx0Iy6IEdvWPXkha1epNpqwuPZO7d2jxH/3PuJvIvvPdL6WhrglOalM3tjqXPZ4c6nj1H8BrCdni1Sme9vSR7S54ji4R+lcbsxQhpJRodLhu+9vpxLWZ5TsH4rwC72Yu/S9TIMzme3P1nopPB3DYGffY7wauMs6pftSlAOc+TUze2NoEtOp5doH5blvfu9Yl+WBjOqOcg7aXelRpR0oJYSArKGOLwcNDd0gBffxCrzrt1PGKoprmP9HZhSP7PJbzWja5n+Jro46cOuWoKg+uFhbN5LfXDWJmSvVCnPFa6foeU0bYwexLPevNAP5qx4dXmDaQIVn1PFMgbRZ7/Hsz3cvgeKxr5lvrK9wLugwtBzo9gY3Vbg35gdsnfINCoKH2r6E1wSMAJGORHVweppEYR6pN/s88Z8rRAoIGKhHq3nLDEj6pu1x0EPLZA5kNLBwGSNXoFLGHI002w6VdEYkMuctHCy7rK75aE9iKmMnR4XINqY7ANlBwrAGM0vpl3SJad+z22L0qyrEmZ4M2ip/FRKNtl7ho2HxkS5qsgUCNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(5660300002)(6666004)(83380400001)(6512007)(9686003)(2906002)(33716001)(82960400001)(508600001)(66946007)(53546011)(6506007)(186003)(66476007)(6486002)(8936002)(38100700002)(86362001)(8676002)(26005)(85182001)(6916009)(316002)(66556008)(54906003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3J3bmUrWms2VVhjYlFsbWh5SDdwU3I5UXVqVFJsSHdVRjJ4TkVmbWxHU3B6?=
 =?utf-8?B?U0lkM0hIWm9VQjhqZjMxS1UzR2lDVGZkejc0MkMyaU5LREFtbytKcXdDQ1VT?=
 =?utf-8?B?UzJUdU41MkhlZC82QWpLYnQ2dGJsSGhPWlliQU40RVRCSjNzNHduQ216aDhN?=
 =?utf-8?B?ZUMxRlJydmo0LzEwSitBckk4VWFnNFd4c3dIaGpibGJ6SEMxL2RWeUpYMmsy?=
 =?utf-8?B?Z2NqdEpxUWZ3TjlVTmcxZDVNMTZLRDBhWjh2TUVaekoyeUJlSmFMRDRINVVN?=
 =?utf-8?B?eFkwSTg4U3NNMUVzMWlaS0RHZkRHZ0lDTnAxamtWL1NZQjNhazdnMEhoWmEz?=
 =?utf-8?B?QWowb3dYejQ3ZUFjbjFLaDJMRnVGNmNua2krZkwxZ2VxWW1yUndsNGlQM3FD?=
 =?utf-8?B?UVFqOEVWWG5CRHpsR2NjOHpLSjJSMlRaTXM3WEozb2poa3ZTbzFqRzNRMXU2?=
 =?utf-8?B?VElBM3lhaTFVSS9NbUFteWNWSWNYTnJiRzNubmE1N3VkMWd4U2hSbFJiSmgr?=
 =?utf-8?B?blp0K0JMUjRmSE9nT2kySEszQjZpbTRkTDhUVXJpdFY2MkNrNW1FelAwVW9M?=
 =?utf-8?B?QVRWb05DU3FSS3lSL1hLTFRNeVhHM1dJNmM4UWJEdCtZVnMyK21FVSt6Yk5H?=
 =?utf-8?B?b09kcngxTjdYYXpoMkkzZ1ZHUlcrckxVcjdLNXdXY0R0WFBsamJpOTBacUlG?=
 =?utf-8?B?YXBmY1dpYXpEN2lEUXhBQVVqd3ZtT2RxSXplZ1hQQldORG5DbVhpaThHRXRq?=
 =?utf-8?B?QitRTnVGSXFZcGdUaXpMcnNCWTlqOFJwZzN3Vm1rTGdNdGtGdWFyUzI2akRP?=
 =?utf-8?B?V0pqRjhwckFpTmRqSFAyVU5ZWjE2SU1aYXBpZi9DcmFmK0xocjdZTVVYdTdO?=
 =?utf-8?B?UkMyQTh1QUNsa1B1SVdOSXU4OHFEWUhqWWcxNisxZEwyWkhXLzgzWEtpM0VY?=
 =?utf-8?B?eXNaL2hQR253VGNSQ1FpNFo2ZFNTSkIxZVlya0xicHM4UDBvZHFwdUYrZXkz?=
 =?utf-8?B?cC9Od2hLZ0FJcnN4M0xaQ25ZMFU5UkQ2LzAvTmdiYUU0Vk9zN3dqM2lPYWt1?=
 =?utf-8?B?NWxaNDJOR3h3ZFM3eDdQZ3hnK1hHeDQ0TUJrdWwvSjNjTGoxVmw3MXQxcmY0?=
 =?utf-8?B?SnY3N2cyai9pN3ZNa1Z1RS9PSGlIS0Z1aUxrQzNsc1RiZHIzQWxxZ0RSVmtW?=
 =?utf-8?B?R2daRms2T0xoYXFSb2NKTmFHbTdpaUV1WWJGTU4waUgwb0dkdzBwR0doM0po?=
 =?utf-8?B?TVJGQXprZ05ZTTZodHg0czlQdkJwVFA2WGJ1TTlWWkQ4bnh0bDR3SXlUWjJG?=
 =?utf-8?B?dC9DS2hxQjdMd0NNNllpcVY3N3IwUFR6S2hqWGRWNzFST0VsZ3BtMUNOK2l2?=
 =?utf-8?B?NUIyMWVJanRBZDVESUFhYW02b05KVUVrenIyczE4ZFQvdnU3YVhwbHQ0MlM4?=
 =?utf-8?B?QU5hVUhBeDZUL2d4VEtFa0VhakExYUc4M0dzUnQ1Qm12YWg0TzN5dElYQVg5?=
 =?utf-8?B?bFVicWxQYUFmNWN5ekZEbmNCdWNlUlV0ZWNPSm5Ecy9PdGtLN1V6Ujl2ZHZ0?=
 =?utf-8?B?cmt4YjNjeGNYNFVKUDhjNTVtUlFDYk1qcGZhejVqY1MwNDhpK2c3Zk5ya2s5?=
 =?utf-8?B?RXJKcmQ1Y3VUWUNoTVVnTHNHKzE2RGFsU1RiUVVSMHJTbUpOUkEvSDJseENK?=
 =?utf-8?B?cS9KWHpqU0lRSWVNNnh1RUk0YXF5UUYzSlhDOXZ0U0J6ck1jWmtQeFhyYk9W?=
 =?utf-8?B?SWEwZlgwMG9CZWxpK0IwYjZTbWpvM0dVZHVueDJZdG5Sa1VsOHpnRkhqM2Yx?=
 =?utf-8?B?WDFWQ29pQjNMWlJNcnAwMXk3WnBrTElRbUtZWTFQNlVUNUxJQ09ndmJ1OWpW?=
 =?utf-8?B?M2l0a05OVWt5WjVKdWRHTmdZbUIwSzFtSmphQlFKL3pRcGNKQWhJNzgzUzE1?=
 =?utf-8?B?QnlsVkdqUVU2RWtDNEEvQWxFR1Z1QjFZRk1kK2o0Y09tQVJtNVp2djd0Wng3?=
 =?utf-8?B?QnlWZGZ0K3R6Tk1abWl3WDErWmN4dVpDVnpMby9OMWtaTFY0K3A2MXBpaVhr?=
 =?utf-8?B?MXYrQmtyWXVJS3lOWWNGSVZQYUFGOXJ6dGMwbUZGbkx4MTRHeVNQNGJDRG1t?=
 =?utf-8?B?NmtnNE9ZSjV0L3lGT0RCU21QNitCVUt0RFN3ZEdpZks2UmdDZ1MzT1JQNVdT?=
 =?utf-8?Q?fNyRAn8H+6usd7BpVn0UyKc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 632a0ef3-96f2-448e-e748-08d9d681a317
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 10:44:12.7200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wulBU1VTD3dr479H6xuy8pfKRrC3TZ8xPTwiwTgarTHjw8AD1Ja3/bPafkOg4vsmc/fNKqxqd0aUMdOzXLC61g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2864
X-OriginatorOrg: citrix.com

On Thu, Jan 13, 2022 at 10:37:53AM +0100, Jan Beulich wrote:
> On 12.01.2022 09:55, Jan Beulich wrote:
> > @@ -504,11 +501,8 @@ static s64 __init init_pmtimer(struct pl
> >  
> >      count = inl(pmtmr_ioport) & mask;
> >      start = rdtsc_ordered();
> > -    target = count + CALIBRATE_VALUE(ACPI_PM_FREQUENCY);
> > -    if ( target < count )
> > -        while ( (inl(pmtmr_ioport) & mask) >= count )
> > -            continue;
> > -    while ( (inl(pmtmr_ioport) & mask) < target )
> > +    target = CALIBRATE_VALUE(ACPI_PM_FREQUENCY);
> > +    while ( (elapsed = (inl(pmtmr_ioport) & mask) - count) < target )
> 
> I think this is wrong, and instead needs to be
> 
>     while ( (elapsed = (inl(pmtmr_ioport) - count) & mask) < target )
> 
> There no similar issue with HPET as there we always have full 32 bits
> available.
> 
> Roger - you gave your R-b. If you agree, I'd like to retain that with
> the fix in place. But I'm not going to commit either variant ahead of
> hearing back from you.

Indeed, or else overflows past the mask boundary could make the loop
exit early.

Please keep the R-b.

Roger.

