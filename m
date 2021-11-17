Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6244C454669
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 13:28:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226834.392125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnK23-0000Z4-El; Wed, 17 Nov 2021 12:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226834.392125; Wed, 17 Nov 2021 12:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnK23-0000Wg-Bc; Wed, 17 Nov 2021 12:27:19 +0000
Received: by outflank-mailman (input) for mailman id 226834;
 Wed, 17 Nov 2021 12:27:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=74+5=QE=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mnK21-0000Wa-HD
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 12:27:17 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1e41311-47a1-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 13:27:16 +0100 (CET)
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
X-Inumbo-ID: b1e41311-47a1-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637152036;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=t9GlDXRoiPCQAnRTgXeT2TH4FFi1pR/U6QVUnBeqyaM=;
  b=cwIO42DElV68nHaSghyQ9/4H7OppkXhBL/3ktt0pF2udGhvEjbePtoGR
   SMxxTl4N6BiWNjAlYrl4SNmwpaxb5nUWHNolP5vd3Zq/O2m8ZgZqiTFN2
   qORGEnYQKjNPtDhWK6143Fn4XdX+R+VawsFFuzVTnHTHOj1LoMPqCRI8H
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0ShfleCdCWoh/mFTC+kGl9oU4JMcsV3Ma61kn0eaqBNo59ZR5oCWRSdm3NMsLbkVAwA5sLK7tV
 j80Xhk3bn10rMm7fxmgFU5moklm1w1CA4q4YBmRmlulONoyqO7LW8oztKNZbqbpgosyqEIX7JN
 Qbsc+/Jf6e3iQ+lssu2IEudpF7YWwOZaGTGhLrd+HqnzKEizAAnZQu1+Zhu1QSJqf26zy3y1xB
 UVpo20uZt5bcxupSCawd+sjKy7nseHHpSwOYS5jh/512bcE+DMwFPnSV7AUQHGycIZuYsu1Oib
 ODZ6CxVYB+rVGzsObhN6PYjB
X-SBRS: 5.1
X-MesageID: 57984589
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BY1WAaIBAox86+a4FE+RQpIlxSXFcZb7ZxGr2PjKsXjdYENS0WNUn
 2ROD2+DPv/cYGr2Lt51Pd+2oBlTvcfWy4JiSAZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es6xLZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Ipvtwz
 MQUlqWPbhUpbq6P29UeaxhXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Xuo4IgGpg16iiG96Hf
 uUGUx9wVSjyXBEMMQoHBo0xpumB0yyXnzpw9wvO+PtfD3Lo5A5s1LngNvLFd9rMQt9a9m6Dv
 X7P9Wn9BhAcNfScxCCD/3bqgfXA9QvkXKoCGbv+8eRl6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZtjiXTWorXicpBkeVtFMVeog52mlyKDZ/gKYDWgsVSNaZZots8peeNAx/
 gbXxZWzX2Up6eDLDyLGnluJkd+sESksBm4GdHYndDQi8dmzo8JwvxH3T9k2RcZZkebJMT33x
 jmLqg03iLMSkdMH2s2HwLzXv96/jsOXF1Bov207Skrgt1okP9D9O+RE/HCCta4YRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yLzFWyzyGsnTKuMDiriUWWxC
 KM0kVkPjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwPhHIjz+xzxR2wPxX1
 XKnnSCEVy1y5UNPlmTeegvg+eVzmnBWKZ37G/gXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 403Cid+8D0GCLeWSnCOqeY7dAlWRVBmVcGeg5EGLYarf1s5cFzN/teMmNvNjaQ+xP8L/goJl
 1ngMnJlJK3X2SeadF7UMy87M9sCn/9X9BoGAMDlBn7xs1ALaoez9qYPMZwxeLgs7ut4yvBoC
 fICfq297j5nEFwrIhwRMsvwqpJMbhOuiV7cNiapemFnLZVhWxbI6pnveQ62rHsCCS++tM0fp
 by811yEHcpfFlo6VMuGOuiyy16RvGQGnL4gVUX/PdQOKl7n95JnKnKtg6Zvcd0MMxjK2hCTy
 x2SXUUDveDIroJsqIvJiKmIop2HCex7GkYGTWDX4azvbXvR/3a5wJ8GW+GNJGiPWGTx8aSkR
 ONU0/Cjb6FXwAcU69JxSu85w7g/6t3jo65h4j5lRHibPU62Dr5AI2Wd2ZUdvKN62bIE6xC9X
 ViC+4cGNOzRat/lClMYOCEscv+HiaMPgjDX4Pk4fBf66Stw8ObVWEleJUDR2ilULb8zO4I52
 +Yx/sUR7lXn2BYtN9+HiAFS9niNcSNcA/l26MlCDd+5kBcvx3FDfYfYW33/75y4YtlRNlUnf
 22Pj63YirUAnkfPfhLfz5QWMTaxUXjWhC138Q==
