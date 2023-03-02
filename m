Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3D46A83FA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 15:13:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504954.777423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXjfr-0000G8-4l; Thu, 02 Mar 2023 14:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504954.777423; Thu, 02 Mar 2023 14:12:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXjfr-0000DY-24; Thu, 02 Mar 2023 14:12:47 +0000
Received: by outflank-mailman (input) for mailman id 504954;
 Thu, 02 Mar 2023 14:12:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aytp=62=citrix.com=prvs=418692924=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pXjfp-0000DS-KD
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 14:12:45 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b460807-b904-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 15:12:43 +0100 (CET)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Mar 2023 09:12:36 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6444.namprd03.prod.outlook.com (2603:10b6:303:123::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Thu, 2 Mar
 2023 14:12:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.030; Thu, 2 Mar 2023
 14:12:34 +0000
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
X-Inumbo-ID: 4b460807-b904-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677766363;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fOaVJt4ngas8kMFll87hb+qrKm5hpgUlvqKJnggPP1I=;
  b=Y19cHzxyAOyGcW6B3+XobaqvoNBZMuXJ6/AxlwWMcK2+j5uSnuPFEJYX
   zuH1e1mkMj6qFTCzqYuytATYD1CLa1bxYz2XXX0sDY9y4fYGaomjPi3Ws
   s6cDqVxnF3IpF4IP21zOxMK7jM3rxim3Rxggk6SxmxavK+ObnpG9D3lK+
   E=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 98005281
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SPsGwakcYCR6D/Zct/EiCsLo5gw0J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYCGqFPf+JN2WgfttwO96yoU1SvZHSm9AwQQY4qyE2FCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5AWGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fgodDcRYC6ivtPo8qmUGspVp90ScfC+aevzulk4pd3YJdAPZMmaBo7tvJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVI3ieewWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDROXgq6Q62TV/wEQcFwNKbhy/kMPmtWmsQctFJ
 BQI1SUX+P1aGEuDC4OVsweDiHmAsx0HWtsWEPAg7wqNya387AOQB2xCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BW0IaDIATAAFy8L+u4x1hRXKJv54C7K8hNDxHTD2w
 hiJoTI4irFVitQEv420/FnBhy+nr7DTTxAy/QTRVSSu6QYRTISibYa55EPb6ftFJYCxQVyIv
 XxCkM+bhMgHCZCWiCWMWqMDBriv7PeeGCLQihhkGJxJ3z+q/Xikf4xZ/jBlDEhsO8cAPzTuZ
 SfuVRh54ZZSOD6havZxaofoUsAyl/G/SJLiS+zeacdIbt5pbgib8SpyZEmWmWfwjEwrlqJ5M
 pCeGSqxMUsn5W1c5GLeb48gPXUDnEjSGUu7qUjH8ima
IronPort-HdrOrdr: A9a23:OOIW0aoK24+ajKY1gZ6VPGUaV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.98,227,1673931600"; 
   d="scan'208";a="98005281"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FX43nkMp1dyCEf1Txm9tAjCUlFPL0BRwaQcdAPa7361eogfhlw+gk+OlOkhysGhR+q6lVj4hjIdmVFjSD+551VPVRRFU4uZHZ52CUEyurQECu+GeeX5lFAc02yQo8Uwv0Hs/c9nVoK101qsB8sMudpkDJjps82hxShXENa8VmqvZEibVyD7UlLZ9NQ4OFfB4Qp+RS3jFn9eV2DMha+1ppUzA3Q3i5APrgCM2/7bcsomXN3ScykF+4gnQ3fGOLPviP2Go/340I3IfikQFRgdBj5IIG7rj6OIWtTltZYfKvPmgXZG+ov3uZbbaSust7yp8+mDe030ZYnT84vepUz8Dgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FySKrIWGJRmZKRcC6QD8aWgdn/j/04v2B3EY29nCpno=;
 b=docb78HzA6OtfECD/c2AHUUyql8RMwaUiJIca9/JIaQopdv8JJPfEGVxLXJW+7ad1nV2Ss9LQ8R5NWYsXE63nuPUu7oJZII96R+paDB4KOKH/2fU87FPdwy6XmNeW4Hrq73V5IVyiS1R80mmnfo5o0ED5955SsZCpTgVDLOUOk4SLYuvSsrVag5dL1J+u43HUrYF4O4jxWTvMVTrKStw9rLzkGn3Lrg9zcMGE9nwxc6YzhtyRFs5NOnyZ4UZ0yJPtIQz5FdgO2JM5U7TjJKzOHd6XVf6qeflYpKofmYVHuoAinGBCODyHr1mGQ1361rmXaxBXnaf+emP/4ORa0by8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FySKrIWGJRmZKRcC6QD8aWgdn/j/04v2B3EY29nCpno=;
 b=ML+jAO6f4UKKLB8CLOtJY0BQUhqfAaREp/9suSF7/U5IG+z7uLNVvG9j7W7PNC9c17a/rRAvGFkw6oBIAmu6eLqf29lp3UXaF3MHzHC9DhDCZcaxfGcfCgP71wJb4U40jzEnwtM5hyV4yGS88rLND//MPqUuLijop90xgGtRp2s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <092579ae-edcc-f04b-b9ab-fc97b78d0053@citrix.com>
Date: Thu, 2 Mar 2023 14:12:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/3] xen/riscv: initialize .bss section
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1677762812.git.oleksii.kurochko@gmail.com>
 <495bd1d7fc2becdd48bd00253c079971e2231e99.1677762812.git.oleksii.kurochko@gmail.com>
