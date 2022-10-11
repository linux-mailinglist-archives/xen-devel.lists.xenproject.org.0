Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62055FB7E6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 18:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420396.665222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiHk3-0000hG-2C; Tue, 11 Oct 2022 16:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420396.665222; Tue, 11 Oct 2022 16:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiHk2-0000eZ-Tl; Tue, 11 Oct 2022 16:04:26 +0000
Received: by outflank-mailman (input) for mailman id 420396;
 Tue, 11 Oct 2022 16:04:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHIK=2M=citrix.com=prvs=2762267ab=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oiHk1-0000OR-AA
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 16:04:25 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f97b421-497e-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 18:04:24 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Oct 2022 12:04:19 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA2PR03MB5769.namprd03.prod.outlook.com (2603:10b6:806:11b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Tue, 11 Oct
 2022 16:04:17 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 16:04:17 +0000
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
X-Inumbo-ID: 5f97b421-497e-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665504263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=YWW/0Xrlj8OlYzjx1jxvYy8p0hZwDkcqnamKCBlqojA=;
  b=DtHcXWp9qbJ4i8VWcpWbuhJ3CkpiVC6cEy0IND0Lks9C74wvKT46KOnI
   +eSehz1U9UNETdGktCPoZlXPbkDyQjD4KYJvKE6JmaRQrAn9aKV6bqURp
   24CVLavBQr3KpWlsBEAixoJA9yc6NdzzjaxlJFDVTYwu1XfvB56RyS+2Q
   8=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 82474351
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7yxDPq8h2ZPxOQNCn9ltDrUDXH+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WsZDz/UOfmCMzfzfdxya4S/8kkD7cDWztBqTABspSo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpA5wVmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uN0DDBwz
 N0aEx8uYDCDq8XqwuK5YMA506zPLOGzVG8ekldJ6GiDSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+/Rxvze7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLVqC7z2rSSxEsXXqoWP7iWyuVjm2Gq21AwUwIzVgThhMaQ3xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xJmUCVC8HV9Ugu+c/Xzls3
 ViM9/vrDzFytLyeSVqG66yZ6zi1PEA9L3IGZCICZRsI5Z/kuo5bpgnUUt9pHaqxj9v0MTL92
 TaHqG45nbp7pdEP/7W2+xbAmT3Em3TSZgs85wGSW33/6Ap8PdShf9bwtQed6utcJoGESFXHp
 GIDh8WV8OEJC9eKiTCJR+IOWrqu4p5pLQHhvLKmJLF5nxzFxpJpVdw4DO1WTKuxDvs5RA==
IronPort-HdrOrdr: A9a23:4YDSz6GheuwS/O5OpLqFc5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LK90c67MAnhHP9OkPIs1NKZMDUO11HYSL2KgbGD/9SkIVyGygc/79
 YeT0EBMqyWMbESt6+TjmiF+pQbsaG6GciT9JvjJhxWPGRXgs9bnmRE4lHxKDwKeOAKP+tOKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0LbrewQPCRIL4BSHyWrA0s+zLzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHfgWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdrjXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MG40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIZLH45JlO11GkbKp
 guMCmFj8wmMW9yLkqp9FWH+ebcEUjaRXy9Mws/Us/86UkloJk29Tpb+CUlpAZxyHsMceg72w
 36CNUYqFg3dL5xUUtcPpZ0fSLlMB27fTv8dESvHH/AKIYrf1rwlr+f2sRH2AjtQu1C8KcP
X-IronPort-AV: E=Sophos;i="5.95,176,1661832000"; 
   d="scan'208";a="82474351"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeDUgGnB8XTBbP69vb3BIC1dzbzDYtxHgoL4S1mN9UlGc/lEnzAtn4doGh6VC2Lnal4P2h6J2M6PAuRXAu1LP/R9TZzInqDMTN9GExJbKx2k/VXXR3R8UEUCY75kAecHXB2SQsYec90WOcdyYthHR+9oQVa0AHcfagFjMuxPi1n976Yj/aOmg/pbiUDZ2utZs8ZK1thj++tRrzqLfCVimzsEZaAxtXez2M4rTASGfTK4WkxMi7/yuPJ680dn+UySvEfeitUcYEeWn/iQ1mPyeFdm8hRlUEgU94LbTgV4fny5LFq+5zC2TwSl/0uEGxkcGqhvj6A+qEGSKSWgDdoRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhLgI3FpRIlKsmCjqXjQcTnIcwm7M2jzmcvE579jJOA=;
 b=EtFVO7BguQJ3On4g4QpF6cHrAO+tRZ9hsG75hL2sKggdOSy6w6LoBr6WrkL4Im0DcDdPDX3eVEbj06HoXXiz9YAx55ki/ej4Syc1DvebwwtO9twLYQOQ+AMARsPcGOo9Qvv8L6WmKd56iDiw+/AbnpyL17350w+uaxCznIZMObqcx1iF81qYGJCYAHq7V2ng734IayrQrH02aHB+sRNixUijbI0eMEPDx+6eIQ+tR0WwOl3kbqGW6B+OFN7ktZI3zFLbX4D8jkFKX/9O8Peh4tppYCpV/+9trGOfr4uqHdm8TlUc1EtEmKCFp/nRZzevNAKU4SxETlMlnt5Arjb84A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhLgI3FpRIlKsmCjqXjQcTnIcwm7M2jzmcvE579jJOA=;
 b=vDhqzRF+ptG8yU2KHVU4JtLIat+gkDN1pnuD1w29iqT4ryh+oIIZ7XQxFQ8bGTZf7UL93QGhgeO3hpXFcSJdpny4lh2TllP+xueolY50EhyPWnk8NHgPHND0oTDBXU1ZtwbaDYzb1lCxO2wjnIlW0Lz4lsv1bkeHpAo7sSx1rQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17 3/4] amd/ssbd: remove hypervisor SSBD selection
