Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425D96F18FB
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 15:11:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527324.819848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psNs8-0002m8-W8; Fri, 28 Apr 2023 13:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527324.819848; Fri, 28 Apr 2023 13:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psNs8-0002jI-T6; Fri, 28 Apr 2023 13:10:48 +0000
Received: by outflank-mailman (input) for mailman id 527324;
 Fri, 28 Apr 2023 13:10:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzbF=AT=citrix.com=prvs=4752babc1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1psNs7-0002jC-4a
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 13:10:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1446efb0-e5c6-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 15:10:45 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2023 09:10:41 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5456.namprd03.prod.outlook.com (2603:10b6:a03:28c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Fri, 28 Apr
 2023 13:10:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.024; Fri, 28 Apr 2023
 13:10:39 +0000
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
X-Inumbo-ID: 1446efb0-e5c6-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682687445;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0w+W2qlgNdJyfzB8ZjTgO8zdBPcBlG2cWo8OFLLGWQk=;
  b=AuwL4vrpHxR6ciRhbvRIxikA7beOVGMIUHgmmY2RB47Im/7+iK98aFZL
   Y0uB1qbUbuS3fz7WXBr8IkJJTTXeGFYtwR37Zxk/2ycXYqMiOKa1cGVmu
   U3XWxiDOUg7MWH2UtwDnJJ2LPq8JRZIR1k9UNyh1dj2IXdVXhiJSXWVZ0
   A=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 106550286
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tt0fWq9bfiqzNPI5LjQGDrUDRn+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GFOUTqOafmLMzanft0gPN7joR8BupLQztJjHVA//ys8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOaob5AO2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklQ8
 sIKcG0xNSqZvPjm7YDlU/k8uN4seZyD0IM34hmMzBn/JNN/GNXoZPyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilUuiNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpMSeDgrK406LGV7ncaMToTUEm7m+u0mk6GZoJxB
 kZJqhN7+MDe82TuFLERRSaQqXqJvBcaV8BXVfMz7AWAyK386AKeG2RCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BXAGTT8JS00C+daLiIM8lBXUVf54DbW4yNrvFlnNL
 yuiqSE/g/AYipcN3qDipFTf2Wvz/t7OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lRtlFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:teMJ6q8A57Dahorj0iFuk+DcI+orL9Y04lQ7vn2ZHyYlFvBw9v
 rPoB1173TJYVoqMk3I+urgBEDjexzhHMVOkOws1N6ZNWHbUQ2TQb2KhrGN/9SPIUHDHkE279
 YGT0DTYueAbmSTLKzBkWuFL+o=
X-Talos-CUID: 9a23:JlGHBG0FVNsIgVOra5VGvLxfBMcbYCWA8CzqOXSiWUtbFqSFGWGK9/Yx
X-Talos-MUID: 9a23:uwigSQQOtx8yeRmVRXT3jQhFMcJ64568BVANqahWleSOaHxJbmI=
X-IronPort-AV: E=Sophos;i="5.99,234,1677560400"; 
   d="scan'208";a="106550286"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A78sn13xEpzA1FmPOI4QMgR/2159fTfKC/MSSi1EwiOSkS4pPUq3cqAdRaoX46MhmqL1pIwRqKX466OrV0fIxYTXKpZoY4cBaQ78/U9A4qOi7kL4oZLbDaoBNGoz/qMq56N/h+XvEGEiGny91K8OOpCaCr3P18G52W5JGaIZM3xPAxW+BqrP38sBl7nNE99RS24W/GtM8uqHrAbVp5lO2PguxuTU7vZx++YddRS0/re+hvpRYYPIGEUsudCKKst8FJgPKx54ey9Nh2Fps+YuYM77u2XAAbFd5wMtJsmzP8x9fqllqd3k6dfXZUYVF9TF5zWNZQYxA1Q4S+Ez5bilWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0w+W2qlgNdJyfzB8ZjTgO8zdBPcBlG2cWo8OFLLGWQk=;
 b=PSPKQtoK44DlBAzL1I/XUy0a9u80I9fmXeV2fGe9dW5MBGTxxbRt7M+oeWS/pRI5htGeB4swHWWIYM3ByMf60kg78CN9/1M2YHshGB+fR68y+KzHPN9XmLOxqo2ajS9/Yv3Z17/9we7rGgvhSgVMSqIsM83zY/4CnXvmai+E7zCqDAmlRkjXJDswWPAn/S9LpUHDs39cOOw7Onfw4pCMfyE3nWMeYkMrRwRQ1kpwiZLp6hLyAbCTqphz543+VI1Og6K1aUexyKJwmnGBrMbTCCM5skxPYOU+7KBKSrF4/QoSboQxa44ESWYr7WD8q09bP8vj6AwahNgQ+xTxVRxZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0w+W2qlgNdJyfzB8ZjTgO8zdBPcBlG2cWo8OFLLGWQk=;
 b=TaG+doL1niDyF6plNl9QbP0RJnWB09m/PeiwiPcpfMYY47pWd652XABKcyuabjtb/p1VZalRcuzg3WJ33Sv2BFM49BWVuxSMut4qwmi7T76KcAVK+Oy9l04EvKIzfu6PLE1FMhsiyqgsUJbQCyrpqSMSlsnHjjZN0tBzbL5BsHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cbeeb484-22f7-873c-e0b4-e9094e127ee7@citrix.com>
Date: Fri, 28 Apr 2023 14:10:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 4/7] tools: Make init-xenstore-domain use
 xc_domain_getinfolist()
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.org>
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
 <20230428104124.1044-5-alejandro.vallejo@cloud.com>
