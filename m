Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C111E5FDB91
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422199.668054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiybg-0002yF-AU; Thu, 13 Oct 2022 13:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422199.668054; Thu, 13 Oct 2022 13:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiybg-0002vo-7M; Thu, 13 Oct 2022 13:50:40 +0000
Received: by outflank-mailman (input) for mailman id 422199;
 Thu, 13 Oct 2022 13:50:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/C9=2O=citrix.com=prvs=278604417=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oiybe-0002vi-6H
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:50:38 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02394f84-4afe-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 15:50:35 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 09:50:28 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6928.namprd03.prod.outlook.com (2603:10b6:a03:43e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Thu, 13 Oct
 2022 13:50:26 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 13:50:26 +0000
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
X-Inumbo-ID: 02394f84-4afe-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665669035;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=6H8TNepMDy1tEC3S7wQ7tXw6bFt8+k41RWcWVl6xt9s=;
  b=Tj1OYEme2/Y5l/jOXoABegQTz5TiJwEPAf3SjLNcww4A6WdUPL/Kqcyu
   1LXht744lOIbGJj2QknqEipUFxuze7DadFmgSgcm3/l0DxOGIka3lmt8F
   sq5yoqouyl5LNdfjR1UYUWhEq69acFOUdQmf0YFYP/ot5fzq/7905erUi
   I=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 81766386
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Q7JqK6JLZzSUJGNEFE+RDpQlxSXFcZb7ZxGr2PjKsXjdYENShmMOn
 TBLD2iHOK3eY2Txf9tyPYripBkHu56Ex95lGldlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz98B56r8ks15q2q4WhA5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FbRF9eFsBjBUz
 tJbMBwHZzmEi8jrmZvuH4GAhux7RCXqFKU2nyg6iB38U7MhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9QPT/PRni4TQ5FUZPLzFKt3ad8bMXcxItk2Zu
 njH7yLyBRRy2Nm3mWParCz31rGncSXTQbxRSqaqrOxQnlTOhVcZGCA3bQOxrqzs4qK5c5cFQ
 6AOwQIsp6Uv8E2gTvHmQga15nWDu3Y0e9dWCfx81wiLxYLd+QPfDW8BJhZDddgnuckeVTEsk
 FiTkLvBHidzubeYTXac8La8rj6oPyURa2gYakcsUg8t89Tl5oYpgXrnXttlVaK4kNDxMTXx2
 CyR6jgzga0JiswG3Ln9+krI6w9AvbDMRw8xownSAGSs61ojYJb/PtL4r1/G8fxHMYCVCEGbu
 2QJkNSf6+ZICoyRkCuKQ6MGG7TBC+u5DQAwSGVHR/EJnwlBMVb4FWyMyFmS/HtUD/s=
IronPort-HdrOrdr: A9a23:IGuPYa64la+7oj+ROgPXwUOBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc0AxhI03I6urwQpVoIEmsvaKdhLNxAV7MZniehILFFvAB0WKA+UyqJ8SdzJ8k6U
 4IScEXY7ecbSkYsS+Q2njdLz9U+qjgzEnev5a4854Cd3AOV4hQqyNCTiqLGEx/QwdLQbAjEo
 CH28ZBrz28PVwKc8WSHBA+LqL+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwI0l7X
 POn2XCl+ieWrCAu1PhPl3ontprcejau5p+7Qu3+4gowwDX+0mVjUJaKv6/VX4O0aOSAR0R4a
 TxSl8bTrhOAjXqDySISd+H4Xim7N7ogEWSjWNwyEGT3vDRVXY0DdFMipledQac4008vMtk2K
 YOxG6BsYFLZCmw6xgVyuK4Ii2CrHDE1UYKgKoWlThSQIEeYLheocgW+15UCo4JGGb/5Jo8GO
 djAcnA7LIOGGnqJkzxry1q2pihT34zFhCJTgwLvdGUySFfmDR8w1EDzMISk38c/NY2SoVC5e
 7DLqN0/Ys+OPM+fOZ4HqMMUMG3AmvCTVbFN3+TO03uEOUdN3fEu/fMkccIDSGRCe81JbcJ6e
 T8uQljxBAPkmrVeLyz4KE=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="81766386"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPuw7TAe5Ae/WNImbz/jrvWN4OIAqMo1oygcY3uSmh9VCKKuBwtYuRtC5eN87Fk+Ki+iP0ARyOhWYK0eyqKhdUSVNb1BUoEKpDFtVocGTRiUPlZmETNJjs/u1SU1p42ES0qXsFKCgLJmuWW8L+MmX2emTx4LGSCXt3DCrD+Kx4Rfg6SHna5vPgEkByJbHC9LI7d8COVrMxzhJny+AYA/qbem6b1wyGBhIxV3aLeMKGPjLJmA7oREHdknMl3JAsdfIh+cVNj9nKqGUdMKDa8yLTou1YKSkS1vUBYlRfiNKIabhWU6PkITmYX889+2MKGWNHwW+LRKCl16RTF9BiiNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsxRnJe6PHh0LuWq8mWDdYzXj3FlnsjYLNKKGA6jGI8=;
 b=bJYjLEHbBTaGubukXYQ3x6c58l6KCxv6VXre9DGBJLFUrzk2ejiEV9OqIvoK/VSDTMEIQawWK/E2iltcpaea2Akq+YqXT3X2nZe4lcCO2pZFE4nz7G25VQVQK0AmKQUSGypKOKQSTNYJwW6F0S/wy9kLBc0DU3f5LIAP9WpZyiel9jGa8sAW+Al+LdxUXzhNEtgR3ws08DMa3NZfHsaisCq+aAGb9s72puy1YSOYYj7H0h0J9VTQ1KB3J0r4KMvGsQAZvAARDBwefDaiWw2g9MCLcS/L5sDUPjh2mIfo3cgF1K5FZqihBv1jUA30mkphR9ELT5TlvotpePjrHMGBcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsxRnJe6PHh0LuWq8mWDdYzXj3FlnsjYLNKKGA6jGI8=;
 b=lLwFhyOf1x4B5sWIde/WKeMOgNnwd+0t+kc1rrwGXz1sm72/BMwzKGnTKkHMTQWDShr3UY20YXUAum45ZYlLdFfUzbNC+ScRlJAjlzfcnfnbzubR2OCyipERvszDjOW2nRozOFTdZi4x5+dyXZISnTfrgScQ0oU+qSOtczkPPJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 13 Oct 2022 15:50:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17 3/4] amd/ssbd: remove hypervisor SSBD selection