Date: Tue, 11 Oct 2022 18:02:44 +0200
Message-Id: <20221011160245.56735-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011160245.56735-1-roger.pau@citrix.com>
References: <20221011160245.56735-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0261.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::14) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA2PR03MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d5132a-58c0-4eff-dc80-08daaba23ffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4aGoRbXIkMB6zPLVpCjkgMacndO6pA1BaopHEgxfGeTz2s0i4Ikkh+ott9OHrlMG1V7EQM+vYM8juHsSZSmeQjGq3zHfDgeCX2ZZVm8alg2dbLMRanJLQHhYO8fX3+s6PyKkxg3weuNzHC2gUp6TG46kc6uDZvshEv7VZl9+JqpF0rHJGL/QnJKjLclDTAAmhPM088o6qT7bVLjIerlJxYm880uTtCmSdU02tj9fxpdbJTJOm9C/Gd3n8g/OKt/vdDpRsap16WjvZk9tDpcAx/2A8oHJL1ifMlY7BwlkOUUdcHytbG7vFN/csX5vwBb1NU8rPJc5WnjSyFOL0CITElDJKByBqAdXm8Jl4zIgAQmSAtxZ7AKxKKs7FGOzQD4ZCdLOQObAzCGslJiYPjXQmzZigAkE8C9zL1uCk+ZrvIF6Jmcis/8yNFhs7EVgzk1mKiFBclf4HiTAi9WtFxpdZEpQAUsGPUNIYwtXQCURjhueT3QfxWwgfDJ4yPflPHt4k+9mCl5UtMM1HvxoH+1QpZFpLKq/sumaAqHH68plMKIB4SnOY3LmEF78q9LMzpQoxVmUFyiOeDg3j1vIh6tCAHnUHsx003FVhRxYMwPWEloKIAa4PDSswdrOZft1jgB4/oPmx7UkZUYFTa9NHrcUfRujVYFHcOeEj5nzwJvRib/SjpaUE+GGKHGG40X2wNqWc4VWZPeiGIwy8tvKKO4ZPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199015)(36756003)(86362001)(83380400001)(5660300002)(38100700002)(82960400001)(2616005)(186003)(1076003)(6512007)(6506007)(6486002)(6666004)(26005)(478600001)(54906003)(6916009)(8676002)(66946007)(66556008)(66476007)(316002)(8936002)(41300700001)(2906002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3dWbytnYURDOUttQlhxK1d1TG1aNkZ4QlFhY1R6WnpxbnoyZkNBd252Qi84?=
 =?utf-8?B?MGZGTThObEVXMnVDa20veWgyV1lnNlF0aVRPNnpyS21HUU5qTW9xWktRNVli?=
 =?utf-8?B?YVJFZUQ4RzFxR2tBcTAyNHR5ZXB5OTJPTnJFVGI1VWRUWDB4ckhMbnN4eDNi?=
 =?utf-8?B?NkordjZhSmZXTVZaVEwwUEhOaWRFcTVuWjJSY0FsQXRYZmp4RGkyUHk2djJX?=
 =?utf-8?B?UXZKamlRL1RITVJWekNqS2wvd0Fkd01YeW5FZ2Q3eUxuVnRsaDd4Yi9sRVNO?=
 =?utf-8?B?WWJQK1E1czF0SnBEdWR4c3grMWZaTWh1RVRWZ2w3K1dmRXdTWlZ0MWhLdGVH?=
 =?utf-8?B?RUZvTnJCMFlLaDVHSzJuRDhxdndoOTV4dUdoVjFpQXlRVTR1RWovcEJCelRI?=
 =?utf-8?B?MzlrU1ZCZE92WXA1enBmcjROUHBuRUIxQnNXSUQzalRvblhjR0dnL2RXSmJ6?=
 =?utf-8?B?MTEzTzltREhjVHhuazMwdktSdmh1L3VpbEN6RHUxL3ppNW9Jb3pxdmd3SWtS?=
 =?utf-8?B?Ri80QUZuZGJKelorbXZ4VUU4ZWhWaGR5YlkyMnRMSjNFKzZ6RVVSWnVPYkpz?=
 =?utf-8?B?SmR2OXdFbGpPUk1hWjZMeENNdkxXcU9TTFZZK2Q1TTl0SUhLY0lON2RSdXNO?=
 =?utf-8?B?UmtHOXRPTjVXZjNaYmdsY0l4QlV3Uk14dGpmaDk3bVY4d0QvM20zamh4YUMr?=
 =?utf-8?B?dVBPWmUvYllaUlk2MHo0NEhCdTVJSUtOOG9ISHhSWDM5K3A1akpwTm1heTBT?=
 =?utf-8?B?K2NwTVJlTGZsY2ViQVRGVXFJQkgxSjlOSFRuSUNsRnFtOEpoNFhBZ2dQV3N5?=
 =?utf-8?B?cjNRSyt5VkZJRjdqclRxdUdRaHd6TG5tMnFOVERXd08xUXFYOGEwNXNpRGJl?=
 =?utf-8?B?SzlGMWVhckpJWXRMc3BPWExRN0dDcW1YQ0VwNEJhTnNJOEFQUXoxbWx4bmxK?=
 =?utf-8?B?WlNjQ0lvN3RQK21Qb1U2aTJJUWZlcWVpamh0c0h2THByQ2o1TlpwZ2c3WWh6?=
 =?utf-8?B?bEs3dEhwZHF6ZGNOUmd6cUI5QTNKaXVRWDNlQlRQL1gvck0vM2E3MEluRW5m?=
 =?utf-8?B?dnFKWWFHQkp1ME41ZkNmVko1b2FmSG10cWYyL2N6K3BGamxoektGd2lac0h4?=
 =?utf-8?B?Nnlzdm8raDI3M1UwNGpYb2xIMHZ0Nzljekp5QXdhQ0Vzd2hqMGJ6N3g0VzhV?=
 =?utf-8?B?bEx3cS91bi9tWVM4dXBLcXFMZUJ3Q1pVQm40bWl3NUlqeVZVUkVpRWlmUmNB?=
 =?utf-8?B?Ti9SYmgzS1N4RU1QK0JXYmljRGNYcVpnNmNleHJQcm1kNnZDVFAxYjQ3Q3JS?=
 =?utf-8?B?YUhTOVZ0Q0VlaXFHUnlQV3AybnZEOUhDMFBIcStROTZpVHI2c0wxT3k2MTRK?=
 =?utf-8?B?TjQ2S0NkVGRkS3R5TkRvc0FTQVdVamg5dUVIamFKVzU5cFRpdXRrS3N5SlQ1?=
 =?utf-8?B?VWtsYUl5cXJJN3pDbFhrRC9VaEkyWWZWTFlSbHpEK0h5eDlDaGpOT25DRkxK?=
 =?utf-8?B?a3Rvc0hOL2NqMDhkSjhZRG80VllkeVVUd203SHFLWE1pZHBBSGEyaG9FMVdB?=
 =?utf-8?B?clJxaDRXcjBhVGVmb29EM0NKMkJJWE5HbS96YXhSaXFxeVM2c291OFJyV05k?=
 =?utf-8?B?RDhIZFR1aUErN2RkM3BGWllIeVBLbkhrVDRPRlM5SUlWUXhvZUhxY01VRW5G?=
 =?utf-8?B?WXlqREZLcjA2a2hNUHRmYXY5NW5MZ1djTFloMDhkN0RzbFkzQnlDT250ZUFw?=
 =?utf-8?B?OWpjVFdoRGJTRDlEemEwbU4zdUtod29jdWNLTnV6ZnU3QVhvNHZzcklXVjUx?=
 =?utf-8?B?azlweDdxRGpHYUp5U1BEbUh2dnZHWjR6dlBGS0hCemhUWGRZTVdoSzZJVUQ1?=
 =?utf-8?B?dUF2MWdnV1ptaDhDUlVuL0ltZmRGc3lUaFd6ZUpYL0VibEU0dXZqclBxYmxj?=
 =?utf-8?B?V2RNY29jQWZsY2JLS09xVWFlK3hWK01sM2VSSWpXbTkzK01GR2pDTHVoUHd1?=
 =?utf-8?B?WHZNRitJd085bTBnU25VWWZHVWNua0hDeVhuek1Fejh0NWNWT3U4eWRoRHJx?=
 =?utf-8?B?YjJIUWk3V1AycVVZRDNGRUdnT0JEVGNZWlRIK2xUaWxzZVV6eVp3V1dYeHdD?=
 =?utf-8?Q?571BS+vz7+ncQN8EIpHNIxbSy?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d5132a-58c0-4eff-dc80-08daaba23ffd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 16:04:17.6139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUN3AgUwxdSS3W0vPZJeByMrSGUqtdg7JMAdV5iqcdhYMFE7sxveIANUqKswa8kkbkbdZ6Fn5q7dF7Nd4gc34g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5769

Like on Intel AMD guests are now capable of setting SSBD on their own,
either from SPEC_CTRL or from VIRT_SPEC_CTRL.  As a result the
unconditional setting of SSBD from Xen in order to cope with the bit
not being exposed to guests is no longer needed.

Remove the Xen command line `spec-ctrl=ssbd` option and related
settings.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 docs/misc/xen-command-line.pandoc    |  8 +-------
 xen/arch/x86/cpu/amd.c               | 11 ++++-------
 xen/arch/x86/include/asm/spec_ctrl.h |  1 -
 xen/arch/x86/spec_ctrl.c             | 19 +------------------
 4 files changed, 6 insertions(+), 33 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 68389843b2..f2666b881a 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2297,7 +2297,7 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
 ### spec-ctrl (x86)
 > `= List of [ <bool>, xen=<bool>, {pv,hvm}=<bool>,
 >              {msr-sc,rsb,md-clear,ibpb-entry}=<bool>|{pv,hvm}=<bool>,
->              bti-thunk=retpoline|lfence|jmp, {ibrs,ibpb,ssbd,psfd,
+>              bti-thunk=retpoline|lfence|jmp, {ibrs,ibpb,psfd,
 >              eager-fpu,l1d-flush,branch-harden,srb-lock,
 >              unpriv-mmio}=<bool> ]`
 
@@ -2365,12 +2365,6 @@ On hardware supporting STIBP (Single Thread Indirect Branch Predictors), the
 By default, Xen will use STIBP when IBRS is in use (IBRS implies STIBP), and
 when hardware hints recommend using it as a blanket setting.
 
-On hardware supporting SSBD (Speculative Store Bypass Disable), the `ssbd=`
-option can be used to force or prevent Xen using the feature itself.  On AMD
-hardware, this is a global option applied at boot, and not virtualised for
-guest use.  On Intel hardware, the feature is virtualised for guests,
-independently of Xen's choice of setting.
-
 On hardware supporting PSFD (Predictive Store Forwarding Disable), the `psfd=`
 option can be used to force or prevent Xen using the feature itself.  By
 default, Xen will not use PSFD.  PSFD is implied by SSBD, and SSBD is off by
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index c28f2d5220..cfeb8d1daf 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -730,11 +730,12 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
 	}
 
 	if (cpu_has_virt_ssbd) {
-		wrmsrl(MSR_VIRT_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
+		/* Handled by context switch logic. */
 		return;
 	}
 
-	if (!set_legacy_ssbd(c, opt_ssbd)) {
+	/* Test whether legacy SSBD is available. */
+	if (!set_legacy_ssbd(c, 0)) {
 		printk_once(XENLOG_ERR "No SSBD controls available\n");
 		if (amd_legacy_ssbd)
 			panic("CPU feature mismatch: no legacy SSBD\n");
@@ -777,12 +778,8 @@ bool __init amd_setup_legacy_ssbd(void)
 	if (!ssbd_ls_cfg)
 		return false;
 
-	for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++) {
-		/* Set initial state, applies to any (hotplug) CPU. */
-		ssbd_ls_cfg[i].count = opt_ssbd ? boot_cpu_data.x86_num_siblings
-		                                : 0;
+	for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++)
 		spin_lock_init(&ssbd_ls_cfg[i].lock);
-	}
 
 	return true;
 }
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 9403b81dc7..ee5c7b8d54 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -66,7 +66,6 @@ void init_speculation_mitigations(void);
 void spec_ctrl_init_domain(struct domain *d);
 
 extern int8_t opt_ibpb_ctxt_switch;