In-Reply-To: <20230428104124.1044-5-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0494.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5456:EE_
X-MS-Office365-Filtering-Correlation-Id: 8375d621-4775-4c52-deb6-08db47e9f6a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZLVfL6lkEEP07d//3mHKfHnIgqOxn6HIcAULY0CkWbNEagSuTcFglJyGfL3Bck1bUKsqogGfc4x+dhCZB9V8NQ9f6NsskwA7OG54Azz4gVzQQBj4pRjIjWvhro5710qfGgu75L6SRTp+99f5pUVjfF6QsT5VeJcgF20ANIeC1ekBOsAlrlbFsXqxVocWLLUbnpfSsKSOwtNhFt75cPi/VWYLBYyg0bxFeInmZR+iIckGEBBrR0mfM9rUf5595gZedxhlTZYl+GkMr6BBN2CullIc+M45zWWDuRXK5PaAOLE1Uq7ulhc9Bwxr4MUW2j3rqk03rawJK+icQ3rs5NYaXhIchh7NIU+/zxrek+8GHK2sRzMnPBnWAPTKRqx12vDYIEo2CdeMjK50kpKk6HBWEd1gWVfb2As6U+cqPcNqocmlVMSyU12EthrJ6rfnkJFVb8DhuyL6HtUUGHj87KlOV3QdR9alXOUMMoI98xt0jo5yLRckjkkmXff4uckHfAdwiO5afN/XMSKuQAiqfSjhgOw9Em534G95MbkXnJFg5gqSWTuNhcdHzwuDuDdzd6c8oNOqgp//QTCa67QrQFddDPF0p3yxkxqSeUnXn2pCbTUvU3suh0VPKafXspgR9Hf3VCPZ4YfBW2FY5ASSZTVQew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199021)(2616005)(4326008)(316002)(66556008)(82960400001)(66476007)(186003)(6666004)(66946007)(6486002)(478600001)(54906003)(110136005)(8676002)(41300700001)(8936002)(38100700002)(6512007)(5660300002)(26005)(53546011)(31686004)(6506007)(2906002)(4744005)(31696002)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amlzZDRhOEtwdkZlZWJMN1l3MWsrTXp5NGRzNUUwbkRWL2YybndJQWlycEpU?=
 =?utf-8?B?NmxHQWdxYkR0cWdobWxvNWtwMm1EMHgyZjQ4TlV0Qm5kQWxWWlpTSHlMeXNk?=
 =?utf-8?B?cUlyNmNhbkRGeHEweXZQMWdBRkRRSjk1VkY1WHpreFVBNmpwMkZuU29xSk5m?=
 =?utf-8?B?eE9DWGJOZzhubVZvQXJJUi9lNmNmWWZhWEduRXFwT0hsVzBwcmI3aStWdWIx?=
 =?utf-8?B?cFR2Nlhsb3hkSlRGR3pKU3Y4VEN6bHdlSTVWYWxQUnI3SWpMME9TY1JocmNB?=
 =?utf-8?B?ZkZHeDJ0Y0QxaEFKMFpEaU84MWRFQ0N3SXR6UmRtdUl3U2dEVnVkT1FxeEFG?=
 =?utf-8?B?QkNoSnBOVVI4RmhRSlBuZFFzbjBpaWNLcWI4UmhhY0dFYUtlbFhoT0laZ0ts?=
 =?utf-8?B?YjJtM2lCaWltTjM5ZnU0ay9uSjF2eWpGOFJDV0g0YTA5ZUp1MFROVXBGYnQ4?=
 =?utf-8?B?bmRNYnJjMFUrckZySlhXMnRMQW1CUVZPVkdtZGl0ZVg4QkkyYkQza1ZFY01S?=
 =?utf-8?B?Y1d1TG1iWGNGYlhDcENWeHhPOEVpRTQ3SXYxNnFRY3dueXZYTXliRFNiTGpH?=
 =?utf-8?B?VVpGUHRrazkvN2Nka1BiNHpuNm5wa21SY0hTZkt5R0FKQXRYUm5ZTnppT3NY?=
 =?utf-8?B?WHduK2Z3UEVBeERFblAwZ0RNbHd4ZXFCRWIzR3Z2M3dySVM3Z20xUzh6dHVs?=
 =?utf-8?B?MmVROWs1VnZTMnFDSlRUSWRFWGN1emcxdUMycnc3bEp2cUhGTXFWZUlHQk9C?=
 =?utf-8?B?emNRenNXQjlzOHk1L1c1Q0lCMHFPZForZkdoN0htemhPbHZRT2oxVWV4SlM4?=
 =?utf-8?B?Z3hERkF2Q0NraHdRQ2V2UFRBMFNXNEs3RFFIbWtLck4xY1FoZnF5cEtTL2Yr?=
 =?utf-8?B?bVRvQU40V1FZWW55dnNKUmZsR0NPS3dOdks0NWRhWmFhWlk1OVc2MDY3Znlq?=
 =?utf-8?B?RE4xMlo1QjhFc1laaUZxbWNISlROYkZBRHpVQ0x6UEo2dHZxSHhycUNiRFRi?=
 =?utf-8?B?cW5oVXQwYWhwbTM4cnFRTC9teFhLcTVIN2FQTDJmcEJ5QU5lcHl2ZFpHZ3Mx?=
 =?utf-8?B?ajRUcUVZMUZzRW9HdjFBaTB5RHpNVENpS1pFVEp2RTlhSXBBbDB2dUV0bWFu?=
 =?utf-8?B?d3dTWkhWdXp5ZE94cG42bXNHcWR3Z25aemRNMGJzWnpmTlhYV3RRdnRWd1A0?=
 =?utf-8?B?Q0ZWa2p6Z3pJZUZ3ZjBJZEJCRG5nQUV4Z2diOFAvaUxtVzBQRW9EVk9sUGtH?=
 =?utf-8?B?c2tOQnVVVjRXK0ozM0tIYlVhZ1FxemQvN0x5Uk1ubjVnNDZKMUdSaHFsM01Z?=
 =?utf-8?B?WWZuVjgrZnlpRmxQUXdKMm4vclMybkZRRk1FWlZWQU5kaXB2TlUvTVNCVWp3?=
 =?utf-8?B?MWNqbWRiZE1WeDRSSUtXVTNWWk4rVUtkL3lUb1E4SVovck84Yk1qbkhVdXJ1?=
 =?utf-8?B?YVk1cS8ySjlPSGJ2RjNjSlVtM3VQYkJHbkZqUHhKSU1zd2lKWW55dkVRTWg1?=
 =?utf-8?B?YTNwUTY3NndTTlZpaGV6dzZ2MzR0WHZGOE85ellvdTFuOU1jYWgwcm9WMG0v?=
 =?utf-8?B?alQ4eFdtNDJvai9GSmMyQVNoNnZZUlN4MTlMUzUwUjJyZEFvYzFtdXp3Y0Ru?=
 =?utf-8?B?Wmwvd2l3YURQV0JBYTFqNWRXdXVSUm1uT1VOQ1R4Vm92WG5xTVVHUWlTbXZa?=
 =?utf-8?B?Vi96NmZTVjgzMy9LVW00OFdvL01OR2VrQ3BJVjViK1p2RFg5OE93WmZKUytK?=
 =?utf-8?B?OW4yZlRwMTNhOGsvcFFkeUVCajRraW9CaUpGMW1hUUN3N0F4bGlDTmFkK3N0?=
 =?utf-8?B?NlNOa1BObFJ3dy9oR1RwVmFUTCtGMnVKUDJSb1ZsQytQdkNIcUdiL215T0xF?=
 =?utf-8?B?c1RCUUJtOHhVZXpaS1hnWEFKVEx2cHNWM2grSWpRZmF1S2tKYStDNkViWjdY?=
 =?utf-8?B?aXNaK0tQUU1wc0FEeEFQcFdiTktWeHNrUXhSaER3OE1xaU9Ea3VEcHBEWmlJ?=
 =?utf-8?B?S1YwSkR3d3h3bWl4RUJITzBQTzZUMkZCb1VyT0twZmVUOG5pejJCdXkyM01F?=
 =?utf-8?B?dmJDa3M3S0JHeDFHK2VtNXo1WGthVTY1bFR5VUduUk5EOWovL2Q3K3VhNGM3?=
 =?utf-8?B?SytYa3ltNGxidkU5TERGODBnWTMxSFJmeGwwUFU3ZTE2d2Y5TjdJSHRpMFkz?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qoAgJRy0thBMP57uW1QwGJNwBu7unHVDstHYedTV8eBOkoVHCgJorbgJ/wz+T702IlM2Qi6jBDecKCfQMS2mZidUSnW4uCyZ0CTqD0iX8hBnQv01lZH2QrqSsW1CNcGOoBNGcGbH6745BgO5Gl9vEbxjFROqtl/TERypIUP4MFVqXI0V3kLuOjT36/d13rJ0FAerLNjCnPXmkD08qDFvfHiDBnmqioRU2p/OEVAus7GHAKmVbF7Kz5h6Ond6TWeZSDlZkARpsa4tgimJN/lgggczWgkP8rjRyOfiis7XofnzpDkoOdUqTG5rdwDZwulzpUPxCj5pUTwFbxqclTdZzbW59Alzxrb2+mMCaS1jjGGgRb8gUYhvgLws79dyqo1/WudjHLsd2dGmVemGzcpJgIez4Aei64V+yagq+wJnDbwaL+5CGKbS+RUB2Dgcfc7wMkQb7g5E5dSn980OfpC0qsWf2Vzfxvdmu5AUufJO4l6bwoYqdo2jdg+7IPZ01sxeK5QtvfiXbxNqpNcO9FkefTkU03G9VNva2/6CSKRrGuzBQGKGF1xl4UdjkBtjdProwBrN7eiOrtWqaTf17NnT/V+rMP1fAr4gUsAX//QReugs4Ncy3mMTP5CWr2phvTizWw6HWqZaLoHELZB3eC26X/+lU5AqAyMPp+buyVtCkeo7OMvp/WHdig7lxAmsXL+J5yH2f8I0K0xjupUfm1NTqMzmZz763Jp2JAW1Q7+peOHVITQMMgXAFM4zbjQB2CcDQ76BOkBo/PKbUX06YTpj0Yo+fUszUWzGHv/TWH09fD2PVcpXoB0/8q2sA3x4I3QixzCZBkQ8qx7aa/RKljk3YiVI4gATLfSJ5pr5QNSmIDE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8375d621-4775-4c52-deb6-08db47e9f6a2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 13:10:39.6607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /RaOx7dfXR4I+TnmjQfvdH4JqROF/5QBaKlr0tph4QDjecJTAPP8v1Nb5DpaHHvfa1QwA8OnIeWfzwb8G0KM6FJQ2yq7Y4etIFK5NAu6LR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5456

On 28/04/2023 11:41 am, Alejandro Vallejo wrote:
> It currently relies on xc_domain_getinfo() returning the next available
> domain past "first_domid", which is a feature that will disappear in a
> future patch.
>
> Furthermore and while at it, make it so the hypercall tries to fetch information
> about more than one domain per hypercall so we can (hopefully) get away with a
> single hypercall in a typical system.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: Juergen Gross <jgross@suse.org>

Oh, also, you should have retained the Reviewed-by: that Juergen gave
you on v1, seeing as you did precisely what he asked.

Same for my R-by on patch 7, except there's a different hiccup there now...

~Andrew