Message-ID: <Y0gXnD4jsyIp2kKb@Air-de-Roger>
References: <20221011160245.56735-1-roger.pau@citrix.com>
 <20221011160245.56735-4-roger.pau@citrix.com>
 <ce274b68-4f9b-0b1a-6b1d-faf002ecbb54@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ce274b68-4f9b-0b1a-6b1d-faf002ecbb54@suse.com>
X-ClientProxiedBy: MR2P264CA0172.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::11)
 To SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb6bde9-db24-4a6a-0272-08daad21e1bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vr4wtlmvw4H7swRTU4GACelfbK31dB0dadyzICVIiyG1Hkodcx3wmEVCn0K1t0ZaJdn37MexZKAUY50HnORa9vDzzVy6UqpG/NT7EFkiU82U91SsKo0J1D1iqVuFGtrJK7JISiwRsRm9RPdh4LE21RzB8uPBQ4e508RIvwqTbEpFidy6OpUNXVYQ3Vp/OrADZbx58r8/0jz4isrKa7FOT0BvazT+zWhpemWHfp+uRhG9lj3702jCzI2o2O9t3/wdpyrYIcb0upSA3+1ClrtdS8U4PzwF+m9qS0ywKwNfIdeLb69zHIoTp/1teiDmjuHfGZEeS4R9FPfomO2dODw8CvvFCjuPLz11IZNRHT7jxNLbQy3mecntGbeFCAqpSnYmwygX8P4ldmK705D+saehD2K5rb/7UTFalDjOsiTdiHSzCtoxKhg7EpVrlTVouSg8xgHvus0X9SQvo20toVK/MgCtyxu7nooGSxFPbVLT/Or+R3413a+zWIdzKKSZV5O9MRju0dRMROZNxV0AtzuL7rl771f2gDNIvq+UAVdJg66VMZawx4RhNYTvaGFKH9f+DBuuGTvBjpiKQ79fqubrIxvaD5QZ2kMtmtO/OYM8dqN7IQ8wlAeXBQw71/rs0KsBu2gg2Xjw9qbLAbQLx4JJ6FUWKbkaSW54CNhNxj1gx3pVum1SAHPT52EkkmzKLTbHByV/kzvPc8evW4In+MMzSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199015)(8936002)(38100700002)(82960400001)(478600001)(86362001)(316002)(6506007)(54906003)(6916009)(6486002)(5660300002)(2906002)(8676002)(66556008)(66476007)(4326008)(66946007)(41300700001)(6666004)(186003)(83380400001)(53546011)(33716001)(85182001)(6512007)(26005)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1drTWZDMDdRRVhEbG56em5jVS9YVU05OGd2VVFLWGlsTkp6U1FrSWF1TU0v?=
 =?utf-8?B?S0t4NGkxUCtSVWpsRVYwK3JUcjRtb2RCczJCOGZsZjVRamhqMm9WR1Erdkx6?=
 =?utf-8?B?Y0N4SGg3MGFna29CcUd0N1IyWHdnOGxyRC9COHhRV1MrME5SZkN4czdpcGRk?=
 =?utf-8?B?eEJRYjlDT2MzdnMydkIzZjVEVjlRK0lURTlpeE9NME9XRkFHSm8yckxIU3My?=
 =?utf-8?B?NnM2VGJZVmVRRmIzMHQvMFF4dzdBTnNWZ0I3QnNESXcwSTlWUkdDdnNRaVd3?=
 =?utf-8?B?WEtqVWpHU1dBN1ZWQTE5OGdKT2ZGMGwwdER3ZlEvV0hCdVllRlg0S2k3ZjZQ?=
 =?utf-8?B?MGY3MS9XZTVXejhYaUxMTFNJU2RCUWFBK2J2Q0RQN0UxMllSVEpOckJuQWwy?=
 =?utf-8?B?WUtORTBuSFdaOC9PcnFOcE5HdkhCaFUyRlhMZDF0N3ZueHVtOXFmdGVab1Vk?=
 =?utf-8?B?b3N4MW9HOTRpVVNFRitQSFpFNzZwNVhrdVpRdWxjVk5ZbnJnLzlpZ2pQNDZX?=
 =?utf-8?B?eEY2UzJJTEJhK3V4WFR1SU1wUTNpQ3ZnajdMZXFsWTJqc1FWMVo3Z0o4ZlNp?=
 =?utf-8?B?cExPdElTZ1diRE4vaXY2Zzh4UUxqSFVraGszTHM3cHJjdU9qZGtNQ2EzVkFT?=
 =?utf-8?B?Qi9xcGpmcFNncmI5OHBLSTJzNVN6RjFMOVZja1RWZjRuSEZTL2FZbnNYYWFS?=
 =?utf-8?B?MU1DdTYrQ1dOWGFLc1JDUmNmMC9CcGdBMS84MitYVkFMRVlNQTMzbHBFSDBN?=
 =?utf-8?B?cE1rQy9pSUR0bWRYUm9XQUdHazE4OWE4aWFnT1VkOGpDR3hBOWhxd3RKSUFX?=
 =?utf-8?B?Vk1RaW5BZ3JzNnBJemlZTnZaeTU4WUFkRHVZeDlyaW5PTy93dmNyL05xeU83?=
 =?utf-8?B?RUswcVRLL1JQZ3YxSTQ3dXJRSU5GMnRrN1NVOXpsTmVjVWJ1QnVValNjTmww?=
 =?utf-8?B?Qm9ISm1vYkdpakI3R0g5TnJnb1BWamJ6c0pXeTBxTTJXcWROb1ozSENXWWFR?=
 =?utf-8?B?NUVxTVBQSGIwSWJFN3JidmJEeXhRb1U4M29ESG42Z0Q2NmNDeDFPeUt6dEVn?=
 =?utf-8?B?TUExbFhWLzI5TExmWm5kOTJlVllpVFc3Rzl3UTdFb3czd1h0RGJzbVpHNWwv?=
 =?utf-8?B?Qk5VOUU3bWdFa3l5ZVZmZnBSU2trOUVxbERNMTYxNWZRQkdNd094WDE1MnY0?=
 =?utf-8?B?QnZQVDlRb0Z0Q1hML2ttSmlmSzhCaWlUQnU1V0JTcUFWbnR6S2N3RkhVTFQw?=
 =?utf-8?B?UW4wMGRja1ZEM0syeU93OTZxNzBQNkt4MzNjYUN2YzF3YVE5dzYrT2x0dWJT?=
 =?utf-8?B?Q3BaclNaVWxuRDBGUHpzT3VnUXpkcnI0cUxiY1hwakx5Qy9RMmVYZ2ZwYmJx?=
 =?utf-8?B?c08vTUtZT2ZHRFBRZDQ5WkZLeUpuNXlneUhXTG94ZDVOeFRGSTlpNDdpcm1u?=
 =?utf-8?B?VXp0aWl5b1BQcEFNQkJEZ1dUdGVmemoyS2ZrVnhyRi9HSDVjSlJiOFVkUDg2?=
 =?utf-8?B?N3JQbndoaTFJcFNackpKM3hWdjNHTHNLWmFhSDNtTHN3d0VKR2JaWHBLZVk4?=
 =?utf-8?B?NzJUUzlXa1IzNWJqWHhxVFdCZlJwUlZkQzVyeHRhUllrMXF5RzJ2dFBOQkVt?=
 =?utf-8?B?V01xMFNYOHIrb1VWMUpYR0FlVng5V2RCTnNaYWpsSVoxWllobHZYV3Z4YzJr?=
 =?utf-8?B?bmNKVVIzZklRWU81RHZabmF6ODZTNDZ3QnlyQ3Q4ajNKcU9hdW9sSURMWHRr?=
 =?utf-8?B?eGg3WTlwWjBOOGdiQ1ZBQ3NZdjZRZGxpSlVhb09BV0t0UkxZWDRRNExSczdN?=
 =?utf-8?B?bHl1QjlrSEMxclRodlpGU011NWlIdCtiWmFIcEV4QzhNZGpCeWhZTWNkcE1z?=
 =?utf-8?B?TW1uOW9EcDhMeTF1bEc0bXE4RldVZzhxeTcyMlFRbUpxa3VkMko2TnhuNFhu?=
 =?utf-8?B?Z2p6R1JYSVpJS2RaRGwvU1JmRWQ1aHFGeWJzRWZyQjgzdnNLczlqcDFEbS9o?=
 =?utf-8?B?cXNTb1IxR05BOHhWaEE4WDBTQWljMk9HSlk1K2xsRXBPTkh3S0ZUbjRHVStR?=
 =?utf-8?B?dmtpMGQzYmRmQWJKaHk2dUhtZUpBRnhuZldkU0NjNUgyaE5FMHY5d01STHBB?=
 =?utf-8?Q?qe/rF7MXbHNPx0xGVJOPWWmpx?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb6bde9-db24-4a6a-0272-08daad21e1bd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 13:50:26.3351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UW/puOxDIcpdPXGolhtXCMY1rA3VnPk4Z3uSmQ/rZ2aFSGDIFL1uKnvbAPukflX+dH9Xv63q9ww5U9OKIAuHjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6928