IronPort-HdrOrdr: A9a23:/p5Dh6i/qYK4aYvj9Ittk45iG3BQXzR13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskaKdhrNhR4tKPTOWw1dASbsN0WKM+UyHJ8STzJ8+6U
 4CSdkANDSTNykCsS+S2mDReLxBsbr3jpxA7d2us0uFJjsaDJ2IgT0JbzpyRSZNNXR77NcCZd
 Khz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlKl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFc9ccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiW7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri2knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYds99RrBmcEa+d
 RVfYHhDK48SyLYU5mZhBgj/DWUZAV8Iv/cKXJy+PB80FBt7QREJgUjtYkid0w7heIAoq9/lp
 H525RT5cBzp/AtHNFA7Z86MLOK40z2MGTx2TGpUB3a/J9uAQO+l3ew2sRw2N2X
X-IronPort-AV: E=Sophos;i="5.87,241,1631592000"; 
   d="scan'208";a="57984589"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGEYAicgErzBf3u+28q1PZ+fvLG71V5iZUWoWPMfw4F9QHmYp7LBDr1BuG/0YdAXwg2RCdz2/vzxZ5Ivs0x6ubR6kRbkGX2gAKOiG80Q73Do6FFqZNgaPKP8ECqZVDhmfTW9k5mmH1RyRH8kZu4wztvrIkLjUnxbMqVPWHk6+BZGJ0B0InafkXdwb3hvcNYhLEMEEKaGk9eWMlBa7hmVej8rVaWRitzxa7J7fJxPgFskHMyiPCDp8zH++rHl6h6nyup8tSbc8ioB08+Y/Xg5GKD4Tn8/tHb/OQ2n47Hpw20N09Zyfb17PfG22CjkCCBrXac3bxQlPNnuyccaepPm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fujjj3Mv1RnDlkPyMs1wkPWMDUbz5z63iYfbGKEyPI4=;
 b=gH6aKiqrib/iylUwd+WjAIarc7TynhzsCEaa2Nzyr/ZWqq0abmhfbhgH5h1JJ5JidPWGl1jmJEa3FLj6eFChxlDLklM/OfzrYx2nRoG0a9rUmICaeicSVAEL9y3T+mnv/Ta0FQ821HFpgKEbHVElcinORT7jGB8LUJBPMJHEMf+ZT3tV2uPVQKEJLSn1e5S/cgEsvKVYUqj9bg9r9vG+B3xBVU0DPmUtfBML85B5OmkR4/0pwnooOs1v9D5p2s3NaGe99sNHqVaYZXypBbk430dJ+WytDtz6SOXMB5wuogPTyAuSUKqGYuIAVHMxewXlAj+hqgkGaDguYtqCiUy+6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fujjj3Mv1RnDlkPyMs1wkPWMDUbz5z63iYfbGKEyPI4=;
 b=kHCKxiczB4lrteFb8Z+Je52dUZPp4bk1Z4Bkl+v2/nS+foWwikhFSLVLRIphBm1zjR4jh5Znvh1h93VMG5N6j7+JV/5bMi1IZ3jjsWvr5puu1EN658RbqTVCyW9c6I6g17Gp7lC4xmo/409qqCeAZFoobghnW/5RARVLX4dtSgA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH for-4.16] MAINTAINERS: declare REMUS support orphaned
