Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B04EE704916
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 11:24:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535089.832696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyquE-0002IW-8G; Tue, 16 May 2023 09:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535089.832696; Tue, 16 May 2023 09:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyquE-0002Fw-5T; Tue, 16 May 2023 09:23:42 +0000
Received: by outflank-mailman (input) for mailman id 535089;
 Tue, 16 May 2023 09:23:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S66/=BF=citrix.com=prvs=49309c509=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pyquC-0002Fq-W9
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 09:23:41 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56834df7-f3cb-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 11:23:39 +0200 (CEST)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2023 05:23:34 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA2PR03MB5771.namprd03.prod.outlook.com (2603:10b6:806:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 09:23:30 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 09:23:30 +0000
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
X-Inumbo-ID: 56834df7-f3cb-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684229019;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YH2WWyh35VIrf0aKOEC22DESvMV2uTNWkqH4AfAHhpQ=;
  b=Nt2OOwqmt0dqaUT+4naaFglcUQmSxRQNSD7Lnhd4MiW4S3TyVI+g9mA4
   zuOe0JJpK1zzUgavax/qyAghTydKjRF3Zri+Jao3IJ+DcbPWND6XykDO6
   nsFlOF4YwUYo7Rh07gkrD4InnV4D2vgPzCOco7XhwmOpEqrKNyLeLZONC
   I=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 107945293
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zcJf5q8J/R4pq2HzRg4PDrUDYH+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 zdKXTrTP/qDYjShf9p1aNjl8EJQ7MPUzdViTgU5qX88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKkV5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklBq
 dsAFhw1TCm/vPiE7K2iVOd1o+gKeZyD0IM34hmMzBn/JNN/GNXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilUui9ABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraXwnKnBdhDT9VU8NY6mUacyV0eTyEHD3a6s8KItmKlXt1Qf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmW0bbd6QudAmkCTxZCZcYguctwQiYlv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty+nupoA6yCjGQddqHKe2icDdEDT8h
 TuNqUAWnKkeg8cN0OOg4VnNjjaop57IZgcw6kPcWWfN0+9iTIusZojt5V2F6/9Fdd+dVgPY4
 yNCnNWC5ucTC53LjDaKXOgGALCu4bCCLSHYhllsWZIm8lxB5kKeQGyZ2xkmTG8BDyrOUWaBj
 JP70e+J2KJuAQ==
IronPort-HdrOrdr: A9a23:45/q2qs74VkxoVDBdtlr1Iy37skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-Talos-CUID: 9a23:QjdlZm/vL7RCTUR5dOmVv0FIPdgbXkX/9UvrOX2UFn93RqSwZXbFrQ==
X-Talos-MUID: 9a23:nsbBgwk9wAqc72M7eHQEdnoyLdxn7JWjT3wcy7gHqfK1CQBrPjiS2WE=
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="107945293"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pk8GdR+FgnCiGpmmSdH1x3VK3AB8j/UVtJpLPHykvbFD3TO0TGcx8Gf5eWEOBM1nJxYQaR0Lk76Fj/F0kPvheGhL0+tI32E0/PH536RNDgevFjGIiRsgKaenYK1mzmcz9P2FTgskSPNnuwAcjhg726fpGvuEdttclREVfsQ8o4TTFMkYHONe24RL6tShxaQsDCSdXPn0YWvaldPFKmZAXUjQIPOykGwYkeBjuy+va8Ox5/R/QZOF/YYINB3DPs3zX7CfQyaCANqk9+B2GCIDr12VWD8hor6UhXOXNEP4BwetaGKBr0klI15egXx93WqgVS1vRssmQcOmvWoRnVy1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8X/ySDcgJo2bF/96Sgw/t2NcUNoutRPmYmkCEzvaqhQ=;
 b=njh8sggyNyex1dJf/MesShPP1F3/JHBelAJVYe1EwduY3WMKZQMj0UiCgEI998mCa4fkOLBeBVJo1QgC0GJHECTtJmriSrV0tq0/LsJl7m4KMhz706r9DL9Hr8ci7pcp/tDIDWDznYQmxtMmolffmYwDdNfUpDsnGL/4W+v8X7cPc2QkBrKP1/9cXLOQEu9lXEfvkg/BJxMIFLN9JOgT9Ck4LHQUVfDqQjbOMH2mWuXz25g3lyzbSuDanjPbhXXqJ+8gSWllq5ZQS8BHoUsWkaZNnqJFN3FdVH9z+Pmjtt6+bi11Pfw4XOC6J1BiHa/5jkerGxepsx6tEiL1zt+t0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8X/ySDcgJo2bF/96Sgw/t2NcUNoutRPmYmkCEzvaqhQ=;
 b=FhlbBD/PXxuetL01MR3sfHErDbSCAgI2sZnE0JPJCFTsWc14zpANuvcxfCfMyzwSmumAEcJGTirD6NveeAFICqjj7Bdb+dj21f070FWBHAWEBnOhmwVw77GzGggTFuoIq/U0eWp1IAF0+yxaA+jxNMW1FUqwJCvjVRvji/Xb9M0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 16 May 2023 11:23:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH 1/2] xen/x86/pvh: use preset XSDT header for XSDT
 generation
