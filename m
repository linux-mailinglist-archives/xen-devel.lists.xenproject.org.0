Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C497440EA
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 19:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557590.871079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFHdc-0006Bu-0s; Fri, 30 Jun 2023 17:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557590.871079; Fri, 30 Jun 2023 17:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFHdb-0006AC-Sc; Fri, 30 Jun 2023 17:10:27 +0000
Received: by outflank-mailman (input) for mailman id 557590;
 Fri, 30 Jun 2023 17:10:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHd2=CS=citrix.com=prvs=53833986c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qFHda-0006A6-Gz
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 17:10:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff32b2b4-1768-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 19:10:23 +0200 (CEST)
Received: from mail-bn8nam04lp2045.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2023 13:10:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB7079.namprd03.prod.outlook.com (2603:10b6:a03:4e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Fri, 30 Jun
 2023 17:10:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 17:10:17 +0000
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
X-Inumbo-ID: ff32b2b4-1768-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688145023;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AHtRVj/GQHX9kK4deyFxCzhBc3FOl4i7y/iXtqyXUyg=;
  b=KDrcGKCtRgN1hqRIChk2ukd5UkNhhGz54l9JGr25OBk2xmChe3e+PWAk
   MAu76W2AJfp7ap9VOsxUoZqUwYc8ANJQckNDu7DRUKQ5Nt9i6g6BOtUyr
   tHJaDrQsRfyQ1yN2nXjxOyETVFShmViWij7IIxQK6QTGKhvMsqCENdrWe
   0=;
X-IronPort-RemoteIP: 104.47.74.45
X-IronPort-MID: 115191539
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KGo5Eqq7ndtfuQSKWvVnHHBXiBVeBmLSZBIvgKrLsJaIsI4StFCzt
 garIBmHOKuOZmrxLtp1b4+z9R4D75+GmoUwGQE9qChjHi1H+JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weAzCFNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGkucTmcwP+w+aOQFOZMj+IfNcvqJoxK7xmMzRmBZRonabbqZv2WoPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+SrbIe9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThq6c72QDIlwT/DjU4e2Omrue3knW+ePdxB
 2EN8wMl9+sLoRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC1
 FWEgtfoDjxHq6CORDSW8bL8hSy2ETgYKykFfyBsZQkY59jupqkjgxSJScxseIaulcH8Ezz0x
 zGMrQA9iq8VgMpN0L+0lW0rmBqpr5nNCwQztgPeWzr56hsjPNL4IYu19VLc8PBMap6DSUWMt
 2QFnM7Y6/0SCZaKl2qGR+Bl8KyV2stp+Qb02TZHd6TNPRz0k5J/Vei8OA1DGXo=
IronPort-HdrOrdr: A9a23:pS6wDam9CX7Oi7Nd/ArP8XSm2Z/pDfLc3DAbv31ZSRFFG/Fw9/
 rCoB17726StN91YhsdcL+7V5VoLUmzyXcx2/hzAV7AZniDhILLFuFfBOLZqlWNJ8S9zJ8+6U
 4JScND4bbLfD1HZKjBgTVRE7wbsaW6GKLDv5ag85+6JzsaFZ2J7G1Ce3em+lUdfnghOXKgfq
 DsnPauoVCbCA0qR/X+PFYpdc7ZqebGkZr3CCR2eiLOuGG1/EuVAKeRKWni4isj
X-Talos-CUID: 9a23:/Gfmz20EtNqdvWagL72rlrxfQ+M6W2Ka0XHpMmTmBkZgboGMS16K9/Yx
X-Talos-MUID: 9a23:ogNkeQWJRrKPSS7q/BHCvCxtKslw2KSNLW4hvIwPksLedhUlbg==
X-IronPort-AV: E=Sophos;i="6.01,171,1684814400"; 
   d="scan'208";a="115191539"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXFO2k1kxmaOFtLjkrOXHvt0Nca2cyjF+x2+BN+kEYOIt07lUNB78VvU8if/mGNvAf57BknxlEOLTgMCRvc2SK+xS5M2tsGZKuWOfk0Ba/acRvMGEGCVYwSDFTq9pZPyZ9iZhAJosEJ7trqZsLQ1g+cTiyKtf0t7a7GhLB0KH0XKzn6w6g2w00FFQik7roYE18ooPAGl551C16hJP7E6/w4au7jocR9dtPLQsAQW7ejfm1dbBced3Yk/sPuyb0PLWUYemNftNbYQtcMuSTdhHSCUwDyVxYgkh9UsdmQ8W0yJRXSvMqaV5V5Evxw2ik3yuwm/Cc2vn2HWdFLVts87/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMSny4zNfL0TIdsEKzwcfZQFaB3Z4tE3ImcTlDqpMGA=;
 b=NQaNq0fsyJAcXE0vMEIcObUvFai6+ABMRfMvXtqUxAFWiOLADqRAp4yrueyb6Dx+aCBSoiF75WQ5qGCSmfWKdTfR2vgpBePuHQzhCaeUjKwQn+cCr1WJdIwy1Rans8Kfv3wZ95onXkMgSFiZ3lPsLLD6tY/If9d3sYSUeAEoBounej3LB88smWKzPE2KPBGh6qi+eLAejbpHL+C2s4Eq7hG4Qa4lZODLGn/Q5viKQoZljwWL9+erJqAR/5YarNjuh/pR6hebxjPGfUod85hgj21TN2I2cTZL4iAqaMK4MiANfVWOX4di6uc6ACbs0JP0c4bNy1oMxFp5MJT2eBWPvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMSny4zNfL0TIdsEKzwcfZQFaB3Z4tE3ImcTlDqpMGA=;
 b=ru5uNNpizp4G0P2h9I130wUijB+hxBpaQCuozgmYcyAkt2hDP8grVXKvCBoZaJ56Xi6V94HkIIEExtJrZ5z7FcAaVBsG0A88pf08ZukjSwmjzloUiUD0UXrM/gkN8qOqE48/Un19GpWI+IXs5L4l6IaAmyIsDgfr2/hKlcZSNFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f77359a0-7c14-7365-bbb9-02d86fc08af2@citrix.com>
Date: Fri, 30 Jun 2023 18:10:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] amd: disable C6 after 1000 days on Zen2
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230630131820.29323-1-roger.pau@citrix.com>
In-Reply-To: <20230630131820.29323-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0187.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be4ba86-0785-49d4-c34a-08db798ce051
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7EGORvrkPjh88t9nFbHmS2dLBKK0K/nXxgIXJA817F1jhwRn2Fg+HeJE5eqynRpaAYDyQYIIw0fuh6R12vwM/L164WaoJj71A9cLFG2ofXIIO6tM+6HoADfNOK4v5GmUt7TibIm0OgeSPzmOxZQZaogEGXLmpzugHSXW9BPooN2zvzj1wFlI1fenC3irGbWqCFzIjjqiJ/E0OayHZ+PLnJOh8OfrbX8v3tJrlk0/kMhZkO1zz6GlKEXjWuBCSQhIAbsdda4xSzdPbS9A4xu2CIR2VNx8I8oUhFZnRFCfT9Nln8YH5Pj/RBhsa8sefVHLPo+KysMbrBVT+UARLYkNP1vso+1ZsJlncr7+VUtS5+7UOPdhD9sObowb8PxCGb/ql1T8GsSJ8sQSzph4FaDfeDq3UiM/2zqMsrKTM3w1DtqwSGLJGsZfgNdljaMOCyp/oZo32H5DiuhQNTxckXb14skiyQyGHYvGnK5bM1AALyer7sbI23lwnqhVwa6OS1xP5q7+cfD4j6BkTgDC1fUo1CwoyDDcIaJXbOSo8IPoo7L4fT/Q8mVWx2SjWFzVkyU6xVZbcD65eyG7pUTOEmePj9+Di+PtXYGQHjHCAQcPFeSAG4cipBxLj8gxRp4AWJNSKz3kf7zU/Ro/rCr6I2EuUgnp2SIE+NGnFkzK83eCvn2paOB3amP+7ip1ujTsWWkP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199021)(5660300002)(31686004)(66946007)(66556008)(4326008)(66476007)(316002)(36756003)(8936002)(8676002)(478600001)(2906002)(6512007)(6666004)(26005)(54906003)(41300700001)(31696002)(6486002)(186003)(53546011)(6506007)(86362001)(38100700002)(83380400001)(2616005)(82960400001)(221023011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2FucFFyTUZIYjhLbTFNa3VQMXhiWG04SkJrYmVxb3o2RnRnZVJFZkNNbnlx?=
 =?utf-8?B?bEpia0JHSDV1S0FrL2Z0UXE5MHoyTi9ZUDRCc2tIUnplOXZEWmtYRkNXOFFQ?=
 =?utf-8?B?QWZHYnhhK2JheEM4NHFQdS9NSmhsaWEzcnphWlB3UXBHNk41NnBkLys2ODEr?=
 =?utf-8?B?WFhGYzlnRktOckhCSkQ4ZlkyRTFqek9LU3RobVNVREllY1QvTG5jemdEYTY2?=
 =?utf-8?B?QldWdlYrNVc3R3BFMkF1ekZaWmxPaDRiZFZuU3Q5SWp4SENnNFY4YTg0NXhl?=
 =?utf-8?B?V1ppTHRuUGk2Z1E1WjdmNytLeXVaZ1FicXJ2QlNucUptaS84ckhnZFVZb2Vx?=
 =?utf-8?B?S0lYSlVPQWd1cEhpeG40QXNmSmxZeFh3NkpOUXNsUXM1bnI1a0lpQmpyQWwz?=
 =?utf-8?B?NW5uU3A1VUpEcTNXdjhrNDNYaGM2K25yVXFncXlLT25ja0Q2MU1nbXNLK0Er?=
 =?utf-8?B?eWQvSzRSbDc4bXJXV0E4Z1pCdUdsNlMrK1ZHMENtbTlRUDU2OFhQN0g3NlRQ?=
 =?utf-8?B?WkczYjl4OGEyT2w3VlpOOEl6L3BTMGlHNWhBTS9hSVZTQ3hzZ0FPTDJNVVh6?=
 =?utf-8?B?T0NJMjdJT2V2MXYra0puV2dvcW1saldHZndzV1BqcjJiczQ3K0FlcXZvSUlX?=
 =?utf-8?B?Y3NYRmx5VUowdFI0aEtsR2VlanR0RHU3TysrbnpRR3NKa054T000L1BicHYr?=
 =?utf-8?B?dlZqOGZpNFRCQm5wSjh5US9jZ2h5V1FkYUxEcDhDOGlFY08zNzA5R3pWcUEv?=
 =?utf-8?B?eWs1ZnNpL0pKMXJ0SG5ROE1LNWlzMDR3Uk9kRC9hdDVUdE9yV2gyaDJ1ZkRN?=
 =?utf-8?B?MmNiVWVTUUlydlY3MVhCSWVFWXdQWEttVmF3SmN0bXlhRjhwaG51N3FvcjJI?=
 =?utf-8?B?YWdMdnBwTkNrcU81dTEvUjMxbFBVZXgwdWhiS0YzcGN3dFh0TXgyRklJb1ds?=
 =?utf-8?B?emhLZjl4ckpYbzYzdGFsWlZkbGVlR3lzTDVWUUFUM0dla3pkZDZOOU90M2F6?=
 =?utf-8?B?ZGIrckVuYVBEZFJsUGt5NlNkZ0dwSXNmWHJaM1VySzZMbGRFdTVZb2x6UWl5?=
 =?utf-8?B?VE9SbTdPM0ErdUtIZ0JyaWFnWHN1MStkb09qL2l0OWE1cWhiYmpueDNRU2xQ?=
 =?utf-8?B?YlF2WUxXaUdCSU5LMmZVaUdLVnFSWlA2LytMNk1HbzU4WTRDOHp3SXJoQUdj?=
 =?utf-8?B?S3Npck5OR1RVckpmZ2dXVFNOVFNOREJpalV1ZXZQQmlLc29tN2d5anpqNU1z?=
 =?utf-8?B?VlBwT21VZ2QzSXFmU0ZuL3pUWmsvZnRqYU1rdGRwZzhxaitubFB1cVFMZVp1?=
 =?utf-8?B?bnJ4NVdrcFM1d2h4N2hOQlE0WkhtMS91WkkrRkc4SDlYOXRiei9ESXpkWXpt?=
 =?utf-8?B?UHAxcjdNMWo4bjAxdWMxbW9tSWlLbld6SW5menNQUFFTM3p3S1lzYkwvMVQz?=
 =?utf-8?B?VisxcnZNU1ZYVDAyNFRDcWYraXJqUVFtK0g3Wnh4bU0wdzd1bkhGU2l5Zm05?=
 =?utf-8?B?bGNsUDdQOGg3a2U0QVZ0YUg1SmtXbjM0d2ZQNkdUb1pxQ1NPZ3FRc2JndWNm?=
 =?utf-8?B?UytFOWl2R1MzVG5IMllUZVRpY3Fudk1JTVRiWkd6QmJkTnMydW1CenkzaWND?=
 =?utf-8?B?SFc0a1BWaFFmblczQ3NrVllnMU5uRGl0Qloxczdockt4V0VCNFc1bVoxYnVq?=
 =?utf-8?B?SStsVW56LzFZUGs3Zk5MbWV6SnNYa1NURlJ5ZDZZdHZ4OXJMcU5IeEp2dWZw?=
 =?utf-8?B?dW50eHIyKzJKMm16VTF2RjE4QXRBcDB6ZlhNdXkyc1BJL2h3QWlCM2tIWWsy?=
 =?utf-8?B?T3htejdEZkM5YldtZlVyN2ZrUzdlK0E1Zi96Q0draEt0TmNoTHlhbTg1RFZh?=
 =?utf-8?B?cUVDdldWS08zOFZmTGl2M0lXNkcrMEJVL2t6RDl0NjdjWnNweUFCbVF3WFN6?=
 =?utf-8?B?Z0VjM28xUlV6dzR6MGFYREkrenIwbis4cmZQSXF2K3lXdXZCNjlVZUVGSWxO?=
 =?utf-8?B?U2xsN1lUejJyMkd5YVlqSmxUQ3dQelozbHovZENaV0tPL280cDIvdFJ0Mjc5?=
 =?utf-8?B?ZUxRQ09BMlkvTkM4bXdKL2pHWUUrSE91VHRybHptS3EzcEZaam9Vb0kzR0d2?=
 =?utf-8?B?MHlHZzhDQTY0Qmw3SjhrNlhjQ3cwYVhTVXhxY3hNUDU3US9FNWlMMXNQYktq?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OVlstv0u8QCZ0I4qLE5YSe9JsDqSYL4Qp8ekgjTB+8KExwHDTty5+gPsmYD1DSJ/P8RItYtBU/bbPLMF4PPbX4p16PykQ3KcmrClG4bd0O2S0H5vVNw++br0V3NpMFAuHaCStUIqHLFaRH1ntASB2VuCzE8BKgOm5kia9WhO9qJ5lrcCCBbG0OB13YbeA5BNkGbRZ7uwDYADsgWc8N9Fv4+ITk6OvrJKBfCH+gEaToVmghggXUMV8/hOZeComHiM2nshSiXYnDd6ZOLKK/xHNM37hK+pBIiB/gGVJGayjxZ4qWM8mwkgpnda58P/mu0JWnwz2xm2S8udk4uIJoGe7uIqhobwRCu1tAgXCBRg5rAwaw8MZwYzgaJKQ4jCwdiapSXSGSyjM+c+DdmCKZ1A9CP8ekvO+1SAHyH1hDWEEJnW3AR+eJ0hPtPGPI5aHKY8OM/qJUEulpP3ufuh1znDY3IAygpbTv6qS+Zb3M9clonsXB66ys29bLzKMvNCvmzHVu6cVMM4b8L0pJPW0n3wTnIXY96/GhW8NPB/JnNVwneWymU5eEQ5OMShCqTvUCAdWOytCV1umy7AM2thzPwgl3pB0tkZ6FuefuPwMVcZUZjBgHEG3awzPmvcN6ovJOeA/jK9Mny5Q6/A6RzXkvQdxkSPKyAr9m3wipOKpN61FWX26ANvyam0RKFZZ/9ZCNIHdju8p0aD7s2nDayiQGV7Nc+UE1Dr3EP8p2vBe23kblKgiwlnHr24+cnc7Pt1mA2AZtOUQQqJHA0/GZm/tnrdstq8eXknJxuB1DusV2evicVZvRLMJNrfk4NRweXIT0divOn4yycAPsd8xrMaX7iPfn67kCXVhJmKqgVGi+ctcBI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be4ba86-0785-49d4-c34a-08db798ce051
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 17:10:17.3428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9Jatincq/XAYVPfRa+ZWn9/myLZtDuazebicshcrJq8lP9LdLxvwYOyN7NQGgIkWa7qmrVQF/vAhsVmx1i6WPO3uDUUA+jAzg3oORUDRKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7079

On 30/06/2023 2:18 pm, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> index 0eaef82e5145..bdf45f8387e8 100644
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -51,6 +51,8 @@ bool __read_mostly amd_acpi_c1e_quirk;
>  bool __ro_after_init amd_legacy_ssbd;
>  bool __initdata amd_virt_spec_ctrl;
>  
> +static bool __read_mostly c6_disabled;
> +
>  static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
>  				 unsigned int *hi)
>  {
> @@ -905,6 +907,31 @@ void __init detect_zen2_null_seg_behaviour(void)
>  
>  }
>  
> +static void cf_check disable_c6(void *arg)
> +{
> +	uint64_t val;
> +
> +	if (!c6_disabled) {
> +		printk(XENLOG_WARNING
> +    "Disabling C6 after 1000 days apparent uptime due to AMD errata 1474\n");
> +		c6_disabled = true;
> +		smp_call_function(disable_c6, NULL, 0);
> +	}
> +
> +	/* Update the MSR to disable C6, done on all threads. */
> +	if (rdmsr_safe(MSR_AMD_CSTATE_CFG, val)) {
> +error:
> +		printk_once(XENLOG_ERR
> +		"Unable to disable C6 on AMD system affected by errata 1474\n"
> +		"Reboot recommended, otherwise system might hang\n");
> +		return;
> +	}
> +	val &= ~(CSTATE_CFG_CCR0_CC6EN | CSTATE_CFG_CCR1_CC6EN |
> +	         CSTATE_CFG_CCR2_CC6EN);
> +	if (wrmsr_safe(MSR_AMD_CSTATE_CFG, val))
> +		goto error;

These MSRs don't fault, and we already excluded hypervisors previously,
so the safe() doesn't really help.  The only way you'd spot a failure is
by reading back and noticing that the update didn't take effect.

Independently, this really really makes me want to dust off my
msr_{set,clear}_bits() helpers to reduce the boilerplate required for
logic like this.

> +}
> +
>  static void cf_check init_amd(struct cpuinfo_x86 *c)
>  {
>  	u32 l, h;
> @@ -1171,6 +1198,9 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>  	if ((smp_processor_id() == 1) && !cpu_has(c, X86_FEATURE_ITSC))
>  		disable_c1_ramping();
>  
> +	if (c6_disabled)
> +		disable_c6(NULL);
> +
>  	check_syscfg_dram_mod_en();
>  
>  	amd_log_freq(c);
> @@ -1180,3 +1210,43 @@ const struct cpu_dev amd_cpu_dev = {
>  	.c_early_init	= early_init_amd,
>  	.c_init		= init_amd,
>  };
> +
> +static int __init cf_check c6_errata_check(void)
> +{
> +	/*
> +	 * Errata #1474: A Core May Hang After About 1044 Days
> +	 * Set up a timer to disable C6 after 1000 days uptime.
> +	 */
> +	s_time_t delta;
> +
> +	/*
> +	 * Apply to all Zen2 models.  According to AMD revision guides at least
> +	 * Rome, Castle Peak, Renoir, Lucienne and Matisse are affected.

You probably want to replicate the spectral chicken comment about how
identifying Zen2 is actually very hard.

That said, I don't see anything which limits this logic to Fam17h.

> +	 */
> +	if (cpu_has_hypervisor || !boot_cpu_has(X86_FEATURE_AMD_STIBP))
> +		return 0;
> +
> +	/*
> +	 * Deduct current TSC value, this would be relevant if kexec'ed for
> +	 * example.  Might not be accurate, but worst case we end up disabling
> +	 * C6 before strictly required, which would still be safe.
> +	 *
> +	 * NB: all affected models (Zen2) have invariant TSC and TSC adjust
> +	 * MSR, so early_time_init() will have already cleared any TSC offset.
> +	 */
> +	delta = DAYS(1000) - tsc_ticks2ns(rdtsc());
> +	if (delta > 0) {
> +		static struct timer errata_c6;
> +
> +		init_timer(&errata_c6, disable_c6, NULL, 0);
> +		set_timer(&errata_c6, NOW() + delta);
> +	} else
> +		disable_c6(NULL);

I doubt the smp_call_function() is going to be happy at presmp time.

Do we really care if we're already beyond the timeout?

> +
> +	return 0;
> +}
> +/*
> + * Must be executed after early_time_init() for tsc_ticks2ns() to have been
> + * calibrated.  That prevents us doing the check in init_amd().
> + */
> +presmp_initcall(c6_errata_check);
> diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
> index 2749e433d2a7..5df090fba791 100644
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -211,6 +211,11 @@
>  
>  #define MSR_VIRT_SPEC_CTRL                  0xc001011f /* Layout matches MSR_SPEC_CTRL */
>  
> +#define MSR_AMD_CSTATE_CFG                  0xc0010296
> +#define  CSTATE_CFG_CCR0_CC6EN              (_AC(1, ULL) <<  6)
> +#define  CSTATE_CFG_CCR1_CC6EN              (_AC(1, ULL) << 14)
> +#define  CSTATE_CFG_CCR2_CC6EN              (_AC(1, ULL) << 22)

While MSR_AMD_CSTATE_CFG is liable to stay stable, the CC6EN bits are
uarch specific and not applicable to others.

I'd suggest keeping them local to c6_errata_check(), which probably
ought to gain a zen2 somewhere in the name.

They definitely can't say in a global header with names that don't tie
them to Zen2 specifically.

~Andrew