Date: Wed, 17 Nov 2021 13:26:47 +0100
Message-ID: <20211117122647.17872-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0139.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e92fb404-8a37-4e3e-5580-08d9a9c5932d
X-MS-TrafficTypeDiagnostic: DM6PR03MB4396:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4396A9D2246040DF1DAD94EE8F9A9@DM6PR03MB4396.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Fr6ObV6mxLcOSwRvO7qxLLua2Oag6+hF4QGT7UZR2cF5gKMeJozwtFeiBayAzSU55bfP+UIKJmUc2neVUGhimT0xyCnYzF3+eVJcHRIm4mBFGslMcg3VM+GuRtblkSLUgndL6OFsP1WZlLQjVBbf45gfJJ0NkzNFNOcCJGME/7TXME6hnqpKbFTNDGCjh0P8a7SJXuZEtgkfA+eD5wOQliKjNl6UdRj22td+okPy6Y7CRY8H6Crdeary7s7gyUl5WV7HdZ9gx4pQaRgTtjmMIDPqlpcrP68rw9lLymDkq1f8O6ZcJx7PwHwJZhDyFBE+vBRRTz7DManaRVyBz0JOfHvzqr0KCjjANRVVbLLsA4/eX64C+ezCjtrLrZAcYiK8zGay5ampjzBZ6ikxJksLyUuCdf25d4KaJYPe+NwcYCyar9UzOjL0Ea5wu8q1/acH8jYcqA4qGYp+JyG0bwo6IEHPxo2ZYXV715BpcfUFKl6U0Px1PfJTvXSstcHAM0q0a9HN+XSr5IrfXsJaR9Ctlp6jKtveAyeX9Wt/WR8JZA3s0uKFjP8nfu0jq6BWUfVtQiuhpz0X6OmI4KacZugbgl2l5oHEGO6WAvNfmsf9onkFNgbJ6JezsH+msQrPV3+nPuz3u8TMDrl/rKvLEervrzRtjGcfWwFBlulM6569gboCFOZz1szmyMBW57JcOf7bqh39uJcDfWv59aJWb3PmYshzCFwb3sTSXvh8XYpIq8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(2906002)(1076003)(8676002)(4326008)(83380400001)(36756003)(6496006)(8936002)(6916009)(6666004)(4744005)(38100700002)(86362001)(186003)(6486002)(66946007)(966005)(66476007)(66556008)(82960400001)(508600001)(5660300002)(2616005)(956004)(54906003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGJZd0R2U3lqTkJLRGFvZjVVbkVOdXFmaWNkdTVxdVZ1Y0l1UXBBZHcxMERx?=
 =?utf-8?B?QU1WdWorMGNXb29BZlQyaWpiamE5U2h0T3pCQnNIRjA0OVNNSFdRVGE0Nm9B?=
 =?utf-8?B?K0ZaejZVQm42QnVPNXZ5bnJNc3lvS01paDBPZGJOUkFuSGw5NTltL3B1Zmxz?=
 =?utf-8?B?NDc2R1ByWVlEMWtLVFlaU2JhT1Y5QmpPQ21LME9HbDBGSTVadkRORC81NkQw?=
 =?utf-8?B?d0tLNi9SdGZMYzVpNWdTVkZwYWpSdkIvOGFheWR1bGU0MXlMYVBmOEVyN0Mw?=
 =?utf-8?B?Znc1MTNHUHYvWGsvSTd2bUxISllJbThsNFJGalNYazBCbGZyUC84ekN0OVFQ?=
 =?utf-8?B?MXN3K2NMK24zQVF3ajF0RnQ3Z2E2M0ZENUMwTngwUXhCMGg5WHZkaW4wcDFX?=
 =?utf-8?B?REJ5N0w4QmZlUDUvRWhLckQvRWpUUzlBR2JtdlpiWnYrQW9TWnU0Tm9iVTFj?=
 =?utf-8?B?bEU4ckh2UWpCUUNLUzV3NzdDeFRsR2NCaGJHUEFFd3JmQkFGb1VOakhabXoy?=
 =?utf-8?B?K05QTDBHNk1hdGFmQjBMT1R4WUNNZXdCcDh5NDc1S3h4TjNNUkQ5VEU1RjhU?=
 =?utf-8?B?TnExOTJ6SmxQSW5LRU5sOE53SGZVM0wzRHhzM0FZM21xd0RrRDlwbm5JS3JC?=
 =?utf-8?B?dy8yWFFvUzkwTmdOaUNnM3cvMVJGRjhPRUxCSWFJaWtaVVJIdXVMZnRRUDM3?=
 =?utf-8?B?SHNVSEJJWDhac1pMbi9ZNFVWd3Q3dTFYaUQ3a3JGNXVYVytDN1hiZjZFSXpa?=
 =?utf-8?B?UUp3YkZ1aEpOQ3RVSzB1aStxOWxuN0c1azYySmVMZjJteE15TE4yWFlIRENW?=
 =?utf-8?B?dE1RR291ZTk2Qkd1RHR5WXBkVWsyMWUyVzJFemFka20yRG14SGp1cGhzYjAw?=
 =?utf-8?B?Q1V2WTlPTUorWG9WdnJaK1dwRlFmMTFtQzBsTWtQRXhOUHZtamQyUkhUcGdT?=
 =?utf-8?B?Rm5teWtpblcvSmpkdC9uOXJQeVBSQ3I5QjJiVXNka3NMVTEvVTZ2Y0diU2VJ?=
 =?utf-8?B?TDhHSThuQUsrcXYwNWZ6R0oxRk5HMVdIMmpYeWpqVWRPZC9zZ1RWODJ5MHpX?=
 =?utf-8?B?QjlYeG42YU1nWXJsQzZnbnlxbVZ3a3h5RGlYVWwxTlpOWEQvREtreitSNGQz?=
 =?utf-8?B?emlaZU5SZUpKb3ZFLzdrOUFiOURRU2FBcGJ4T280d0RDK0YreE1jSTF1MUxh?=
 =?utf-8?B?eEl5dGhiZ3RPTnhCMEFLSjhpS0RsVkUyUHc4aVpZS3E1T3pGT2ZsdVBFVGcx?=
 =?utf-8?B?Vm40cVJhZmUrWGczKzhjQ2tCS01nQkdIUlZ5ei9HcHU3cys2aldML1EvajJP?=
 =?utf-8?B?SFZ6MzBxdnlhb0lpU1NnQlp5TGFhT1BWUlI4aVdQQVhmZmtiVHpZVDd1VzAr?=
 =?utf-8?B?VUZhNWFMQVp4R25aNFMxdWovcWwvaU8xNVQyQ3ptMkhuaXk2eml5N0hJcjRx?=
 =?utf-8?B?M2FpelplTHAzS3FkMTkvRXlubGxwYWpmdUttT1ZGcHdHT0Jwa3hVV3hkUzk3?=
 =?utf-8?B?RmVRSkR3SE5nOGQ2SWhTeFovZXZqWG0yMjRjemQzVEs4REMvcWFidmk5UXpk?=
 =?utf-8?B?alBXZ2JGVXZoOHd4bmVxSzhlTDYzUDBOMHRGTHBNUTl1aEpoZmdxWERLU3NW?=
 =?utf-8?B?ZmFHOElYbXZlT0lJb3dLQU9SMks3OTRMNkRsOFlGRGo1UnBzTVNaVCt5ODM2?=
 =?utf-8?B?YzVBbGlDelJ6TG40ZTByY2dzRnRXdk5jek5leXVpQ1hKZ3cvOS9Sa254ODAx?=
 =?utf-8?B?MnFzRFUvMTJFNlc3UkoxNjgwbnZzQ2czc3Y3bHpTbHVvV1NrY1poeXcrTTU3?=
 =?utf-8?B?WkpiYzMzcEZZN0ZwdnB0QjdBVmhnRGdKS3M4QkZzRG5nWTBiYnlKL0R0VGhY?=
 =?utf-8?B?czZQV2ZSWGhENXVpVlRLWWlaNVZXNEFpNklIWGZBblZMc05saUROL1FXaDdP?=
 =?utf-8?B?Sy9ieDVSOTBBdFFiMXI2QWQ2R1Vnd0RtWlNHYjJnaVI3WW9aNmNpNXJDYUsr?=
 =?utf-8?B?cDFtRmRZdjA3SDJOSTlHTHJuTDNMc3dzcXM3aG5xOS9EZEVTR2xPRnFBcW1P?=
 =?utf-8?B?RkpqV1R0WGwvQXRnbVE1a2NqUDArQnZGWTBFNEtTOHAxMXdrT0h5NUg5YldY?=
 =?utf-8?B?VEJIcm1Ua2xVazB5eTIyNUxrRVZ1WjRocE1tSG11Z0xCZ3ZlNXpyWGFnbDdT?=
 =?utf-8?Q?KN7aGmV/7KIvnEKNaZQI8QE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e92fb404-8a37-4e3e-5580-08d9a9c5932d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 12:27:09.3634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RoR9X4NL68ENSCBTWPX/ZKDfUxYN5LYSQYwASRad2uY5kttmBt9bvXMF5R4/5CGVJT1OWbh9VZs+RP/owUo1Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4396
X-OriginatorOrg: citrix.com

The designated maintainer email address for the remus entry is
bouncing, so remove it and declare the entry as orphaned as there's no
other maintainer.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4956db1011..f67f70aed3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -470,8 +470,7 @@ S:	Supported
 T:	git https://xenbits.xenproject.org/git-http/qemu-xen.git
 
 REMUS
-M:	Shriram Rajagopalan <rshriram@cs.ubc.ca>
-S:	Maintained
+S:	Orphan
 F:	docs/README.remus
 F:	tools/libs/light/libxl_remus_*
 F:	tools/libs/light/libxl_netbuffer.c
-- 
2.33.0


