Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7002274283A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 16:24:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556849.869674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsYi-0005JW-Sw; Thu, 29 Jun 2023 14:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556849.869674; Thu, 29 Jun 2023 14:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsYi-0005GX-PR; Thu, 29 Jun 2023 14:23:44 +0000
Received: by outflank-mailman (input) for mailman id 556849;
 Thu, 29 Jun 2023 14:23:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WPCb=CR=citrix.com=prvs=53747fb4b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qEsYh-0005GR-6W
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 14:23:43 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8937a38f-1688-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 16:23:38 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2023 10:23:32 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB4981.namprd03.prod.outlook.com (2603:10b6:a03:1f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 14:23:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6521.023; Thu, 29 Jun 2023
 14:23:27 +0000
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
X-Inumbo-ID: 8937a38f-1688-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688048618;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0MDxt2GgRK+2w85hTGFMTLyDMERe6l1HetjhK5vHRBs=;
  b=RdO+C0udWEoKhhfsjqMGuLEL0pMDYhGs0oYI6q7FssTG6pIuWoIWGlMc
   xvs2pJLUg17sY38DkzBTbnrIPxdfQek2AUNGjYZY6sMbHsfZldSaRv7h7
   h2KOyiLRIK1dDt1I3N50wzG3u6+J84LQ0J9Idm0P1eydKj9rY4MHMtbc2
   g=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 117180749
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0wfOP6K5iz14ahyhFE+RdJQlxSXFcZb7ZxGr2PjKsXjdYENS0GRVy
 mRLXGDSaKqJYjT2e41+b4W+9ENX6J6GnYBrHQFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4AZvPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5WWWwT1
 vwiCgoBZyGSvsOKzeOLEfdV05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGMlWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHqkAdJKS+HpnhJsqGaP1jcVMRc0aXrlrPCGq0q0Yu1yd
 kNBr0LCqoB3riRHVOLVVgyxpn2Zuxc0Ut9cVeY97Wml8qfS5RffNGgJSDFpYcYj8sQxQFQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJSMe+MXqqow3ihPJT/5gHbSzg9mzHiv/q
 xiIsSw/irM7ncMNkaKh8jjviT+2uoLASAJz4wzNR3+k9StwfovjbIutgXDl6vJHIJecX0O2l
 nEOkMiD78gDFZiI0ieKRY0lA7yoof2FPTv0iERqWZIm8lyQF2WLeIlR5HR1Ix5vO8NdIDvxO
 haM4EVW+YNZO2asYelveYWtBs82zK/mU9P4SvTTadkIaZ90HOOawBxTiYer9ziFuCARfWsXY
 P93re7E4a4mNJla
IronPort-HdrOrdr: A9a23:Amq8d67PDa6wmMSDXwPXwPLXdLJyesId70hD6qkXc3Bom62j+P
 xG+c5x6faaslgssR0b+OxoWpPwIk80hKQU3WB5B97LNmTbUQCTXeNfBOXZslrdMhy72ulB1b
 pxN4hSYeeAa2SSVPyKhTVQxexQpOW6zA==
X-Talos-CUID: 9a23:mVpQ+WF5GW/xMxxvqmJGrENJOcAfUEfRxUbBGm6EBDdZE6OsHAo=
X-Talos-MUID: 9a23:DqAP/wX86gNVz6fq/ATwlGpkDc1K34XwBUkysJEMgvapaCMlbg==
X-IronPort-AV: E=Sophos;i="6.01,168,1684814400"; 
   d="scan'208";a="117180749"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GnBsvaZQyC3R/AtdYp/TB2ouJLZUU/p/Rn2fD7Zt26bEdsvu7rwVYxVwSjxmJa5zr6EQ3HRzB79kO9tv531Orbgwd6Jv2GZbm/uB4XNoSNvZgpLd497r38516NhnDE4wsf7IixpX5wMLufpDQB243VuLab8/1ATo7i8Bj1yQKZ1OrfNG0sLgyj/ooVnyCas2mieXaoqhy1RpLXft2JJw5Uko8bXvayj5zfUdleqZ2veXeD7geLK1OSwtxoTIsJqM08B3pwe+2PlzVjJikl2aGhwf1gPsvvoHQ83LEvZ1ySaA671iIRcZA5fywm7c8pHyoqKJWNOBxdqrCiyGb8QeMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MDxt2GgRK+2w85hTGFMTLyDMERe6l1HetjhK5vHRBs=;
 b=KuD1bFsrQN5ssNyeI2O7CP3d+3sECErutdcqURQN/cWMlQbLqfTKidI+EK61nlZFNXDsJf2N/pi+7rQW9ptaZzsFcGrjYi35E5z1sU1OkNqsQ0GqZJDmkhqUAVGrBefKk5mFFue4b2toQZ8GIsnBOJOerHke5wCtD7Bqg+d7KG5O4MXtB5NaDtUhpv2q0FuN6OvfTPAgYMQpFrD6eNmPJOj8joxgna/Wjm6JpM0rG9t2fDFK2QpeSWKRBAZXwGvzvGdwtiwa3nGjaJKur7n5opuh2CFLmZutbgkSlBL9lGXvFXZUAGD1hzJ79SCvwn6DReQeQTB9dw20xui7OiJ7DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MDxt2GgRK+2w85hTGFMTLyDMERe6l1HetjhK5vHRBs=;
 b=idkTFBD5Z8fKcBPir05RiwhvxTCcCyShnhmcfKVibf66Dpeit9qkX9lsU2PWIpjufqrXqWQZn8LSa9wxvSeBAKDNgZ3BvYcwzE9mTPi37xB2D/ZPKxgEdA4oRaYjPVnX9DvPk9JeOqZcMQuJc4SjVyHhftD8Bz9I89rbgQ+X+so=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2c8387ab-547d-5bdf-5d62-e7a950e5c1de@citrix.com>
Date: Thu, 29 Jun 2023 15:23:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 28/52] xen/mpu: plump virt/maddr conversion in MPU
 system
