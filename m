Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB247AEFF9
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 17:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608456.946931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlAIz-0003Hz-6F; Tue, 26 Sep 2023 15:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608456.946931; Tue, 26 Sep 2023 15:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlAIz-0003Fq-3J; Tue, 26 Sep 2023 15:48:57 +0000
Received: by outflank-mailman (input) for mailman id 608456;
 Tue, 26 Sep 2023 15:48:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qwzO=FK=citrix.com=prvs=626a79b17=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlAIx-0003FU-B4
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 15:48:55 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3057c213-5c84-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 17:48:52 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2023 11:48:26 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BLAPR03MB5571.namprd03.prod.outlook.com (2603:10b6:208:298::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Tue, 26 Sep
 2023 15:48:23 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Tue, 26 Sep 2023
 15:48:23 +0000
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
X-Inumbo-ID: 3057c213-5c84-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695743332;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yhGNlqaQMSTHkk7ENVHcCFn0DSRl/LNas6ndvhnHfyI=;
  b=iaMJEAMiEFM/zD4QUgL8/anopMCWmK0mscDTsgntsU3o/ACBX64b+dyH
   u5IKY5Zu/HY2O+ol/eEtEfilmIFNd0wQDZdr5bhjvgfk/Lm/BBbtT2IDv
   sxMfsc2RCAeDiPu5Cq8AF8oT60BIMgYLzEPEB3dlt7Ubi8BQ+QOKzbt/t
   M=;
X-CSE-ConnectionGUID: whJoW+ptQCK3cnhVdIBuOg==
X-CSE-MsgGUID: UskK8craTKGbM9997GYpOA==
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 124276668
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:eDgl0q8jWs8xsQtHEHvhDrUDuH+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 2EfW2GEaPfeYWqked8na4i39ktVuJLUn9UyGQdl/i48E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdmNKoV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklR9
 d4fF3MVcimopLm9xrKFRshGm+MseZyD0IM34hmMzBn/JNN/G9XpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUvgNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraVwXmkBtxMRNVU8NZXm16wlmcJASE1elGe8Kjo1WGPQ/V2f
 hl8Fi0G6PJaGFaQZsLhUgKxumLCvh8YV9daCeQ85CmEz6aS6AGcbkA6STpGZM0jpdUBbzUg3
 V+UnPvkHTVq9raSTBq15rqS6D+/JyURBWsDfjMfCxsI5cH5p4M+hQ6JScxseJNZlfXwEDD0h
 jqM/C43guxJidZRjvvru1fanziru57FCBYv4RnaVX6k6QU/Y5O5Y4uv6h7Q6vMowJulc2Rtd
 UMsw6C2hN3ix7nWxURhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:VxA0das7RojoRDIadLxlGn397skDeNV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpgHIKmnT8fNcyL
 clU4UWMqyVMbGit7eZ3DWF
X-Talos-CUID: =?us-ascii?q?9a23=3AlWBo4mlZHZg9hhqQZmeNpEBtNM7XOWLd7nDvYFe?=
 =?us-ascii?q?kME1KE7aTSWGc2Yl5tMU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A8zL+ZQ4+vcR3XXYIddRMX2XgxoxV+KeNWEsXmKk?=
 =?us-ascii?q?llMOhZH0hZBislBOeF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,178,1694750400"; 
   d="scan'208";a="124276668"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POBqUEn/rPuH5/DSyqE+46Sd80mQ3xglUr0GWg6eiElRu04lti3E8UUZB8SxH55iwpYJRiTHDOYpRLwxdgkihFM4dQllIH4W5k79w99Jw+tuKHHP9sXdrWaHMvXzwO/gsgBQEVmMngXsdtFhXbm1XEdZWyNJ6SBioflVUhiWAhRW+OKRuMv4FO/0hAr1/g3dEbwH9RvNyDB8uxM1qfyyyVBbe42rV93lfs6MAQRnUjN198vdbqKaoRLuoSOkEJA0Pss7nYEKQOArdX3jbTmG4ThaC0J66advop1gb45EUiTrM8pHYTxz4DcVDraHyEarAB9D8G4XOS+7yAWLDSDDPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTaeyxMKfuiKQVkgVRQmjTm18PR5jhyKsMf85T9lVMU=;
 b=FTZX9vEf/GnlhxxFYQ6BAkyLS29w5Man44DRK4Zsvmn/DUUGNAhrBSKlD4VAj50yeRwj37fRVnqKTFj94BFNqpyG6nk9p4FYC+d8pEGKoZe5sW7qwOLYTxI1mk79XhsSejU2h7CmZn76nesqJx8uhzi8ozaEhFdM+BIwzU2cOA6Lt2ookRXAAmyUEm3fEQtp3FjHzZPM12VAFLAJC8NqrtOxfac1pIi9nwmXQ1uqXkGGrHavNWKpIS66uvJmtoMsRBVAMr3lwglkp+SUQCtLV1fKf96UhngKSxdYHH4ydqy4KkwusNqgj/ZdMU6cGj+KKhE6nIybhABTGhm9UWAWHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTaeyxMKfuiKQVkgVRQmjTm18PR5jhyKsMf85T9lVMU=;
 b=DoyLP5K1lo6H+kyu4lrlwEWy760kXa30cBtyZLbBaGIWx+RLrrFbLEoivnxb6dzM+/a0a55ouOp/gL62qhi6+rxHXuoGh5INz4JTPkaylAFWWeYpg1AXBCAoAFYrPAomn4nKvr+IZ1RsWumvyF5syZVwHTj+zvubftBJhhenDzk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 26 Sep 2023 17:48:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 15/16] xen/arm: vpci: check guest range