Message-ID: <ZGNLjYWLaOzgfH+z@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-1-sstabellini@kernel.org>
 <ZGHx9Mk3UGPdli1h@Air-de-Roger>
 <81ac6e51-6de9-5c4c-5cbd-7318cae93032@suse.com>
 <alpine.DEB.2.22.394.2305151712390.4125828@ubuntu-linux-20-04-desktop>
 <ZGM6X19p50oSqbNB@Air-de-Roger>
 <ZGM9vzwGm7Jv6i7M@Air-de-Roger>
 <cb550850-4cf7-5bb6-d84f-633be1ce3bac@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb550850-4cf7-5bb6-d84f-633be1ce3bac@suse.com>
X-ClientProxiedBy: LO2P265CA0515.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA2PR03MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e83bca-be1a-4e57-71be-08db55ef3692
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	No5sNKxcxMO3adV8pGuZ7Co6ozcHJKUqcn1fH5W9FOEX0sf68W2V/0KjgZJ6yFwOQujUt3NxVu7u9nFvL+xGtDwBAydemjxacUf+dHt1RMFAdlgOvYQ7ubfzHXMYiICCl3WpEhT9dTguGzbFsbzmeu1x3XbOfbk+H7oyYVvAPMnOFQjnc8ylnvOxbemDxMlMJV4/XM4nEwWOGCflXCLCnMkPf1AYIs/yvH6G99RcIAYsmgqcZlw7piEd1u8fQSdSzluJm71678d8QMbdU4u8btQUQ1NoyWurLVtZjRGxRG1nJa6RkvI7+I9zSZqDvr4TSOkTyUwFhe4AGIAkGZB1qhAIgcVudxHT2bWdgNqm7EG9aSUTTHXlR4gINdXpcqaFUHqkDCv0fNkYUwJ9jBv3ZwVuAPZSrh943TUPjhOqmT1KKVSA/0IbBpIWGh1RjbVXK8V6oGCO9URjDZZsbcpjGipZMUj0vUYrZrdXHtQ9p70zocimeQ9lexqbmkWpr74b1LUnLVC/geZv1lSPAVtH7AXAb8sMoEzptl+L6UVRTh875QIklBM/xWuumzRbECG4He0BqZAKhd74/O1RRJajy090oC2ulWlk9qlheurwDuU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199021)(4326008)(66946007)(66556008)(66476007)(6916009)(478600001)(86362001)(316002)(54906003)(85182001)(6486002)(83380400001)(6506007)(186003)(26005)(53546011)(6512007)(9686003)(41300700001)(8936002)(8676002)(5660300002)(2906002)(6666004)(33716001)(82960400001)(38100700002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmRsTWE0VExoNytHWGdPWjU3QXloTUpqVVc0WUI3dHZYSURmU3RKQlZtOFhV?=
 =?utf-8?B?ZnJuTldUNDc3MXVWKzVLTUJDUmUwUjd3a2RPS0x0a25qblFXZWlZNHh2Ly9n?=
 =?utf-8?B?ZE4wdmFpZVYvMXppc2sxaGkzUG0rVkEwcHh1VlRrVStaQkZ1UDIzZW1ZQ1J4?=
 =?utf-8?B?YWlEbDJsUk4rMVA2UmM4cHZIS0dscEZQTkh4RFYrL1JTcEkzZjNMZ3lEaXAx?=
 =?utf-8?B?U0VTQy9uVGVreXBlOHRwdDNNZVA2Uks4S2NwblR0QnZ4YWw4eVk0ZkNnOWJi?=
 =?utf-8?B?S01xRWdnWlRzY2Zhc21GMGxuell0RUEvUHY5WDJTRFFqR1Y3UFIwQXdpYW1L?=
 =?utf-8?B?cC9mYm9lUmVoVGp6R29JcERVMEFPSXFLNWxjaWFZWFNDZXA5QnJIOWFjTkh0?=
 =?utf-8?B?TUxkcjlnZFc0YnRLdHl0Z21NNWxvMjU3OHpld01EU2NaYkNBZHpMdlBYN1Vu?=
 =?utf-8?B?S1RneUVXYnErcnpFb0FhTUxMQWFXRW1EQ0lZTlMvcUdRQTdlQlBaQWtxRmJN?=
 =?utf-8?B?a0ZhUklYZzlvdTgrZWZ2bFk2MzBqY1Q0bkpaaGJtWmtSaXlKUVVtZEVqZ05T?=
 =?utf-8?B?eHJoNk0rL2cxdndSaVRUN3Q3WGNDa1NPblFvN203Rkp0bVRnVzk0VnM2Qjl2?=
 =?utf-8?B?cDBxczVjM05PdlBERnQ1MGZ5WWRDYUNDMjNmTDZVbzlCdUYzdjBFZWVJcmNT?=
 =?utf-8?B?LzZIanc5SWNHVjBDbldhUHFFellOVThzZ20yb3hOWjhzaDdFRVpLZVRrTjZu?=
 =?utf-8?B?R2tseE8vY1dRNk5GN3NXUUhlLzlSVmc2Tm4zTkJTSXhNdWtiYmlhREFmQlRM?=
 =?utf-8?B?ZTEvZG9ReVArQ3pnL2NXdExHcklLdUJaTzlGd2UrRmZqMzUwVmZqb0NwRE5Q?=
 =?utf-8?B?am5XM1FkNkwrMGo1NnMvUW9mQ2dVMGJid3gydUNSd21SckV3Wk5BQ1lsaXJh?=
 =?utf-8?B?SklOc0pTdEdWbTZ2ellyZXVWNWQ5ckgvcVpGMkhFcmNvRTByOWhkYUNDWkQr?=
 =?utf-8?B?TUxGVzg1OGN1dXk3YmNNTGkycjV2MnpjYlBuUEYvQmFBVm8rckpWbU8xV2Ry?=
 =?utf-8?B?eU0xSXI1b2dpTG12Yko1V2xoQUJnTFRCL2ZxQ3BZb1lvUWkzazdUVWZUVi9O?=
 =?utf-8?B?U1FWamordVA2MjloTzMydk1nZEk4aDQ2Zk40SXo1MEhDaTdLd0F3Q1B4ZEZP?=
 =?utf-8?B?T2hudkV5YlNRZy9IS2N2YzZXM1F2N1FVeVE1dXZudDZPZFhYaXVlQWlOTTlU?=
 =?utf-8?B?aU9OdlZRV2pZZG90Sm5vZlhmSTNibVV1RjRvckRLVVFZT3hJR1NEb1d3RnFS?=
 =?utf-8?B?ZUNSdER1NUcrSVNaVm8zV3BBbXo3YVZibitNVHZZZmhOb09Vam5hRDk4c25T?=
 =?utf-8?B?b3pOcEk5MzhHQ3drK1VUdVJRbVB1VjM1TTgvWlhadS94NERDZXNBdHhlUllE?=
 =?utf-8?B?MllvMTV2NXI1NFdxKzRsajY1eHhDdUJGRzhGdTVEL2xmSWVmeXRTeE9SNktE?=
 =?utf-8?B?Ukk3YkVrNnRtckpXUHRCYlR5alE1UXllSnVjOER5dndtS3UrcXI2Z3RmMGdH?=
 =?utf-8?B?cDRHakZSMlZ6czEzWmVKWnhCdUtueDBMQTd2bmFrK09jMjdqbEx5em8wbWJn?=
 =?utf-8?B?OTJYaUZKR05YY0ltWHVFVmxoeXJOa0dGUWNhbS9SeXhRMDF1cHlteFN2M21R?=
 =?utf-8?B?by8waVFRbzloczF2QUVlTXU2THJKRXFrMVhpZmVnWEpNVGxGd0VEWG1iakVl?=
 =?utf-8?B?V0E1WmQzLzdqNzFTS2J5UnZZVHl0L2E5QnVGMmFsQzRaSDQ2ZWhpYkdRTDU4?=
 =?utf-8?B?TzBnRThyTTdLaFRuTm00MUhPeGxEbjZRbnVUd1hta0N4WUF2MU5jSHNIU0Jj?=
 =?utf-8?B?R1hMeG5SeXpkdWNBRmticHpUaCtLWWgyUWdQRFBReG81QXdPR2x4VEhFdHVY?=
 =?utf-8?B?VHZzVnFhbHRmeTJ3SEYrcXA5QnZPMlo5Tk1pT3lxRktUaTAreEpBLzRVWFM2?=
 =?utf-8?B?bS94NVNsNVV4WlN6S2VGTFlTVENUaHBWQjZPWEl6cDg2TGViL20wUWRuUktV?=
 =?utf-8?B?Y2dPR0xqaGJrWDN2dGNjOGlCSzc5OFYvdS9vUEE0eXdyREtEcHFCNGlTQTFF?=
 =?utf-8?B?VExHZDJLemRCLytrRDNzNGd3S3R3SnRibC9xSzVuTW9EZTJGR0d2ZzFSOHFU?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LCTlQhO5DT7x9bpSPUBTLSdkf1L5rPowxnpUAU+tcbKc5NgdqnfxGbwVI/seXQGw8FUB92R4Djnzfm6OpnxkPvz3J466PO908KHCQNq+emFrl80Wtecru2YNl54RaeP5jgRSQrJ2gEto0yC3pnD4u9WRGflQeXWsEausjs0mMfJiUC/n40JauS8FzQkf/sXCSdMemxrMPi6IBjNBRRm2YQR4Vm7etrsj1s/G8sKR0Bn+9MWOCB0lpXrueJSU287N21kEVVP0odBHyG45e5TjburKQA+rnUetXuNOAwlXvGrC/Z6vJ6l9JY7p1G8GsxdltN49tLx69w87WSzlWw4f4zxQJqnaJ/7ukPIPUrW2MWJBcKsI3m44fbmIqR8Tv+mYEL+c1m8anb4G9PJ8hgx2QqgDxdxUDTu0XOmyN775rZn6q+BLnnR7NYawE/faLjOoU0iUJMvXVen7QOuJ9nu7pdr9zrcRWvOfB+bfoAO7691/UVJ1wgg1tv46PvjpMZm8XLM1aRRr3wJyW/kWAAORBfHhtC7U/BN8lOTfWQS0Ita5B/U1MOSTJzmyYS5UXbBvNzVyf2D2COxIpcvZkkJTjEEGh7cJYJJMdxPNNzBZVy7FLZAq4ChlDrUbrfwNs/GNFsk9fvnTbWnuNliiI17G1tRQvsrz4it1pEHmwCaGAclySczk8vUaRQYcqZ9tOh3hm1k7BtTsm3jt4WErfIh+eNJKlY/vNlcVnkJ3BZc3N7q/jzhThuok50N0fhE8HzkErCxxfJsDZZdaS5xHY6YEaVfPcGWNeqAlghU7FOLDu3aq4bU+SECDIjTREsRwxv2hyDpiee3SLoLvT1ERkOM4OOLXrEGOCOBiIdnpDO2pswc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e83bca-be1a-4e57-71be-08db55ef3692
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 09:23:30.6323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VRRibJGzjmkjOOqRH0lPFiORym5yOWcoEVBdajqT25Yw0qcb2w2Ki12NXP2AmwAx0v2xYLEqQaMStak3W4Kzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5771

On Tue, May 16, 2023 at 11:13:17AM +0200, Jan Beulich wrote:
> On 16.05.2023 10:24, Roger Pau Monné wrote:
> > On Tue, May 16, 2023 at 10:10:07AM +0200, Roger Pau Monné wrote:
> >> On Mon, May 15, 2023 at 05:16:27PM -0700, Stefano Stabellini wrote:
> >>> On Mon, 15 May 2023, Jan Beulich wrote:
> >>>> On 15.05.2023 10:48, Roger Pau Monné wrote:
> >>>>> On Fri, May 12, 2023 at 06:17:19PM -0700, Stefano Stabellini wrote:
> >>>>>> From: Stefano Stabellini <stefano.stabellini@amd.com>
> >>>>>>
> >>>>>> Xen always generates a XSDT table even if the firmware provided a RSDT
> >>>>>> table. Instead of copying the XSDT header from the firmware table (that
> >>>>>> might be missing), generate the XSDT header from a preset.
> >>>>>>
> >>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >>>>>> ---
> >>>>>>  xen/arch/x86/hvm/dom0_build.c | 32 +++++++++-----------------------
> >>>>>>  1 file changed, 9 insertions(+), 23 deletions(-)
> >>>>>>
> >>>>>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> >>>>>> index 307edc6a8c..5fde769863 100644
> >>>>>> --- a/xen/arch/x86/hvm/dom0_build.c
> >>>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
> >>>>>> @@ -963,13 +963,18 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
> >>>>>>                                        paddr_t *addr)
> >>>>>>  {
> >>>>>>      struct acpi_table_xsdt *xsdt;
> >>>>>> -    struct acpi_table_header *table;
> >>>>>> -    struct acpi_table_rsdp *rsdp;
> >>>>>>      const struct acpi_table_desc *tables = acpi_gbl_root_table_list.tables;
> >>>>>>      unsigned long size = sizeof(*xsdt);
> >>>>>>      unsigned int i, j, num_tables = 0;
> >>>>>> -    paddr_t xsdt_paddr;
> >>>>>>      int rc;
> >>>>>> +    struct acpi_table_header header = {
> >>>>>> +        .signature    = "XSDT",
> >>>>>> +        .length       = sizeof(struct acpi_table_header),
> >>>>>> +        .revision     = 0x1,
> >>>>>> +        .oem_id       = "Xen",
> >>>>>> +        .oem_table_id = "HVM",
> >>>>>
> >>>>> I think this is wrong, as according to the spec the OEM Table ID must
> >>>>> match the OEM Table ID in the FADT.
> >>>>>
> >>>>> We likely want to copy the OEM ID and OEM Table ID from the RSDP, and
> >>>>> possibly also the other OEM related fields.
> >>>>>
> >>>>> Alternatively we might want to copy and use the RSDT on systems that
> >>>>> lack an XSDT, or even just copy the header from the RSDT into Xen's
> >>>>> crafted XSDT, since the format of the RSDP and the XSDT headers are
> >>>>> exactly the same (the difference is in the size of the description
> >>>>> headers that come after).
> >>>>
> >>>> I guess I'd prefer that last variant.
> >>>
> >>> I tried this approach (together with the second patch for necessity) and
> >>> it worked.
> >>>
> >>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> >>> index fd2cbf68bc..11d6d1bc23 100644
> >>> --- a/xen/arch/x86/hvm/dom0_build.c
> >>> +++ b/xen/arch/x86/hvm/dom0_build.c
> >>> @@ -967,6 +967,10 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
> >>>          goto out;
> >>>      }
> >>>      xsdt_paddr = rsdp->xsdt_physical_address;
> >>> +    if ( !xsdt_paddr )
> >>> +    {
> >>> +        xsdt_paddr = rsdp->rsdt_physical_address;
> >>> +    }
> >>>      acpi_os_unmap_memory(rsdp, sizeof(*rsdp));
> >>>      table = acpi_os_map_memory(xsdt_paddr, sizeof(*table));
> >>>      if ( !table )
> >>
> >> To be slightly more consistent, could you use:
> >>
> >> /*
> >>  * Note the header is the same for both RSDT and XSDT, so it's fine to
> >>  * copy the native RSDT header to the Xen crafted XSDT if no native
> >>  * XSDT is available.
> >>  */
> >> if (rsdp->revision > 1 && rsdp->xsdt_physical_address)
> >>     sdt_paddr = rsdp->xsdt_physical_address;
> >> else
> >>     sdt_paddr = rsdp->rsdt_physical_address;
> >>
> >> It was an oversight of mine to not check for the RSDP revision, as
> >> RSDP < 2 will never have an XSDT.  Also add:
> >>
> >> Fixes: 1d74282c455f ('x86: setup PVHv2 Dom0 ACPI tables')
> > 
> > Just realized this will require some more work so that the guest
> > (dom0) provided RSDP is at least revision 2.  You will need to adjust
> > the field and recalculate the checksum if needed.
> 
> We could also mandate ACPI version >= 2 for PVH Dom0.

Sorry, mentioned on IRC, the above is not required because the RSDP
provided to dom0 is already crafted by Xen and unconditionally set to
version == 2.  There's no need to adjust the RSDP at all.

Thanks, Roger.