On Wed, Oct 12, 2022 at 10:30:45AM +0200, Jan Beulich wrote:
> On 11.10.2022 18:02, Roger Pau Monne wrote:
> > @@ -2365,12 +2365,6 @@ On hardware supporting STIBP (Single Thread Indirect Branch Predictors), the
> >  By default, Xen will use STIBP when IBRS is in use (IBRS implies STIBP), and
> >  when hardware hints recommend using it as a blanket setting.
> >  
> > -On hardware supporting SSBD (Speculative Store Bypass Disable), the `ssbd=`
> > -option can be used to force or prevent Xen using the feature itself.
> 
> Why would we want to take away this level of control? Shouldn't we turn this
> on while in Xen if so requested? Which would then either mean enabling it on
> VMEXIT if a guest has it off, or running with it turned on using the OR of
> guest and host settings.

Right, but then we need to context switch the value on vm{entry,exit}
which is problematic.  I could move the context switch code code out
of the GIF=0 region, and assume that NMIs executing with the guest
selection of SSBD are OK.

Alternatively setting ssbd= on the command line could be taken as a
value to enforce for the whole system and prevent guest attempts to
change it, not exposing VIRT_SSBD, AMD_SSBD or SSBD (haven't
looked at whether not exposing the SSBD CPUID related to
SPEC_CTRL.SSBD will have impact on other features).

I was under the impression that the command line ssbd option was added
to cope with Xen not exposing the feature to guests. Now that the
feature is exposed guests should be free to make use of it, and hence
there's no need to force a value for Xen.

Thanks, Roger.

