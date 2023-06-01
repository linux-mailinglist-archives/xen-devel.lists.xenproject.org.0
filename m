Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9037199EC
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 12:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542380.846171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4fg6-0007B9-Ch; Thu, 01 Jun 2023 10:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542380.846171; Thu, 01 Jun 2023 10:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4fg6-000786-9P; Thu, 01 Jun 2023 10:37:10 +0000
Received: by outflank-mailman (input) for mailman id 542380;
 Thu, 01 Jun 2023 10:37:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFRJ=BV=citrix.com=prvs=509590c99=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q4fg4-00077y-AL
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 10:37:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fa0e7e4-0068-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 12:37:05 +0200 (CEST)
Received: from mail-dm6nam04lp2040.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2023 06:37:03 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6048.namprd03.prod.outlook.com (2603:10b6:5:393::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 10:37:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 10:37:00 +0000
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
X-Inumbo-ID: 3fa0e7e4-0068-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685615825;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HkasCAvrZGwtSy9P6HI5t1g/hlGjvpCrPQIAe5ETJZU=;
  b=gD4Ta1s0Vymkc3mfxc9aNEc+/PC3yqxsL40Hj3yIKikt4IBdxIXqHvag
   qfvGxtmWNGhTa/p18nSwTBFisFJ3KX2NIXkCf0uGnSnWp6gXtjkU2h3rN
   PqBraiSjN4l/s26zpD8Cr+4L39M6Y8PgfdjNEG1DDdAUfUa/qO0a6UDxV
   o=;
X-IronPort-RemoteIP: 104.47.73.40
X-IronPort-MID: 111093337
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nHrdjKv4JmIssCB93WcE2rdqyefnVJdfMUV32f8akzHdYApBsoF/q
 tZmKWCDO/6LZDCnc4gkb4rl80oF65/cnYVqHQs6+X0wF38R+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AGGziFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwIRcjcEyk1ryM/bfmZ9NNjeAYEOjiBdZK0p1g5Wmx4fcOZ7nmG/mPyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0oui/6xaLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeThrq8x2wbMroAVIAY0eVrl8MilsGevQcNcC
 m4zww4EobdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLmEAQzxIbtA8s4koTDgu2
 12Ot9jtAiFj9raSTBq16bO8vT60fy8PIgcqdSICCAcI/dTniIUylQ7UCMZuFravid/4Ei22x
 CqFxBXSnJ0WhM8Pkqm+o1bOhmrwooCTFlJtoALKQmii8wV1Ipa/YJCl4kTa6vAGK5uFSl6Gv
 z4PnM32AP0yMKxhXRelGI0ldIxFLd7cWNEAqTaDx6Ucygk=
IronPort-HdrOrdr: A9a23:JkgQqKxtNh8vnzb2EjbkKrPwIr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSiLfK8nnNHDD/6/4Y9Y
 oISdkbNDQoNykZsfrH
X-Talos-CUID: 9a23:oWKlpm0xOxks+Vlr/xS7+rxfE+cLbCH6nSnqHkrlJFxIQ5mudX6ZwfYx
X-Talos-MUID: 9a23:tqzUUgjGn5zsE6v+PKYnSMMpL+VE4vr/OVw3uIQcqsqlFwtJHx2Rk2Hi
X-IronPort-AV: E=Sophos;i="6.00,209,1681185600"; 
   d="scan'208";a="111093337"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXU+h/C54jmxBxPOR0Ql/SLVYTpQoD59YJg1d/gMsNRRiqmiv2yzwulCUT7ACqPt+fOwQDFgEU6x7lW1797lURWJLdzDfnBRRQpix8LSHRiwhHpn75gVoH+sWHd/jS2f7/ToWMfePTSd26X+kPCsYsYsKqRDAe5V98q284JWZ0W95vep6SN1hpro56k4pOCg5GTeRR2fiomv+l4A5cedRilApR4qdPvVkli36LYZhJcZwSCkLhDzUn8U/bTG9io48i36OvAxefriKlOtzzw4ijwRCT850P/e7Y6bhejcgXgyYo69cgEKBDOXKy3lHHI0Rjzpa6hGlgXfqYdJxjzkFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6uMrUtOjclKHrAMyV/2RStXcsqO2auA9OKTC4MZnNA=;
 b=Rp3TTt6JWClppcXla86e+oYMrh24mXKgeIQ7VciaAbOsxZr7V3frbGn96HtGh3uhzINUlan9dALLtTbrcJ8LMABoBagPY4cE5zywf+yHrMkxg4fIU2YqoMO66dcJVT5vN66g3eBkgfHvuf/4hVXGZNNsfPNdgTbC9SdrYfYxARiSL+iYN3AjE1aKuBEkOm9OBDosNjtm5D6Cibx2966JnNbl6gdx36N56EhQVLGuheM9aHEwtYmz50KVvCKKLXHYfnSqF+IigKub3qBgmeHjNbPmL0G3Z3rL5gATH9C/DQa+ddXLnjIhpKee3WX3KknJoK6SaCJEai6DKL/SlwRPhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6uMrUtOjclKHrAMyV/2RStXcsqO2auA9OKTC4MZnNA=;
 b=h4Gkcxh45m3bveWyWgoCkkITSv3pB9b+xSmOhpJduo1ghF1ECMTFqpyl9Hl66UG5pmMyO8QkP2r3bnrCILkMaBCxlLj+nAcLAMsKvTf05VpMAzf7EEaTQb+Uq7e978H/90Xc89W5v/M5O/LXsqvNkjHFGt1ZHBqGeQJBqHRQghQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e9a99a04-695e-5b39-ee8c-e4fbcb1a6884@citrix.com>
Date: Thu, 1 Jun 2023 11:36:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/3] x86: Add support for AMD's Automatic IBRS
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230530135854.1517-1-alejandro.vallejo@cloud.com>
 <20230530135854.1517-4-alejandro.vallejo@cloud.com>
 <46c33f3f-7911-25d9-4236-cbee661e9242@suse.com>