In-Reply-To: <495bd1d7fc2becdd48bd00253c079971e2231e99.1677762812.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0077.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb33fe7-33a8-4472-e787-08db1b282b73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	endk7tju8HrS3OI/9Vyw/YRlajY6rJTBaA4gHX04uzBX8GdjhXfmmSCpLZZu73LXxPa+SgDp/mHza4Ar8N83jCbM4UPrLYdu8KpvXz/iKEFTxLNb+mbBrBCrhOu+Wn7wSs9Q/1l9teKrA+qDawb4xuqKdKcozetcknTSvA8aRFm5Bt6IweMvu79QfMLa6KZ8ELFnrkRmxXd7DIlKCAdaNL+xeYdrpTuBdOTGFUbctc791xAKmNwuny8kgoUt5s49GRvo8bZxEEB1fjHwEUpB+/0vc9SM85iS1W4Qju6i4S+FwjaUCLXwq/4EX7F3YhnXrLaO3GyBVBMKD9tVf0vc9K+pqGV73LH1b6aWsvwp8yjeQPIdLyK7Gc+6KH3olkPfMi2f0Df077znEnLgIjbeHo3A9p3ykNzi8g2HaauPY/IMn6jxWDbWav6bXIbEMx265PufX1Wtr+RavOUcSMApVOTYna0CePhNCInb3dDDujDoH0hdxYFsnYqGnQzUGf+yS88kql0UFBuL4Gc4U25F+HBPe3intdYIdQAewCPVrdqeJByE76gh56nfrYGIUZu8uKWT7UlQr9Gk1q3oTzN97oYrYiR6CFm1rZ2IcAqxgYNh7yUaSIKaX87cYmrV6U4nJWoqnOhoMBWtty0ylhM2ntrGnOH8WJlPmQCIbaH4rFzbyDwADycw/GZYlUCKGapkwb2j1Dt9e4xOsNLDvh/nzGw/obxeHJlglc5MXFY1RDbth/UhaJQ/ddgigR330gAPd5Z3zy0/1r9xMdfX2qItLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199018)(31686004)(86362001)(31696002)(66946007)(41300700001)(66556008)(66476007)(8936002)(8676002)(5660300002)(4326008)(2906002)(82960400001)(38100700002)(36756003)(6486002)(6666004)(478600001)(316002)(54906003)(186003)(6512007)(6506007)(26005)(53546011)(2616005)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm9nMnk1a2RJQjBFVklpOHJQTjFkR3ByUlk2Qk95N3FtMktFQWNOd0NBbUo3?=
 =?utf-8?B?Y3lEYzJIZnVxdHliVXhHbklXWGUxYVVGNHNQTWkwdW45ck9GeTRxQ0hGMlNU?=
 =?utf-8?B?V2dGOWRBWStiUUIrU29GR3FJdFZaa21uY3hobDF1RGVJVlRhL3JaV1JYNFFB?=
 =?utf-8?B?d2l2NjdtRi82MW1vNkZFN2tlR0dDRVhwZzc4bnhTLzh5aHF4aGJwdjc2Ujlw?=
 =?utf-8?B?OE9idjlNZC90TE9GaEtEdEc2dlF1R21sZ1RDcFBucitmR1hvYnRTanZTMjdQ?=
 =?utf-8?B?c0xuS3c2RmttSFhCMERXblJRRm5HK2pmV3ZGQm41SVZJRi9JY2VNdmsxc0Jr?=
 =?utf-8?B?bFlHLzgzMUFvS0R4TUlsTDFkY3BDWkRNUWM4eUFTdWpIajQ1b3ZldGREb0dX?=
 =?utf-8?B?RkxSUnZ3WE90Z2hCd0drOVRtR1RUWUZoaEtYQU5kS2IzWnl4Tm9OL09QaWgz?=
 =?utf-8?B?aHdsSFlFUi9IYjBPWDJ4Q1lFRytjOGpPaFRUSUpVclIxRmVHL3Q3MFFNWm1F?=
 =?utf-8?B?UklUVjRCbmRwVysvK0lpU2Q5ZHJ4Y1lPSms3WjQrd0JJYi9jeTQvaUJKL2ha?=
 =?utf-8?B?V2RZYVlhb2J4bFJDSC8yZ2U1ajRGbVJMUUV0dm44OXAvY0R4Z2R1bGN6Sjk5?=
 =?utf-8?B?S0JsV0tCMC9XSXNvZmdFZFB2Q2JxZWpOd0pkbHVnSmpmL0FLZVdxWUJ2WDRw?=
 =?utf-8?B?ZWRwczV5eHpoN0hieUMxN1M5TG1BTmNEWlhjRU81V0hjNXVPby9yZGM5K1A1?=
 =?utf-8?B?WjZoYWdjU0VNbzZQMmJPMU5zemNCclpMaHRSdG4wY25pbHBwYzRsQjNDUmtG?=
 =?utf-8?B?KytWLzltbWs0bFM4SHRRZnJMZlV6bXZncmxQVmJ2VUFzRzYyZUFjZjkrWXIv?=
 =?utf-8?B?RitUSXJrTFlwT3EzMWh1OVcwemhuWXpPdCtmMC8rbFY3NVBQVFBDOFVoZEZN?=
 =?utf-8?B?NmRYOURwcEplM3pkZDB2MzhnbCttVk5XdEFpYVpSNE83TjhLclA1WkhRT0la?=
 =?utf-8?B?NXIxUDRGeW1tOFV0WVJ2c0ZxeHBZTDBXNkxEMmFkZ0ZuQ0V2TW5VRkxjZ2dj?=
 =?utf-8?B?Q0h3Vm43UElYd1dudFQ5dUlrSHp0ZVN3VWR5TjQxUzNNVVRZVkVIRm1FNzNl?=
 =?utf-8?B?ZlF4YVNQZEJKcm1YMy92SnoyT1dmVmpEeVVKSXEzb0l4ZGowelZ5TXVRU2dL?=
 =?utf-8?B?a21ueGV4UHB6RHYxcEp3c2ZKQU9XQTlmWTEvck9CVExnRS8xbVB0bU5xaWRX?=
 =?utf-8?B?dEUvRDJ2bHhrQUNHbGJzbzF0MnhSOUxCMVNzdDg1OTdna1VjQ2kyd0xlRy90?=
 =?utf-8?B?Mkg1SGc2b3ZocjEwSU9lMTNrUTAzZHJqQXFQdnZXMFRESkhEWVJtdnc0VTlY?=
 =?utf-8?B?UGh5QzNjNERWQ09IMjZ3THpjNkZvMU5VUlVvTFkzOEVOWFROdGpIc2FHMjJz?=
 =?utf-8?B?OXFZbmZubll3ZHhkM1Jjc09kL1NhSGcxd3AwVjBVVkhvTkRQbkk2QzM0NEY4?=
 =?utf-8?B?Y0txMVVVcSthTXlBeTRWUytFYXlMWUtHSG1LQmlZRHJxQy9QMTZ5M3V6eVMy?=
 =?utf-8?B?dUd5eDA2OHdGaW5kT1Q5R1JLa04vWkxoVjJudmhhZ2F1UHNBSzBzaGNqSHkr?=
 =?utf-8?B?M1RDMUNEUmdGVG9wUXdTSDBSRzBnc0FhaklkaWtOM0R4NDJCdmVoWTNyY3M1?=
 =?utf-8?B?ak51QU5ZN1JJRk0xbUlTQ1V6T3FTalFKUTJrLzAxaVdiSW94ZGdyRFkzKzZ3?=
 =?utf-8?B?ZWJERzl5M0FGcGhMeEVJTzQzZllIYk1scGgzRld2T1M5cmdhRWhUOGM2L2RO?=
 =?utf-8?B?bzlmbXFQY05tRFM3S3RMa1lDVEJvamFuNkZZWDdYb083WlV6OExSeDF1QlBZ?=
 =?utf-8?B?QUVNNnNybFl3ZkhxaEFubW8wQmpPQUhQNEM2WWZ4Szl4ZTlCUHpMWVoxVHNv?=
 =?utf-8?B?YmxQZ0NaRlByRElTS0lsMUNHb1JKQVhYN3FaN3M5QjVka05LWmdHWkxpQ1Qz?=
 =?utf-8?B?Zk9lNStFU2laR0gxQmZ4Y1gyRGw1a1hLVVVmWmRKY1MxT1lIOUVKY0d3aE1l?=
 =?utf-8?B?WUQrdVZDaUxINFkyTnRnT0tGcHVNM0hqeVVUK2MvQnFxZFM1WVpFMDhaSmRJ?=
 =?utf-8?B?Z3huM2FYN2NWZDRzRHhlTUVURHJiUmJYaWwwN09mNFZZMDBzZE1pZzJJYWFz?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	maSlBknpO30fKvYrOdlZJJXFs4+QR0XtZfBHABw2kW2aqAxXv8gAgWNKYsdDpWIJfvMfUgMY/uMbsT/J1fw8Au0eWb1PQWvTzs4DCb+dAa5eLKBS5oR/4R/alyCEg15sn/tyqpJJRfqf46ALcGTH+iFloyXBT8N4hRNqITDiTiPKEDWMzg9NFvxaDVo1BIJLtQpN2bCRAAi/JHxnu2dVH9/xc9VuXNByN4htlHFTT7xltcuQc6EVIKTEOe9kTRwLNYtyjpomM2wMHlKe19G3hwAS2nUh3VxFxugKZ+G9sUiK2JwvIGHkQDBMpSjj43nN7327P8vx+8rxTXp9PJhRDDOl5b5vBjIGVPBinLwmKlsas9SCHZ7QpLD788ZHrxDW4Hf/miq3mM/j/RTxYnl6Q3DnP89McJGw5EAtAE5Zb04YBZeF3Y1MtwnFUs4ZBgM0/epyA92s4yS+s3dIduVR+9GKl4ICcOOqp7xOP4p4sQiyP3M6+AfisGGYoMdCdPFhDZHlEsDEZtntWCzwQNpNesHrxuLUFt6cPUBI+5BgUaNsj5/xwaAyEXtNFXpnd4tufKy/eEiG8C6OchQU4VYRcNq5LLyVcGliCI0zbnQfb8ZWm96KgywS3gZ5mGsk6AEiKEWZlI97WQyvy9W7LIvadS84PY+Ffh1JTK+QtdhmsOIitD3ZRlVCT1g1157iAmyvlmx+Xhb+fYzQqr+BS8VSnjIL9Zw0tavovwYnkdNlzDhX2zjHmw8gT5TIu2fuJBZ+FhNb3rUCx1eoibhG4M6njpBQvJWfC3vP0F2wt/JrV/yFn/+iM1xTwgpJH/2QYZgxHlrqborW1HhCrsR7B+5uVh6qVamuHIS9Zv2EPsSvcWZvJoGYVR/pHjvsQt5/o1gNylVXKrVjsIhJu3XV18LtvkgRju3m2AU+0O8Ph1zym2U=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb33fe7-33a8-4472-e787-08db1b282b73
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 14:12:34.7371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+BN5oCsV4/djvG0dJKqn2Vshav2dVRuGCOpH3VMUZ/MKnscHe+sSqsmDWUajBlqGRJcBhuQ8AJRmxaiK8zgBOtIVgTtXjnZ7rUkcAlBBpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6444