To: Ayan Kumar Halder <ayankuma@amd.com>, Penny Zheng <Penny.Zheng@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-29-Penny.Zheng@arm.com>
 <674011bb-b8df-d11e-a322-1827096c1b74@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <674011bb-b8df-d11e-a322-1827096c1b74@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0449.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB4981:EE_
X-MS-Office365-Filtering-Correlation-Id: d417dd0a-8ef2-4cd1-0bfb-08db78ac6767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Uk+4U+8tknbSdbbRMVUA1cxAJkf7nPen/fYbTVZtOAjtEWBf/YN3sgywOj7MooGQSmhKNYJA2v5VqzP3fd7y0QGXEOFFGsFORjW0jRn3r78BUYHmCuzCvtuN+8eMHu0HRJ78PATqN0JOG1urK8Ai2u6B+XhsO9YwuS6KNkHJhFo7gKOj6WR3RMMhDWVenH2xZGt01GZ+Hp0RhXvc0YQgrhOfYzC7huRvN8xmlwNDTES7IMXXVI4GgYEGo+0R2IaK04laWF4WpVI8kL/ZNDkSo2nYF9Rd4NDogdk29hKiGZD/wFg1g6zuZpZmjc7VIPnh9cqtFn9M5tbg6onrR9of/dYxtls9jjz0I78pGRS4yUWnBPcfibpppvXBY9wCUaZFUrDZYplbJIAqE9Vn8H65MYKxDMALnJ4lzHyZ1LZmJvM9463DX61J8KZNPBlOlvhXrhzKrEfjToWJqtAzLqCf0PH6STm/CuigVwnmQdpD4Qh/ZjAYjaZuUY9Xw2tJt5R3IUw+G/GksOGEtmdZvmCmYpAFPPLd1Y61rVEkxHX0XvX2VoIy8VawetWMXuqDBwFJcz5tg9NX3eRdA2LshUBGuFJ4GjPZOGXyOCkIqL1RgdbtBGpEKSjMPlq6UjHwIxdqnseHqSMZnTTL6384noSmaQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199021)(26005)(54906003)(110136005)(6486002)(4744005)(6666004)(186003)(2616005)(82960400001)(38100700002)(53546011)(6506007)(31696002)(86362001)(41300700001)(2906002)(478600001)(66556008)(66476007)(316002)(4326008)(36756003)(66946007)(6512007)(31686004)(5660300002)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0dQUGRoQWIrRFBwc2F2MFNvcHlpWkhTUEx4QmxBaHVzNWkyaTQwTVR6TVNk?=
 =?utf-8?B?WllldDZnNENrSDVUMldGVFVkcUo2WGZoVmlPZ0tYZTNqSzdMWHlXTlU1SlpK?=
 =?utf-8?B?MVl3WUUzWXRBa2tiTlZKMTZVdDJoUDd4WnI0WmpYSTJKUXovTE1TekwvRjdE?=
 =?utf-8?B?Z1hzT0RKZDRWdDlncmk5NW9ZQ1djLzNiMnpCYWtVcmx0Z20rVGJFSVA3RFd1?=
 =?utf-8?B?QjJKK3NiS0ZYdGtnMzlISll3V1k5ODdFQ1VpTm1BVEZIRHFCK1EyRGE2U0VZ?=
 =?utf-8?B?TVRRSTBRbitPc2FWUUtCOUM0ck1xWDhob2FYazVOaHB4SVU0UzZuQ3JHcWFt?=
 =?utf-8?B?R1VzbVRzTmI4SVhSU1JZOUVSMTB0enFpSmxpOUFxdHhSeGtLQS9WWTBhMkVr?=
 =?utf-8?B?b1IxejM1Z0JFejJ4U0hvbU1ITVo3NzFEbzhheXhZdWNGem5JcWZwZVZ5YXpB?=
 =?utf-8?B?UkdITWFxeXhZWndkMTd2N3Z6TG5tdlhYdXZYcklMRFV4L2p2ZDBWRDllbGRT?=
 =?utf-8?B?UGc0OUFCUlArZmdGSFlrSEtISFJTbjBybkluVUxMSWFuMnVKdElFT0RDZGZN?=
 =?utf-8?B?T0FUdnY0M3hPejA0SVNPckVQMlZDT2RBWnhHc3dvakhpN0FsZFIzN0FEMWVD?=
 =?utf-8?B?U2xQOWhUSGMvb0ZzRHJWN3VidXdqU3ozZWpiL2xUU2VsazRLclRaUE5Lbzhh?=
 =?utf-8?B?eHRQb3lFcm00aGJuSHBsSTlEZEZFZGNiaEN2VWlIYUJ3ZWRmZmpuMGN0b0Iv?=
 =?utf-8?B?VG51NWNNZ1IrNk1pNmtvUXcwb1Q1WUZTaFVzWllNdnh3L3E3SlF2UEFFZzNN?=
 =?utf-8?B?d21RSG8rbFlRM3BqOXZzdFltTkNGOGp5N2RPbU1neHk2TUxvZXZ1cDJLL2Qr?=
 =?utf-8?B?cEZJOUl5TXFUV2lobmM0UDI4WnJYc05SdkR1OHV4NTVZNGFWcDFsTmpJTWMr?=
 =?utf-8?B?bmdRS0FQRnNmbXF0TjljTmh4aGUvOU1lM2xFRlZTVjFVNmNsV1ZNMzRKTndt?=
 =?utf-8?B?cnNlRi9BZUZMdUM2Rm1jMFFRREZwWkdhclpUNUZ0M3hOWDRaMlhyZmJuNHpq?=
 =?utf-8?B?SHEvV0ZhZlVuUU9Kc3psQ2JmWUxIZkZFUEVibUJPKzdSa2tqK0J5RFdDMGRp?=
 =?utf-8?B?ejlZMEVzUm5laTd3RkI1QkZESytjc1NHQ08vN2VLdm5mdG4vWll6c3RYRXZ5?=
 =?utf-8?B?aWREaFhtaVJrdUF5M2pyb2VOVnlGNmNubEE1bnA4RVp3Q2RZY1AzWExkQTFi?=
 =?utf-8?B?V25nMjg2dGlUR1JtK25FMEJxZ0JtSnR1RytyNWY2Z2I2TG9taTJ2MzNQQ0hm?=
 =?utf-8?B?MEZUSXpoeVc0bnU0UE9CbEpnN2dndnJtV1VweExFWldSRTFvRnhSTGsrNmha?=
 =?utf-8?B?SVE3SzdnTDg0b1gyT0tUUzJqZHNxbWFqQlp2TzBmWE14R0VSQUZ2N2d3MDdZ?=
 =?utf-8?B?MXl1bW9HVDdMRXVhZG5WYWFFak90Uk1PVjRyY0QwbzhrZXhPZXc5aXRwUmoy?=
 =?utf-8?B?L3lPV1RIcXlaenFjbDRGM3Npc2J3ejBwRjZqSjRvbENVRkdMbzJDMDgvQ3U3?=
 =?utf-8?B?L1pxZzVNak42WVVnQmZHRnUvWmU3clQvQ0MwSmRvQlkxUmpqV0NxZlk0MFdm?=
 =?utf-8?B?bURBTGpacEZMOUU0SjdiMkZzVnhPTW1IMkVhNDRFMmlBTXVaU3haVEJBSmRV?=
 =?utf-8?B?ckpWUEN4bUcycVdYTXorZ0E4ODdSOUNydUIrU3lYTXE1Y1FMOTV2N0NycTNq?=
 =?utf-8?B?SDZXeTNOQVhpWDFSQlJka25uRXdIa1VKU3dEclR5Q2NYVHVvTXZiYnk4SWJi?=
 =?utf-8?B?SmdJV09KT2J5aXNiSWNzeXpGUXNNMjlDSEN4WWtZSUtIczlhbjkzNmF3aGwr?=
 =?utf-8?B?MDlBZlhnMnhrcmVoMHZBR0toelVaU2VaSC81M2VEQnp1eVJCUGVmY0NzY0c3?=
 =?utf-8?B?NDFZTytxM3RMWkE5SXo5QUs3RHNqZEpFeUp0b0JkTGMvQ2xKRmVhZVRNZkVi?=
 =?utf-8?B?ZmVWUHJKVEI1UzlKc1BQSHRHS2tDcXNOVlo4MVNyMElWR1orK2NDNzhPWGVi?=
 =?utf-8?B?eUtYRXFXN2hDbk5uL0RGMHQ4NWFEbFpLV0VSSnd4empRZVFmcFBsQWh3VWM2?=
 =?utf-8?B?dGh6YVAyM0hRZUhVTlB1VjUrenBLUEExTkZQRExEZkFMSWU2QzJvNytjbnls?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OLvmzbFKO80IZgtDyScNgO5QmBg96tG7hHyUc2W3yFbAqo9hsgRqiot+MhCIjAB+wmrQQkgScNeIj/db98iINu6r0NdpXtV0DIzRuReR8txy0C3wia0THJk9vSiYJrXsLQtTHdBSOKgEdYabUZJ0n324qUc2SEaazqf0MD2/pfl2oB7SRCewSfRYmRV5ff0zAMXiatGTUppJe04FLsYAw7MF+bLaphn3nRMFtqc4DlLwLk5lPHnexdJAhF6I/7CpKuQFH4R5Y8OtnByUYwZI/jR5IJGOVFmL6svH4l+eyt4EqJGw4JlbLGu7ZdJ5y7xgsFesJx6C6rK247uU6YrKmANZxUW1WwzwQA9Q2k751sOFt3Nt9i2KDMdrTKmcQq/LYJGsNPXXgQTzvdcjo5C6kXY6Z7ZdmJyoIvpTPSuCSzYRnpeTFUZJJZxG4RSYsVbBVDi/L27gTs+AsfzyueJ+UfWO8xEQg+EeBh7Th1Jklo7GBCEQhnNuwkrt8QY2AfgMTMSSlr4F9vO7xGT0iZKptGJW17WFPNR4mhav3GeSTsbEn+FoXutPTH+9iMQ3h9bNBCyd+ha7LNBHk2dsWkKZ5r0nZkxXKkYa9Rygkmw3Pzvpc1wO0nJbopcMDMroVBUU1N83LB5LeylqqNsFxymFrr6oLkux3DS2Rlz/p+mFjMEDVm4rI7Ry13o5cLjHoGesBo0j9ZWCnvQJPZh9e1oEX+YiTHre9L+sN11hTOysXET1F/oINrmbjKMwQ2NFMb71hf22uyi7qEy54QC1NohbV5N/UEDo0d+JZ0OF+xDRU4DYFYVjMVfeL1Qv09Jp1I7duJUv2Ws9HB/k4+1fXenr8MjDawL4p/kYlVs7VX15NecDm/6Q095GknjANdnuQRF1B+DOfBUUQ/Tq/EuS3QwNOg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d417dd0a-8ef2-4cd1-0bfb-08db78ac6767
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 14:23:27.0680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9WpqbJ4LgzY7az00aG1lhd2BUtX3RHkWuqAI0x3qCZJCBg9U0YjjiDDRar3CAVppHi+PH9Wch9UUXmpBxswr50TYO5BSbya0XsEpO4cB6TI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4981

On 29/06/2023 3:20 pm, Ayan Kumar Halder wrote:
> On 26/06/2023 04:34, Penny Zheng wrote:
>> diff --git a/xen/arch/arm/include/asm/mm.h
>> b/xen/arch/arm/include/asm/mm.h
>> index eb520b49e3..ea4847c12b 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -292,6 +301,12 @@ static inline void *maddr_to_virt(paddr_t ma)
>>                        ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
>>   }
>>   #endif
>> +#else /* CONFIG_HAS_MPU */
>> +static inline void *maddr_to_virt(paddr_t ma)
>> +{
>> +    return (void *)(unsigned long)ma;
>
> Why do you need "(unsigned long)ma" ? Both "unsigned long" and
> "paddr_t" are u64.

For when paddr_t really isn't u64.

The logic is correct, but it is an opencoding of the _p() macro for
turning an arbitrary integer into a pointer.

~Andrew