In-Reply-To: <46c33f3f-7911-25d9-4236-cbee661e9242@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0227.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: a96a44dd-5982-413d-a3ee-08db628c2146
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kjHmpZWcPJKxGZtWCPAtgFzFU0yIFpRSGxQESdMLmtaD2omgPf20P5u+/rP69ZGhxK6DymgNvucWCXREoe5b+C9MXC5RuIqCKY7G0bKe5zz/5YTWuDcYq8HVbGzuHJ8MROm31SOMKxdj8Bf0fBZ4bZnAGhAWUSFO0G0nQBz6+JZG+IsLYyQwN9gGcTBpPn+j78H4bYTZQwaQj44CPWPpZPXSt+AJNQO9wcz0EKKkzGgE4Qc9j7qLy+kuoxmdVHOilE4G7IC8n87Gtu1JkmR4mTJlwrV0kPtOHKtgSfzCAAFvM12spJxL23wFXIv1A/bqY9fR4uHuDrgvK2kLg6kaZmGt32AKQQz7ebViWwBRU21mia6gvSVlSt1Jy+U7f2KL2lVGKhpFShoVkYt5Hf2gNimahol/3b5X9Uk2az4v70h1IF6xkJGxhvkF45hbUnfGEl7iPHEnGytcf7k7aa73lQP6Hq1tcqxxbMco2BnnykogTTp+d42P9pU18oFycNQbSPqErOLjtlCI7ZYDoNBXnoJdqdF9PLBh63PxN7ddDtYzkPGAWYdKAYeYuZELvPvrreZ8DOp4o+jCcG1ae+xbqPRxlyifrNhRuTEJImvD1/w2OY76e+7/hLFMe8ZvSum6NoiIhBzye7yPDjjuDmxifQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(31696002)(86362001)(5660300002)(8936002)(8676002)(31686004)(2906002)(38100700002)(4326008)(316002)(82960400001)(66476007)(66946007)(66556008)(110136005)(54906003)(478600001)(6666004)(41300700001)(26005)(6506007)(53546011)(6512007)(2616005)(83380400001)(6486002)(186003)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmZ6emtKOUdXNU42THUzNzdwVm5IVzdMQW84WXhWOENCaFlpd3ozNDNwT3pz?=
 =?utf-8?B?UXNIM2ErVEpycElTZG5MU001cjRtNU9iRUtPaWJGczZyd1liTy9NZEJwdlpi?=
 =?utf-8?B?RDlqVEhCV3hCb21FbXBOd3J3V2ZxUjROL0VVZE14U1dYTEtINzYvVFFzdmRI?=
 =?utf-8?B?TDJDeEYyaXF3ZHVOeXRMWDByTU5TeERHSVFncFljc1U2Um5BeU1SMUR3Ykc5?=
 =?utf-8?B?dXlYaytTYkJ3SE1LZWhoSENsNmk5bnhycTNDL2xzcWsvcUd3aDVNQUJxU09v?=
 =?utf-8?B?TGtzWmJtanBHNUp0SnBPQmVRVHhWQXRSamt6aTNIQjhmM1BjZVBISWJ4Ylhj?=
 =?utf-8?B?Q242QXgya3JqQ3grWG5pWUdpaDRvTVdpUm84TkcyQVY0K2JaR24rdmVsSlpq?=
 =?utf-8?B?akhJbmRJdTZUU3ZxLzdia1lBN255ZUJXK0VUOVJIUFZpV1VrZUY2cG1XUllz?=
 =?utf-8?B?UElBbTlHOUdxa2ZqWEVaR2dkYkZEOUx5SVZnTW00WEt0dWVaN2RqNlh3a0ZZ?=
 =?utf-8?B?eFZjbjk1ZFJxeHZsM3IrY1JLWjRidit1c2Q0Zi9OeHFxcG9FcUNmZTNzWmFS?=
 =?utf-8?B?cXpxc01MaHNOWXF2ZExPOGx2RUVuRTVJK0NQQjVxaHVoU1VlaHpIRjBVU3Y5?=
 =?utf-8?B?YWp4bTQrSXd3QVJKNjhMZnp6Um9PaGdMT0xwSlFMN1pxblBhVldxQnYwSVdN?=
 =?utf-8?B?R2NmZWo3M3Fjc0lyQVlIVy9URlBFUTl2UURFUnY3T09zR3Q1cWJEb2Q4MjRx?=
 =?utf-8?B?T0RrTWJyVmVLS2dyNHB5SUhLZGxRQWxyQVAzYkkzc3BLOE4wK3hteDlLeE81?=
 =?utf-8?B?N0xNSjVZbFBIN2I2Y3hvREgvcUJhbnRQZ2xvL0EwL2RpMzVlaVdUbE5HTWJV?=
 =?utf-8?B?OTFCalpIQnNRYnJnRUt6Vm9xdytMczRSY1IxLzdDMnZRLzN6UGtSVFZVOWxN?=
 =?utf-8?B?UWdXam45ZWFlT3Z5UUJNTWtrK0IxeHNNdFhxa0YzejI1RC9GMUpvTEhNV2ZV?=
 =?utf-8?B?eTN0MTBjZVZoTkZZcTdHUmVrUklUTVQ4SWxpTU82alRnTTdLdURERDNkanpq?=
 =?utf-8?B?c0xTUUxPMFZUcXlCTFo1TjZYWjZtamlPVXRBNlhpQytWaEF5MTRzWThTQ0F2?=
 =?utf-8?B?VlZuSDByYmxxMUJLeCtKdWFIbVdKSVJ4N0sxcnI4UlNCaGJGNGcyYnBRN2ZD?=
 =?utf-8?B?ZkZVTmJqRmNOUkJCZ0N0NENza2lvN1ZiNUU3aTQvZFVnNmZSQnhtcGV6RVF0?=
 =?utf-8?B?RE51UVBOWU83bFdGcHZIcEY3L0R5L0tmZksyNmYwZWY1U044cGxtSXdZaENN?=
 =?utf-8?B?b0VDcjU0dG1oSFlBZ28zMkxZOS9mTmtrRm9KaVcyQUorMTlqTnZ3L2R1US9L?=
 =?utf-8?B?TUdRd3BONi8zUC9BWFROTmxrOS9zS2h5cGVHQWZ4WmVZc2ZIc3VQVmticWFX?=
 =?utf-8?B?Y1d5bkozOUJRMmFOc3NMdUFUeFQ0S1BRNzV4VG5PUXhQQmZER3lyRENBclIx?=
 =?utf-8?B?b0JkdHNQTjB5T0JkSmpyK05QZHc5VjVZNFF5dDVrTk0veE5SUVhwdWlMUHVh?=
 =?utf-8?B?bnZ4WWVydGRxeDllbWROSkhmR0c0YW5jbUdNUW1KQUNITWw3WkVEc3RtdFJy?=
 =?utf-8?B?d0FweE01MjFleDJKWXFLV205aUxaa3Q0b0VnKzVPRXFWT1AyaDJMUkdGMXRH?=
 =?utf-8?B?NmhqdTVjOGVqa2xqSEd2emVUU1JhMlh2bVd0N3FGZHJPQnVtUEpIVlpRNk1s?=
 =?utf-8?B?RVY4MEJJN2FhTncxUEVEelRRdHV0bUQ1NElBQVYwbHlkS0ppYitFY0ZOTkND?=
 =?utf-8?B?eWlJbFVvenZ0ZmhNNVc0ZWVINEVmeWU5eHJyY01WcXJFV1Z4Zml4ZjQ3QU5U?=
 =?utf-8?B?TStqa0p5THNkREQvRlhCczhiOFh6TVJCb2svZGtCajZNSjZwcHVHUDViRmFC?=
 =?utf-8?B?UFF0YTdUcWo1SHFTWG5PemlhYjdNUkNSMVFMSlZ3WjUvQmIwRFNPZlRaTDd1?=
 =?utf-8?B?d3hLU25DeVV6OXpGczRpYURnMFNLSDZ3K3gyR0kyM1lkb1QwRXNmSWpYVU9Z?=
 =?utf-8?B?UnVvZGhwK3c2Uks5S0E2WDVONEZzdGlXdXUzUis1cmFscjNQaDQ0ZXFjaTlC?=
 =?utf-8?B?YXVGVlg3bitnVkViYVBmLzB6L0dQK25HMGNVTmxlYTBtbFY5WWt4V2Y5Q3dZ?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eRTjsgU+3ERXLPyT0EG9qJpgyRv2S6rzKU8XNBf+g3sBwMzDnqUXzeMVyvkWgeWiqFJ+6W5VQHBCGBCj3WO4HnyWdeSqfoUX5ZvyIPqO0pxl5jpNxpyj8faesZTIvsvysgHGafv4aaOAp125flWWkwwPiwb7mqXhBXJ2Yi7/ETtssP36EL/PahXhOhuGhAoWjja+sVl4TiUs6nNo2ZmE/kn8yLoq+QDq2vVluzJ3j9I7TPEsuVYYRuvw4x4s3V9f/Ef51ruPDN7KO57Ib+AQnhGJiowqHn8QYa4scqHTLDZ4uVJXZn2+LCAE0uc0Cuqk1UcWED2xpZ7hMRPUtCNqITLz+0/MuIj3ERZcqMvCQBHT+87mjZ3wWUjvRGrrREH3NYQfMjsd4tVFaTLmSuFeprPRW4UDuewVTNuqPemrcnlcy54asSW+TqeS4z13omBmnN/VA6gGSUG60vfxccyLgETHQ66gvksBJXQmL5JUky76nGReXK+HItqyZnYeCU127yLfKle/BZZhQzz1qqE/BiNUu03IrZ1iqPxtxgkabZJ6HFte+nJ2blFO9CU1UtV39wQ8RDyHk82DU0Bj8hjlDTfjFDUs8UpDa4LSpzYd8fntn/WvWg9cmbGDmzbKnXrKD0HEzG4uESu2mk1ZU2+d7yQNdncsMY5uzysNox5hyI3ZEFLW6O8SXhXl9aozIIH1n0fn65hQE7tnCpydEdCg2ebOW2XJY0o6KdW22khacTLz3H0seNw7ihV6pMUKQeuohz+YdIGnw4Fz2e+hmYc9RK+t9rFlR4dguCko51x5QUmDrpx+bMppkQK9eOie3dsYhinEVVFCyfQ9LAVtvbiUW83ruJwBFZ8OsTp+9QzbBFQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a96a44dd-5982-413d-a3ee-08db628c2146
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 10:37:00.6466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgIYDUnee/vVirdzMkYMQNRQ7sK9UH+2hNi3BO2gd+rXqHbmw789nI6868WH7q+kY2ytkyXVe8H0vXovJeol4S0xR1f2lYLB40q+vE/IxBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6048