-extern bool opt_ssbd;
 extern int8_t opt_eager_fpu;
 extern int8_t opt_l1d_flush;
 
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 0b94af6b86..dcee9795a5 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -56,7 +56,6 @@ static enum ind_thunk {
 
 static int8_t __initdata opt_ibrs = -1;
 int8_t __initdata opt_stibp = -1;
-bool __ro_after_init opt_ssbd;
 int8_t __initdata opt_psfd = -1;
 
 int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
@@ -126,7 +125,6 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_thunk = THUNK_JMP;
             opt_ibrs = 0;
             opt_ibpb_ctxt_switch = false;
-            opt_ssbd = false;
             opt_l1d_flush = 0;
             opt_branch_harden = false;
             opt_srb_lock = 0;
@@ -263,8 +261,6 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_ibrs = val;
         else if ( (val = parse_boolean("stibp", s, ss)) >= 0 )
             opt_stibp = val;
-        else if ( (val = parse_boolean("ssbd", s, ss)) >= 0 )
-            opt_ssbd = val;
         else if ( (val = parse_boolean("psfd", s, ss)) >= 0 )
             opt_psfd = val;
 
@@ -471,7 +467,7 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
                "\n");
 
     /* Settings for Xen's protection, irrespective of guests. */
-    printk("  Xen settings: BTI-Thunk %s, SPEC_CTRL: %s%s%s%s%s, Other:%s%s%s%s%s\n",
+    printk("  Xen settings: BTI-Thunk %s, SPEC_CTRL: %s%s%s%s, Other:%s%s%s%s%s\n",
            thunk == THUNK_NONE      ? "N/A" :
            thunk == THUNK_RETPOLINE ? "RETPOLINE" :
            thunk == THUNK_LFENCE    ? "LFENCE" :
@@ -482,9 +478,6 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (!boot_cpu_has(X86_FEATURE_STIBP) &&
             !boot_cpu_has(X86_FEATURE_AMD_STIBP))    ? "" :
            (default_xen_spec_ctrl & SPEC_CTRL_STIBP) ? " STIBP+" : " STIBP-",
-           (!boot_cpu_has(X86_FEATURE_SSBD) &&
-            !boot_cpu_has(X86_FEATURE_AMD_SSBD))     ? "" :
-           (default_xen_spec_ctrl & SPEC_CTRL_SSBD)  ? " SSBD+" : " SSBD-",
            (!boot_cpu_has(X86_FEATURE_PSFD) &&
             !boot_cpu_has(X86_FEATURE_INTEL_PSFD))   ? "" :
            (default_xen_spec_ctrl & SPEC_CTRL_PSFD)  ? " PSFD+" : " PSFD-",
@@ -1274,16 +1267,6 @@ void __init init_speculation_mitigations(void)
                        boot_cpu_has(X86_FEATURE_AMD_STIBP)) )
         default_xen_spec_ctrl |= SPEC_CTRL_STIBP;
 
-    if ( opt_ssbd && (boot_cpu_has(X86_FEATURE_SSBD) ||
-                      boot_cpu_has(X86_FEATURE_AMD_SSBD)) )
-    {
-        /* SSBD implies PSFD */
-        if ( opt_psfd == -1 )
-            opt_psfd = 1;
-
-        default_xen_spec_ctrl |= SPEC_CTRL_SSBD;
-    }
-
     /*
      * Don't use PSFD by default.  AMD designed the predictor to
      * auto-clear on privilege change.  PSFD is implied by SSBD, which is
-- 
2.37.3