Message-ID: <ZRL9QalvI4VrDQhF@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-16-volodymyr_babchuk@epam.com>
 <ZQ1T8vImUxAaeLdj@MacBookPdeRoger>
 <0a1bc845-28b7-4af8-d6d9-cd5fc7bb4d74@amd.com>
 <ZRKRNcypuvP26luu@MacBookPdeRoger>
 <8a300dad-29d5-2017-70ad-09abc2c62368@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a300dad-29d5-2017-70ad-09abc2c62368@amd.com>
X-ClientProxiedBy: LO2P123CA0102.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BLAPR03MB5571:EE_
X-MS-Office365-Filtering-Correlation-Id: 025331f3-fdf6-4695-5549-08dbbea803d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K+CKt0NQyDuJd+pxIPDuwEnUXP5i/9IlrA3PazDib4sA31fylgvFoHyBImdA4Hhk463cexH1uOUQE+CwjzrVcuJ2TAXKkkQ+xoOKlANUui0kGurIUeuQGMwmbBDloUuEgBksldY7LWTHkLi7l5BAw4p3LmP2fzyPFbwJ93G6AeHXa8uSbvdUWAuhPQP3WPJcvPk/+rzHXngoJd4JUJxM00USZBGgx0dw2YhaAowSPPwYfVdsSCnt2K08H+FhtGzbxOshlEEpUrRN6Mta0za7SUAy3CTYOWsCsCCiKqBIumjJd2RCNWMT5PA0PlPgz2op3A8yh61lR1RfWyOjcUrtVIHiyhYs9bhNromkQ2GlLyMMPY8AE574aVuMuNPeYyn3Z83PebmHIT2zQjxcrLY6I46/oFZjvLq1Ad6dA787rHdACuCChn7nNTORj51tovUHSTrsHKI548dZpaSIRD+xtpXVGZSmjDqYiDI14NUIbFHt+WHc6eifp1EHkRRJvzNsRJStBEI3T96IRzRWo2u6df3YNPV5Z3v2kIcOyOUNmWjKywNS39XaqZFlvvprtbOj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(346002)(39860400002)(366004)(136003)(396003)(230922051799003)(451199024)(186009)(1800799009)(26005)(5660300002)(41300700001)(85182001)(33716001)(2906002)(82960400001)(38100700002)(4326008)(86362001)(8936002)(478600001)(83380400001)(53546011)(6666004)(9686003)(6506007)(6486002)(6512007)(6916009)(316002)(8676002)(66556008)(66476007)(54906003)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUlPTXRtdmNxMUp6TXJjaXdub0NHUHBIS2xLYTlWSzJGbWljRG1yRFgvM3g5?=
 =?utf-8?B?MGJOUVFzblhpdDYzOVEvNzZkRFFqcUhvSXorTWg0UnNHeHphclByVFlFc0Vj?=
 =?utf-8?B?N3JHNWUzTHBIZ2IzVzduRHllK2JRU3VubzRYOVgzSGZXS2RrbWlZeEFremN3?=
 =?utf-8?B?c1UxSnRuZjRoWEREY1NuY0J2TXVDRVpzeEFhZWI0TG9JaUVCZ3E4SDRsL3M4?=
 =?utf-8?B?T2ZCL3lKRjQ0VnhZUlpVU2lYZGlzT1MwRVB4OFpsUm5VREZ5VDlxRThXWHo2?=
 =?utf-8?B?S0g0NkluRktFUFlRVjc5RlZvckNmenh1LzNaNkp3MTV1Nm51THFRa21FcUlj?=
 =?utf-8?B?bTd4M2huRUc5cUlRTXNjUXA1MXRTcUZIbEhtUmRpN1BVR2p2bDJKRWRMSE5U?=
 =?utf-8?B?aENmNC9idnh1ZS9YcWxoK3dqRlNmenUyanF0YkdQbHBZanZqZUlNWDZDaW94?=
 =?utf-8?B?V0hjWnRiY0pZb2dIWi96STh2QXVQbFhpeXFWRVFiQkZxN2xORjVsRjlHUUNh?=
 =?utf-8?B?dkNQNVhPUnQrQU51TU5DUmd3UklvcWppcE1sNFp3ZElYVU91WGk0WFhJVFVu?=
 =?utf-8?B?THg3MXBPVERBdUxmU25aazM0Ui93cXhKcVk3Q2JxVG9xWVdpU215R0pQdUxk?=
 =?utf-8?B?OHd6enVWVUZpT2dxanExTllrSHViT0JlWWJFTHppb243Rm1JNlRMVzEweGlL?=
 =?utf-8?B?UWNJMm9wVTBJYU50WXRPRHhHMjFwUGpYdDhHYWlnMHg3bUdnMUN2QzN5WGhF?=
 =?utf-8?B?WlNKZllqSXJiZURLbkJVZFdFQzFBdTdjR2wyR3BFRUkvKzVWYk5yU2lsRWhh?=
 =?utf-8?B?U0lGOXFWbFFJS0NBZitCL1Z2WlFrZjFRL1V6N1V2RFlxaGFZb3hGWWt4UUJQ?=
 =?utf-8?B?VkNjUHRtT1hESFV5S3hGQkRvREY4dnMwWEZRQkhMQWVSVDlvbEZWRDAvN1Zh?=
 =?utf-8?B?UEtpamV6Mkc3Uk8waHlDa0RySTdId3J6dkZIS2ZxVVJaREx3T3dYaFBIY0I4?=
 =?utf-8?B?ZGhVY2Fmek9pdTN0V2ZhWlVBSEVTaWtqL1IzNkxDQ0JEaFh6RGlWbFduMEp1?=
 =?utf-8?B?MWVITE12N1Q0MmdqY0RiMDhyTDNBU3ZMcHJSNGhiRVB1NXd3RnpXREhVaUdH?=
 =?utf-8?B?dmdkZXBKQVI5eXZyZlRra1hPK3RTYU1tR1Y5TncwMFFnY0NtNVJQSzdaRmlL?=
 =?utf-8?B?TlhWV2NMUUtMaVZVTEtHYUhyaW1OcmtYdkdONGFjUk9oYnFWRDE5OW9NVFJT?=
 =?utf-8?B?U2dZRWVteWM5NUZpQ0VscHhGS1YyNEpYcHBJK3ZzcnkwdCtFTm5mcytJS29q?=
 =?utf-8?B?RXRDQkZHUVhCS1NJdmZWRmk2TlRjc3ljanNBa2NPMXRBZXR5NklnZmZlbFdu?=
 =?utf-8?B?THB1Sk5Ob2ptNVZkb0tSN2RlOVNhNUFwdzhhT2VzanpPaW56enhuS2Ric3RP?=
 =?utf-8?B?bzNLK1FsakdGZlNNMERiNUJvbFYwRjRidC95K1YrMENmMjdONUtYL3JhaFpx?=
 =?utf-8?B?YnhmcGI5OEJ1S3BWdGRQNVlNSVVTT1VlWlVjcFJuaWRUVGtvZ2J4NStoOWtS?=
 =?utf-8?B?aTkwS3NmcVRVTGIrcnRYUkRlQXdPT1dROTRRV2tZQ0xFS3VqOHhVUTJvWklK?=
 =?utf-8?B?UlVIOXZEV1VQSHFsYXduMkpjZXhONkphR1EzSEh2UHlPNnFYQTV1LzFESzl6?=
 =?utf-8?B?SS9EaUhyRXI4L0NmRndEWHBiOVNRMzQyQ2laQ0lXS0hBZE43U0syV0R0dm8r?=
 =?utf-8?B?RDZ3ZXQreHFTVm9HNGFQemx6OUY0MllXTkRFUU1KQzlGRU9kWEJBZ2t0OG05?=
 =?utf-8?B?eFdlQ3ozY29Ecm9kVGJjN3luR25BSXdybTRKZ1R5S1hXdjc4bWV2WEx4N2RK?=
 =?utf-8?B?T2x3M3crUnJKOFk0UGw0dHVvaDJrQUFCaDhGOGhXUEZ5MWduYzZpUlFmUklj?=
 =?utf-8?B?NG56am42SGgxc1RoVlloelVEdTFTMG1ZZjltTk5yTS9NU3VKVE0yWUh5Mnlr?=
 =?utf-8?B?QlZiRzhVMXVpY0lIU2dqc1hrcGRLOUVGa1NEZTRaSVkvOXlyL3JQZk5rYlZl?=
 =?utf-8?B?RTV5SkVNN05obkZlMnZrTlJjVlA5Mmd3bDR4QzdWZlJkNllkNUdIbjB3Smxp?=
 =?utf-8?Q?gWcUSrEyTTte300PhMnVYtBPM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rovD1gGi/yw0nPOrdr7o6MZlmnFV8hirWI24i6hx6zTAbZTTHau54jkCAsJT9RjUAzo9E74NMQgIE228ECrT7hvPwD9THmLyukiElGckCyuSKzlG2APexTYAt7ozLaSEJUrJV/Y0ut+z875sA80ETOA/017E+f/bXsC8C2iiwle6c8K5q4xPgiT7W5hSkjlcbTgwTvvY2znG9QFR/l4gMWF0HRE81gfG7GbYZz/bynogXEXz6FxqZVuBOsCUX1yJVQykBvwLmdpa3WwOYZeQOGLcWr6UuZzk3jXguYgPi6csvurC2POtq5wH71PvFzQ6h3NCnAwporZNMn2jh89iYLpDl58p8TsW/ci8z4ydNpJqFFNS0sfAXVMugTn6g4CfdezcGt/7FEMFRCWVz4kbDx6tcnqZBeWQThGrAiobOCDSdfti3x6Obg6gnw+ZsRgdEbZdPuP7LnqqxJ0JUsyPQPcKnqg6Q8eeZNeYFwEYzN6Gszb13fgdglTv8qWlZq/wzZkThgMA42aq4fCKk52R0WzVlLfFzBNMtp8DCyqlNkNutXJCQtqYuXuVvlUsOsY43cl18uvoJhwDn1cMUx9IY925sVfgeRQ+DFjuFrMZrtv0orzYBngbzdALCWHHpFlkZOTfn+NHWTIh8Zmkjazaq1dcp/1YAejlQ+7DKyzNi7iob+S+/KGKdZlf69+IEhfThW15SmIAEv3SX5/ZhRgf1+PstzrVA1K9bpgChRKcTfv6nGx7uO3rgMxmdLzJH929P8ZRTsRhyRN8h3abcXBc9CVrVO9ax23nVtFWtKzkUFVoreAaFABdI2e/Gk47SSXK
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 025331f3-fdf6-4695-5549-08dbbea803d6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 15:48:23.4162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6tCQ+F+Ocx/I/+YfyB/Ic0wO+2JapmeP9AGIMxCkCPudio2SWO7R4TsK2J2mxawN615asxBQF+5RUfbdAfwgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5571