On 01/06/2023 11:35 am, Jan Beulich wrote:
> On 30.05.2023 15:58, Alejandro Vallejo wrote:
>> @@ -1150,15 +1155,20 @@ void __init init_speculation_mitigations(void)
>>      }
>>      else
>>      {
>> -        /*
>> -         * Evaluate the safest Branch Target Injection mitigations to use.
>> -         * First, begin with compiler-aided mitigations.
>> -         */
> This is the only place where BTI is spelled out, so ...
>
>> -        if ( IS_ENABLED(CONFIG_INDIRECT_THUNK) )
>> +        /* Evaluate the safest BTI mitigations with lowest overhead */
> ... I'd like to ask that you replace the acronym here. Then
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
>> @@ -1357,7 +1367,9 @@ void __init init_speculation_mitigations(void)
>>       */
>>      if ( opt_rsb_hvm )
>>      {
>> -        setup_force_cpu_cap(X86_FEATURE_SC_RSB_HVM);
>> +        /* Automatic IBRS wipes the RSB for us on VMEXIT */
>> +        if ( !(ibrs && cpu_has_auto_ibrs) )
>> +            setup_force_cpu_cap(X86_FEATURE_SC_RSB_HVM);
> I'll need to remember to adjust "x86: limit issuing of IBPB during context
> switch" once this change has gone in, as there's a use of the bit for
> other than alternatives patching.

Please hold off for the moment.  I think I've got a cleanup patch in
mind which ought to simplify this substantially, but I'll need a bit of
time to experiment.

~Andrew