On 02/03/2023 1:23 pm, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes since v1:
>  * initialization of .bss was moved to head.S
> ---
>  xen/arch/riscv/include/asm/asm.h | 4 ++++
>  xen/arch/riscv/riscv64/head.S    | 9 +++++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/xen/arch/riscv/include/asm/asm.h b/xen/arch/riscv/include/asm/asm.h
> index 6d426ecea7..5208529cb4 100644
> --- a/xen/arch/riscv/include/asm/asm.h
> +++ b/xen/arch/riscv/include/asm/asm.h
> @@ -26,14 +26,18 @@
>  #if __SIZEOF_POINTER__ == 8
>  #ifdef __ASSEMBLY__
>  #define RISCV_PTR		.dword
> +#define RISCV_SZPTR		8
>  #else
>  #define RISCV_PTR		".dword"
> +#define RISCV_SZPTR		8
>  #endif
>  #elif __SIZEOF_POINTER__ == 4
>  #ifdef __ASSEMBLY__
>  #define RISCV_PTR		.word
> +#define RISCV_SZPTR		4
>  #else
>  #define RISCV_PTR		".word"
> +#define RISCV_SZPTR		4

This an extremely verbose way of saying that __SIZEOF_POINTER__ is the
right value to use...

Just drop the change here.  The code is better without this indirection.

>  #endif
>  #else
>  #error "Unexpected __SIZEOF_POINTER__"
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index 851b4691a5..b139976b7a 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -13,6 +13,15 @@ ENTRY(start)
>          lla     a6, _dtb_base
>          REG_S   a1, (a6)
>  

/* Clear the BSS */

The comments (even just oneliners) will become increasingly useful as
the logic here grows.

> +        la      a3, __bss_start
> +        la      a4, __bss_end
> +        ble     a4, a3, clear_bss_done
> +clear_bss:
> +        REG_S   zero, (a3)
> +        add     a3, a3, RISCV_SZPTR
> +        blt     a3, a4, clear_bss
> +clear_bss_done:

You should use t's here, not a's.  What we are doing here is temporary
and not constructing arguments to a function.  Furthermore we want to
preserve the a's where possible to avoid spilling the parameters.

Finally, the symbols should have an .L_ prefix to make the local symbols.

It really doesn't matter now, but will when you're retrofitting elf
metadata to asm code to make livepatching work.  (I'm doing this on x86
and it would have been easier if people had written the code nicely the
first time around.)

~Andrew