On Tue, Sep 26, 2023 at 11:27:48AM -0400, Stewart Hildebrand wrote:
> On 9/26/23 04:07, Roger Pau Monné wrote:
> > On Mon, Sep 25, 2023 at 05:49:00PM -0400, Stewart Hildebrand wrote:
> >> On 9/22/23 04:44, Roger Pau Monné wrote:
> >>> On Tue, Aug 29, 2023 at 11:19:47PM +0000, Volodymyr Babchuk wrote:
> >>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>>>
> >>>> Skip mapping the BAR if it is not in a valid range.
> >>>>
> >>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> >>>> ---
> >>>>  xen/drivers/vpci/header.c | 9 +++++++++
> >>>>  1 file changed, 9 insertions(+)
> >>>>
> >>>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> >>>> index 1d243eeaf9..dbabdcbed2 100644
> >>>> --- a/xen/drivers/vpci/header.c
> >>>> +++ b/xen/drivers/vpci/header.c
> >>>> @@ -345,6 +345,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>>               bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
> >>>>              continue;
> >>>>
> >>>> +#ifdef CONFIG_ARM
> >>>> +        if ( !is_hardware_domain(pdev->domain) )
> >>>> +        {
> >>>> +            if ( (start_guest < PFN_DOWN(GUEST_VPCI_MEM_ADDR)) ||
> >>>> +                 (end_guest >= PFN_DOWN(GUEST_VPCI_MEM_ADDR + GUEST_VPCI_MEM_SIZE)) )
> >>>> +                continue;
> >>>> +        }
> >>>> +#endif
> >>>
> >>> Hm, I think this should be in a hook similar to pci_check_bar() that
> >>> can be implemented per-arch.
> >>>
> >>> IIRC at least on x86 we allow the guest to place the BARs whenever it
> >>> wants, would such placement cause issues to the hypervisor on Arm?
> >>
> >> Hm. I wrote this patch in a hurry to make v9 of this series work on ARM. In my haste I also forgot about the prefetchable range starting at GUEST_VPCI_PREFETCH_MEM_ADDR, but that won't matter as we can probably throw this patch out.
> >>
> >> Now that I've had some more time to investigate, I believe the check in this patch is more or less redundant to the existing check in map_range() added in baa6ea700386 ("vpci: add permission checks to map_range()").
> >>
> >> The issue is that during initialization bar->guest_addr is zeroed, and this initial value of bar->guest_addr will fail the permissions check in map_range() and crash the domain. When the guest writes a new valid BAR, the old invalid address remains in the rangeset to be mapped. If we simply remove the old invalid BAR from the rangeset, that seems to fix the issue. So something like this:
> > 
> > It does seem to me we are missing a proper cleanup of the rangeset
> > contents in some paths then.  In the above paragraph you mention "the
> > old invalid address remains in the rangeset to be mapped", how does it
> > get in there in the first place, and why is the rangeset not emptied
> > if the mapping failed?
> 
> Back in ("vpci/header: handle p2m range sets per BAR") I added a v->domain == pdev->domain check near the top of vpci_process_pending() as you appropriately suggested.
> 
> +    if ( v->domain != pdev->domain )
> +    {
> +        read_unlock(&v->domain->pci_lock);
> +        return false;
> +    }
> 
> I have also reverted this patch ("xen/arm: vpci: check guest range").
> 
> The sequence of events leading to the old value remaining in the rangeset are:
> 
> # xl pci-assignable-add 01:00.0
> drivers/vpci/vpci.c:vpci_deassign_device()
>     deassign 0000:01:00.0 from d0
> # grep pci domu.cfg
> pci = [ "01:00.0" ]
> # xl create domu.cfg
> drivers/vpci/vpci.c:vpci_deassign_device()
>     deassign 0000:01:00.0 from d[IO]
> drivers/vpci/vpci.c:vpci_assign_device()
>     assign 0000:01:00.0 to d1
>     bar->guest_addr is initialized to zero because of the line: pdev->vpci = xzalloc(struct vpci);
> drivers/vpci/header.c:init_bars()
> drivers/vpci/header.c:modify_bars()

I think I've commented this on another patch, but why is the device
added with memory decoding enabled?  I would expect the FLR performed
before assigning would leave the device with memory decoding disabled?

Otherwise we might have to force init_bars() to assume memory decoding
to be disabled, IOW: memory decoding would be set as disabled in the
guest cmd view, and leave the physical device cmd as-is.  We might
also consider switching memory decoding off unconditionally for domUs
on the physical device.

>     BAR0: start 0xe0000, end 0xe000f, start_guest 0x0, end_guest 0xf
>     The range { 0-f } is added to the BAR0 rangeset for d1
> drivers/vpci/header.c:defer_map()
>     raise_softirq(SCHEDULE_SOFTIRQ);
> drivers/vpci/header.c:vpci_process_pending()
>     vpci_process_pending() returns because v->domain != pdev->domain (i.e. d0 != d1)

I don't think we can easily handle BAR mappings during device
assignment with vPCI, because that would require adding some kind of
continuation support which we don't have ATM.  Might be better to just
switch memory decoding unconditionally off at init_bars() for domUs as
that's the easier solution right now that would allow us to move
forward.

Thanks, Roger.

