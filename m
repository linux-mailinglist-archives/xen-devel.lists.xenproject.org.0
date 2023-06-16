Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEAF733AC2
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 22:25:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550408.859477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAG02-0007tS-Ri; Fri, 16 Jun 2023 20:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550408.859477; Fri, 16 Jun 2023 20:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAG02-0007qa-Od; Fri, 16 Jun 2023 20:24:50 +0000
Received: by outflank-mailman (input) for mailman id 550408;
 Fri, 16 Jun 2023 20:24:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4sU=CE=citrix.com=prvs=524b4a1dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qAG01-0007qU-Fl
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 20:24:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d50b6333-0c83-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 22:24:46 +0200 (CEST)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 16:24:42 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5389.namprd03.prod.outlook.com (2603:10b6:a03:285::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Fri, 16 Jun
 2023 20:24:39 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 20:24:39 +0000
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
X-Inumbo-ID: d50b6333-0c83-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686947086;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=x5yIJvm/w9mJAlTfEGKym6GIIqbVz4farHY65gGYQJY=;
  b=KSmEhhFv0JSq7ACT7y44WUJyCexO9KEYWEVgSHPjPc1RvKBGZa24/Qy6
   umNNCr5hY2noeOfE0GPXZ1fZOI86DjAU8k9dGFL36AqaBVT8ZDIl1g8Pq
   ObYWOmPjYvOuyMoqAwq9oUUnnXzAYwDGrUJUkRIiU1MWe4eVJKa4voPfw
   M=;
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 113132882
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1OZ/IKLsIvjTH6s/FE+RRpQlxSXFcZb7ZxGr2PjKsXjdYENS0TUDm
 mUZWmDQMqyKMTSkf9xzb4zn9UJV7ZPRzdQ1GQplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4AVgPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5KL29O6
 txDFwtcRTOglt6G0IKbTrlj05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLkmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHqgAdlIRO3inhJsqGGe1m8/Fzo9aVj4+vKIoReCR/B6B
 3VBr0LCqoB3riRHVOLVRBS+qWWYtwUdXPJKGvUm7xuAzKXV5QuUHGkCQXhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqeTcJRBEe5N/LuogrkhXVQ9BsEai4g8f0Hz62y
 DePxAA8jbgOic8A142g4EvKxTmro/DhTBMx5wjRdnKo6EV+foHNT5ez9VHR4PJELYCYZlqMp
 n4Jn46Z9u9mJY6JvDyARqMKBr7B2hqeGDjVgFoqFZ9+8T2ooianZdoJuG84I1p1OMEZfzOve
 FXUpQ5a+J5UOj2tcLNzZIWyTc8tyMAMCOjYaxwdVfIWCrAZSeNN1HgGiZK4t4w1rHURrA==
IronPort-HdrOrdr: A9a23:UTF3K67kuWWN3hyFIAPXwOHXdLJyesId70hD6qkmc20sTiX+rb
 HLoB17726QtN5yMEtLpTnkAsS9qBznmaKdjbN/AV7AZniFhILLFuFfBNDZskTd8kTFn4Y36U
 4HScZD4bbLfDtHZKjBgTVRvLwbsaK6GAzDv5a485/NJzsaDZ1d0w==
X-Talos-CUID: 9a23:9rAiBm9rrB0CqsVFIlCVv3M6FMA6Uibi9yb7AGypNVZ5eJ2RGVDFrQ==
X-Talos-MUID: 9a23:TuYUXQuYXk5Bl0TK6s2nuDxyN+t3xI+SCwNWmqQt4vWYFwlcAmLI
X-IronPort-AV: E=Sophos;i="6.00,248,1681185600"; 
   d="scan'208";a="113132882"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbR2AdBICnd33jA3SOP6xNGx+tJhZjLDel1X3YKRW/uBo5jPz3tGISn3P3+VdniDq8PMSwVxcD1aB1ftapeoAYhW7vaUnieEuaZ4cSaJUrfvBQrUorehh0sRZd8w5M9tEYe/sFJa5ruiWShEmzl/Fwz9CiW3jN12WkeBisTnEc0huFNXX3TawwgDyqvcOlSg2LIeAlnZzZdR/9+H4yDE8j/61ziVsd/Vg8bahGeePHFvjKZHFRmmN+OpaHSSPOydvzPAmT9CoFDqkoRbdn9Mw5d2lWdWinJ7oe/eoXQZC/JIKNhgWrIgmfnznyW4O3RvNck6ydmQNJWOzE4JFHGujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NnPy2zA3JqW1//ijiOnu0qiPH7hueEtjgVnekXnnfs=;
 b=m4rTB39yv67w89PRRYgnumGuEZS1WBbMSgHH5N7qIKaFtfAzlOlSRCoYli/zqOf9aV1gEKgT2PCFfqHGph2bcmNYSYdSSVET4jdXMK00NhHeRoaB+7vF9tDZdnbbhxqoHWss7MIm3bXbRdyhDDL/G+FwT/s3F8r7r+oKNv1BNLIbQQC01oZnJsXgr1X/jaXBMvvBaiDuVvZ/ycg30QbHOMmUjiHjCZi24IYOtEpaAt7syShOFrFayi/fBsuZWNiRJmZGcxWpKnowz7KxPtE4ubgPR7Psr7YaI6mO35J1qGfxSZsspzWtAtF5ZjmvkVaoeVRO0gkLW/Af9PlhQnu7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NnPy2zA3JqW1//ijiOnu0qiPH7hueEtjgVnekXnnfs=;
 b=lQ8YdqaJNTT7E3BGFl0LjOY/Cvxv0at8AWujahUFs6Yd08Bp+yJkg0e1j+HWcAixjyqVUIRn7OQTkafjvXnch8IRsCegZE32Xj89P1B8rl0S3nYv2fv1uoyafQwoo+wkMEhL+0I3BkC20L7ZuHdv5XnfkghzY+eQKbCcelrXY0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8383dd1a-064c-17c9-bb7f-4509518b9b42@citrix.com>
Date: Fri, 16 Jun 2023 21:24:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
In-Reply-To: <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0487.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5389:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bf7a295-64cf-465f-b4cf-08db6ea7b5e3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1SELsfqr/9TUPsl+kVpf6bNTDB6yvDvmMr7rpGm64q5PeGcSYjfpWAkV5wRVJzJWijPO+tlEWoaUrAB84ciIKdFoWBG3jnkqVZG3hqGCDt7ATnDsurT1rfREfssZ9LKscG3YM2fl/KkIRVYKczYA3pxjJWLMtoOhaZwwR32kKPnaiHz4VJc7F4c4HNSXUZy/BB9oGTrST4F6TpJJ9Lzp0IFNq+AYGVsUOQhsjtQloAS2ENIFKHMaiM6oD+6mMXvfHWaybzv1A/JWkR0d8twvYWB2b3/m8tWQrgtw2anWVOQI8wvM79P0erHC5AGy8JS5sQznfMAEvt97xaCF2ohQQuaf3X78urfhP0mxZ++tNlMz3nB1B9r9GZmIg6upnp14yRN8rprx1g9iyorulEutsKLSKDy8T/VancsLt2rjpy0JgHHTv03pal8OXyTl/wkrcEDPuEYHaCu4S0qnEfMcCOhi0/482dq/BNVzoSMY3nH9WCqlsDg85aqSjvdJIFkIPoLrtOtpTvrjrXkrUcvSRSjJtwcWpTbmZSMEcvlgQoMIGUUCbgdl4CK43eQQr5hInmfGw77ecefXv6UnhhCKk8wSLbzWLNkn2wUqSOvHynSK7/NoRGOEEscpDr1ynt83Y/6kG4PvnJf2IASYdBtf9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199021)(186003)(316002)(26005)(6506007)(6486002)(53546011)(2616005)(83380400001)(41300700001)(8936002)(4326008)(8676002)(6512007)(2906002)(5660300002)(6666004)(66476007)(66556008)(66946007)(508600001)(31696002)(86362001)(36756003)(54906003)(38100700002)(82960400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHRoSG40Mk1YWmlwS2EySmVNMzRhbFptSGJUVGs0MlZic0lhTGNvRWxzbEJl?=
 =?utf-8?B?a1ZHbExaMG4vYTMybHpLNDMwZXdqL3N5cEx6YU1JQVp4bHBDQnpPekdJbEht?=
 =?utf-8?B?N3MzTVAxeWg3NkRoRTJacXUzSzhzV1h3QjdNOUJZRjd2aFJaZXRpN2dod21Q?=
 =?utf-8?B?eC9lbWt4VDRJTnpXTW5NSEJVQUEycGtNbWlmVG9sY3FiREViUTBaN2U3S0sw?=
 =?utf-8?B?Y1JsdGdNem41K3I5NkVnZGp1SXB0cGtGQzBNN1Y1MU1lK2NXZkZMWXJwQ0Zy?=
 =?utf-8?B?NXpjanNsdXpocGQxbTdxcHgxb1U3UlpobEJaQlFCbjg1bWdPcis4ekVwaHRu?=
 =?utf-8?B?cDRrN3dBZWZKQkxObkVxMVlBZ1h2ekxXZEtZRGs3VEpJcGsxaVY3VS83WXZP?=
 =?utf-8?B?RHFxM3hXY1JQdElHd0pqYURXdlUxd3l5TTRhNngxVGdENCtCM05Ya3JYaHRZ?=
 =?utf-8?B?Sk9HdHp2RDVBM3NjN3Q0eWZLMkFMSDRVYkdQM21GZmp1UnloZHRERWF5R0x1?=
 =?utf-8?B?MXhVaUt2UDZOZmlTdXprci9ZTTNDLzZnbFBXU01SdmVyMUpoQU1ycHU4L3J4?=
 =?utf-8?B?MzlEOFhnRldoY1hqVkJ4eUtLeG5RMUNzOENoT0RXa2JxeWNlYmlKaEg3STRD?=
 =?utf-8?B?TkhnRlpackhHSjRwUUQySkNoeFdFZWc3TzRrNVN0R2ZmaFNtdXIwNU9mTk1V?=
 =?utf-8?B?RURyK2FraUZ1YUdjK25Eb2RJd05MUTUvY29oWkhDczVMZ1lwRFdFRytFSnFN?=
 =?utf-8?B?cEwxR3VTZGxFMDNlYm1hSFVHOWtEWC9Qem9MVXZrdDZucVRiZHpBcHFPVk1j?=
 =?utf-8?B?ckNxWnJnVmZKTnhFd09UQWZocmN1MnB4VWRjN3NwcnhzY283QUVqSWpEQjV6?=
 =?utf-8?B?L2RkWXVtaGwvazczQXVydmxmMExVenhrUUw2TCtsV2R2RG9VdHlZSVdOWW1L?=
 =?utf-8?B?Q2VqZGwxZ001RnFiR3pFdFQ2NUxkamI4RHZtekVjdkNINlNwZVp2blNBQkQr?=
 =?utf-8?B?WTBUS2hMbTlCamFKWGlPQjczVHB1blZqa0pxYlZGQU93TEdUNG13aGdYc002?=
 =?utf-8?B?OTVLZVlONzZvL2VQN2UwSmtaMkNsWHFiaGp0M0VMT2cyOEh2U3huSUY5Z0Zq?=
 =?utf-8?B?WkgwMU8rQXZ5UjhzQnUxT3JOY1ZyNkY1QjNGWE4vUTUzRmpWSFEvRUpMUmJE?=
 =?utf-8?B?MkJYVlhSRjRmb28zQ0luZzViaXlaMTJIM1ZmSzBhVDhEeHlWUGNSWUpwQVpw?=
 =?utf-8?B?a2d6TnRzOEhJYTdPaTR4bGpuZ3VLYnBBRWhOYnAycGU5Yi80TElVdjVCTDgz?=
 =?utf-8?B?VjBQWHJkaGcyWGFnckhNVFozVlNKQnE2c0dTaXNPeTVkT0RKWUJlNmFXZnRt?=
 =?utf-8?B?eVo1amNwZ0lIb1dlb1NvbEUvaTQxQzJWeFR2SmNUc1hxU2I1SGIzOWhtWTZZ?=
 =?utf-8?B?YWxlNW5WbUtqeDZheUhwT1RRUCtUaG1TQlhUM3M2U0N4U3FjY25rK2I4UHlN?=
 =?utf-8?B?Vzd2OEpXQXpEVUFOQ215QlUybmpUUHhCVjZabURZbSsyNFQzZC9PL0pWUXNs?=
 =?utf-8?B?c3ZGd1ZBMjgvVFRTSlQvWGRRTEMxb094Y3BDN3ZQcnUxMk1IaHdsSWxGUGtU?=
 =?utf-8?B?cmVFMzZuRm5RTlMrRjRBYkVWWEpBY0ZjR0VKdWd3aUFzT2VQSFFVdXl5dnpL?=
 =?utf-8?B?R3Iyemdlbk0rYUY1VkJQVVVJeUZISlR2bE1yOVRtZDAzNGR2cWdXRHNwNWpl?=
 =?utf-8?B?dmo5aFZZTk4yclZacCtYLzFiU1BZb3pBc29IUXdWOFFGWTErOHFSdG5zSzdu?=
 =?utf-8?B?cGxPM1hLN0p2MVlXOGJ1YWtaemlvOGttcm8xc1k1TjNIN1RwaFVJUVgwVXl1?=
 =?utf-8?B?eTI0a2hpNGpJZUxSakU0dDJBMTVkeUdnbE4vbW0wSlFDUE1rN2xPeWlxNXlG?=
 =?utf-8?B?dGhQVmVwSGt1VWx6NFlTV2RKRGZTMWgwUzFvM3dIaDhjTkZXcSs4em1VSHpY?=
 =?utf-8?B?aW90SUZaclFaSWVTWGpuK2k0bFZGbXp3R2FueXVJNkpzMkdGbm96OXJ3ZTRZ?=
 =?utf-8?B?SkMwNVVDbGJMQ1BZYWc1SjZ1dVRaaEhjWFNzOU9iWHFTU0N5anl6R2R3WUVs?=
 =?utf-8?B?TGVUd3c0WXA2OEc4V25ZVExrMFJhSmJVRVFQL1hNWklMS2NKc3FoT1p5c20z?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GseX6IJdgenZ6xQCKYI7ir2KTtNDqXMVHt5g9n6f/IbT+vXJ8Wff8K/1R+pD2e1ysIdKzdYy5yy4z/uirJGtvHocYtGwQdBdl9BKfJqomIKObZeKmj3RyMkCUnbEJ9qzBXbTq+uCfe7BJ0fzQ+30HE0HXX6D04G0tZOQZv0NR9wCnl7uSd++7ydMhmptGRKKVMk2VzTgH6u3ZeJSe7talanmBYNup1JGhPVp9Z6Gj+xkiYzbXDDX7VuEzcsQAdUNJ1Na+P8D0ItuC+inprvxcWfqpb5EQyuHniqehDt5pEdJLC35FgS9Nz+NNCk46FrG1bS6OVBGhcbHwEtNwvqrO262vG7ZP6JOi1VzsV/YkqIfDtAOGTwApFMRLzm3HUIPYoZCD2ZEzM2+6yoh8GL0I8qdRZWxD7ZnToJaJ3q9K9J/1fuiqCuNAvfjMP634vBC7AVZvC77zgeVZWXXz0rhrue7gpdVQQb18tRMq30y+38Sbmpb0HLW/RZd1pzGSDZXJvyhRiLnKdM/D9Vp/NQhu2ao+PtPiBnpS2WdDqUEvFnje0Chrtz/wPeOzbjqEPTYA+TeogmJow2GmJtYQ1FVMbTwmZrb75QiQcojxIwLtgm1balXYT4HUmVDZqfrSYHj5Whj44QdT2HuQg10rOi9FaTEBfP1WfcZW1nIRRLlv4jmU8/fyVCEsDqlk77vOFlpxlZehu1s2bG/LNDqHeJV6bw4W1fBD9GloUnkBpxglRah62smgkyzcCdc/OIvqC6SN9HJSw/52PK39t+TfaVOnJuI2ry8+RbXlTjKbvUV09onxt+1u6T88HCY4G6rW2oOp5kX6i5eWUxPfEfTCuXkBYYbQDTItVT/E9TxbN/Jv7yfda5pvLOryZUxSQKP7qFA7SH1cwnhcrjvQ0GRknYD8XvsETnBZppZywpSxDjnEUo=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf7a295-64cf-465f-b4cf-08db6ea7b5e3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 20:24:39.5878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvlhfQ0glflLbTiqTMrbzS2FTo6d5KaX41NGl/ZIVZUwUfwnY/e6KAeXpY+VTKDHe4ekwvO0HzyUPFsuWfqkyPPpxqPpV0IpObXpsYNd9fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5389

On 16/06/2023 6:48 pm, Shawn Anastasio wrote:
> Add the build system changes required to build for ppc64le (POWER8+).
> As of now the resulting image simply boots to an infinite loop.
>
> $ make XEN_TARGET_ARCH=ppc64 -C xen openpower_defconfig
> $ make XEN_TARGET_ARCH=ppc64 SUBSYSTEMS=xen -C xen build

I think the first of these isn't needed, given the config ARCH_DEFCONFIG
default.  I'd suggest dropping it.

On the second, what is the SUBSYSTEMS=xen?  It's not needed given the
stripped down build system, but I don't see why we'd ever be compiling
Xen with some kind of subsystem configuration for something else.

> diff --git a/config/ppc64.mk b/config/ppc64.mk
> new file mode 100644
> index 0000000000..597f0668c3
> --- /dev/null
> +++ b/config/ppc64.mk
> @@ -0,0 +1,5 @@
> +CONFIG_PPC := y
> +CONFIG_PPC64 := y
> +CONFIG_PPC_$(XEN_OS) := y

I know you're copying the existing architectures, but I'm pretty certain
these $(XEN_OS) expressions are pretty bogus.  The userspace stuff in
tools/ may need to know the host OS it's being built for, but Xen really
doesn't.

I'm pretty sure it will compile with this dropped, so please do.  I'll
see about patching it out of the other architectures.

> diff --git a/xen/arch/ppc/Kconfig b/xen/arch/ppc/Kconfig
> new file mode 100644
> index 0000000000..a0a70adef4
> --- /dev/null
> +++ b/xen/arch/ppc/Kconfig
> @@ -0,0 +1,42 @@
> +config PPC
> +	def_bool y
> +
> +config PPC64
> +	def_bool y
> +	select 64BIT
> +
> +config ARCH_DEFCONFIG
> +	string
> +	default "arch/ppc/configs/openpower_defconfig"
> +
> +menu "Architecture Features"
> +
> +source "arch/Kconfig"
> +
> +endmenu
> +
> +menu "ISA Selection"
> +
> +choice
> +	prompt "Base ISA"
> +	default POWER_ISA_2_07B if PPC64
> +	help
> +	  This selects the base ISA version that Xen will target.
> +
> +config POWER_ISA_2_07B
> +	bool "Power ISA 2.07B"
> +	help
> +	  Target version 2.07B of the Power ISA (POWER8)
> +
> +config POWER_ISA_3_00
> +	bool "Power ISA 3.00"
> +	help
> +	  Target version 3.00 of the Power ISA (POWER9)

For both of these, it will be helpful for anyone who isn't as
PPC-knowledgeable if the POWER8/9 was in the title too, seeing as
they're the most common name.

But as I'm a noob here too, how different are Power8 and 9?  Given they
share a head.S, they're presumably not too disjoint in terms of ISA.

While being able to target a specific CPU is something we're trying to
retrofit to Xen, by default we do expect it to run on as broad a set of
systems as possible.

If that's not feasible, then fine, but if it is, it ought to be the
default.  Which might be as simple as saying "or later" somewhere in
this text, or might be a giant can of worms that I shouldn't open...
 
> diff --git a/xen/arch/ppc/include/asm/page-bits.h b/xen/arch/ppc/include/asm/page-bits.h
> new file mode 100644
> index 0000000000..4c01bf9716
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/page-bits.h
> @@ -0,0 +1,7 @@
> +#ifndef __PPC_PAGE_BITS_H__
> +#define __PPC_PAGE_BITS_H__
> +
> +#define PAGE_SHIFT              16 /* 64 KiB Pages */
> +#define PADDR_BITS              48

Is 64k the minimum granularity?  Or is 4k an option?

I ask because Xen has some very short sighted ABIs which we're still
working on removing.  There are still quite a few expectations of
PAGE_SHIFT being 12.

To be clear, we're looking to fix all of these ABIs, but I suspect it
will be an easier lift to begin with at 4k.  (Or perhaps the right thing
is to double down and just get them fixed.)

> +
> +#endif /* __PPC_PAGE_BITS_H__ */
> diff --git a/xen/arch/ppc/ppc64/Makefile b/xen/arch/ppc/ppc64/Makefile
> new file mode 100644
> index 0000000000..3340058c08
> --- /dev/null
> +++ b/xen/arch/ppc/ppc64/Makefile
> @@ -0,0 +1 @@
> +obj-y += head.o
> diff --git a/xen/arch/ppc/ppc64/asm-offsets.c b/xen/arch/ppc/ppc64/asm-offsets.c
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
> new file mode 100644
> index 0000000000..0b289c713a
> --- /dev/null
> +++ b/xen/arch/ppc/ppc64/head.S
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +.section .text.header, "ax", %progbits
> +
> +ENTRY(start)
> +    /*
> +     * Depending on how we were booted, the CPU could be running in either
> +     * Little Endian or Big Endian mode. The following trampoline from Linux
> +     * cleverly uses an instruction that encodes to a NOP if the CPU's
> +     * endianness matches the assumption of the assembler (LE, in our case)
> +     * or a branch to code that performs the endian switch in the other case.
> +     */
> +    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
> +    b . + 44          /* Skip trampoline if endian is good  */
> +    .long 0xa600607d  /* mfmsr r11                          */
> +    .long 0x01006b69  /* xori r11,r11,1                     */
> +    .long 0x00004039  /* li r10,0                           */
> +    .long 0x6401417d  /* mtmsrd r10,1                       */
> +    .long 0x05009f42  /* bcl 20,31,$+4                      */
> +    .long 0xa602487d  /* mflr r10                           */
> +    .long 0x14004a39  /* addi r10,r10,20                    */
> +    .long 0xa6035a7d  /* mtsrr0 r10                         */
> +    .long 0xa6037b7d  /* mtsrr1 r11                         */
> +    .long 0x2400004c  /* rfid                               */
> +
> +    /* Now that the endianness is confirmed, continue */
> +1:  b 1b

.size start, . - start
.type start, %function

Lets get the ELF metadata right from the start.

> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> new file mode 100644
> index 0000000000..a72e519c6a
> --- /dev/null
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -0,0 +1,172 @@
> <snip>
> +    DISCARD_SECTIONS
> +
> +    STABS_DEBUG_SECTIONS
> +
> +    ELF_DETAILS_SECTIONS
> +}

In the other architectures, we now assert that sections such as .got are
empty, because we've had enough bugs in the past.

I'd recommend doing the same from the outset for all the dynamic
relocation sections, unless you're expecting to have to support them?

~Andrew

