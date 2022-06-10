Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05853545F53
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 10:37:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345983.571721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nza8e-0003jR-Rp; Fri, 10 Jun 2022 08:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345983.571721; Fri, 10 Jun 2022 08:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nza8e-0003h6-OP; Fri, 10 Jun 2022 08:37:04 +0000
Received: by outflank-mailman (input) for mailman id 345983;
 Fri, 10 Jun 2022 08:37:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kdog=WR=citrix.com=prvs=1535499d8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nza8d-0003gq-LU
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 08:37:03 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f1c3aa6-e898-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 10:37:02 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jun 2022 04:36:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5393.namprd03.prod.outlook.com (2603:10b6:208:291::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 08:36:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::50a2:499b:fa53:b1eb%5]) with mapi id 15.20.5314.019; Fri, 10 Jun 2022
 08:36:57 +0000
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
X-Inumbo-ID: 7f1c3aa6-e898-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654850222;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yYt0UB3eArcM0dqg+8VTE3BsLtm9fT8MM3lYITbAtps=;
  b=QhTqQBqVeCINalDlScvD3WWwcumSEfL0Gz3M+/tPWkL5BMG4MqdA7e+C
   w49YDh2c7q6udi9ccJeROKJAAsrU/G/gQ8OXojbLXkUqAJR5LexrhKBNZ
   C7eVf2SFyXQZfncYXxphVfLoCPJkhIi0mVrPYecJ9wSvg1th8yn1TtzxK
   A=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 73713353
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kfacTKIInEly2ODtFE+RopQlxSXFcZb7ZxGr2PjKsXjdYENS3zwGz
 WMYUD/VMvuMYGGget50Po/l8kNX6JfRyIM2TgVlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh3Ncw2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Ilfja6deT8XB5brs90eTit8LD1+O5QTrdcrIVDn2SCS52vvViK1htlLUgQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHM+FGvqTjTNb9G5YasRmNPDSf
 ccGLxFoawzNeUZnMVYLEpMu2uyvgxETdhUH8w3M/vFquAA/yiRt7rbqEPuSSODNH9pkwninn
 HKB7mnAV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQMDDUGWF39puO24mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4LgEhwASEy66R7wPHAGEBF2dFcIZ/65ZwQiE23
 FiUmd+vHSZorLCeVXOa8PGTsC+2Pi8Wa2QFYEfoUDc43jUqm6lr5jqnczqpOPTdYgHdcd0o/
 w23kQ==
IronPort-HdrOrdr: A9a23:vkkfb69hCU72mc1hV81uk+E+db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwWpVoJkmsjaKdgLNhRItKOTOLhILGFvAH0WKP+V3d8k7Fh5NgPN
 lbAs9D4bTLZDAV7PoSiDPIaerIq+P3lZxA692urEuEGmpRGtpdBkpCe3GmO3wzYDMDKYsyFZ
 Ka6MYCjz28eU4PZsD+InUeReDMq/DCiZqjOHc9dlcawTjLqQntxK/xEhCe0BtbezRTwY06+W
 yAtwDi/K2sv9yy1xeZ/W7O6JZ9nsfn17J4dbqxo/lQDg+pphejZYxnVbHHlDcpoNu34FJvq9
 XIqwdIBbUA11rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFston+tiA1bkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooEAljfUYgxVkIMEjgYdq3MMiFX5uYdk99HqQ0vFnLA
 AuNrCW2B9uSyLXU5iD1VMfgOBFXRwIb2S7qwY5y4+oOgNt7Q9EJnsjtbAid0g7hewAouF/lo
 L524RT5cRzp5wtHNZA7Nloe7rHNkX9BTTxDUm1HXPLUIk6BlOlke+G3Fxy3pDjRKA1
X-IronPort-AV: E=Sophos;i="5.91,288,1647316800"; 
   d="scan'208";a="73713353"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMFJCpC5bIDddmNwseEDOsulTmkT1MV5tjq0L8pUxeB4C0KRxn986Jgd+KpDKNaW/fgqxCalrPzp098LdBJgKkX/Cb7AHbrsCfYdUbL2b/YSmBVUwslguZWjL9zDxlBQOAceNY26duHFyFTePgcLWLkC+rj3ehHZXZlbxUfuHRtM1yr7lGDXvgR0KIit+u/PDXAEq5XHUUQklS33ConH5XcPAW9uhFv9FnDpNHIAvHfr2F3+Ywx6Eu7qwnpkHpbr9TC658mqsxzvyERpGp5B9+lQQxL5wyAt+bOO1O/7yeGPa5zS9JctYQQoXRYq+je6IQ70bWZveLlV/cwFzUBOuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYt0UB3eArcM0dqg+8VTE3BsLtm9fT8MM3lYITbAtps=;
 b=TfMtKKNQGs/0EMDeC507JS+GqghSNUuhCC/aQPoqnSEaPOHTtfmK+Esz2zgmQfoEJTIB6LdUIdDUZfGtd2sJJTKa05II/1JCytGSe7Dld2I2FGCynDrVr30xH3obRhVQj61FbBvHgwIWADacdfFbPhbK0TLQOM7JrvFhFvAiPX0KEdtZM7ZjGRvVT5ob3nEno+uZHPBKq1LFeNMdZYQ62gwIzr7gxh1JU7gbrs/EGbpv8eaXthIZi0pGrmaspR+7+mHYPG9uJ5Ei6ScWk8WTjeyrD+Tf6tT3Y8cq28UvOCC+YmkBLRQpil7XYwGl12ewAtP5FZTEWBnITO4BEE286w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYt0UB3eArcM0dqg+8VTE3BsLtm9fT8MM3lYITbAtps=;
 b=VE8J+6zHypFZzwYDEnJScA8kdn5i66m5K0CQcQgnQe2ZvtaMuWqLRyPKDwLQQ2D5xSvFqvT3YXwRCRwMfPyh5/ycYHZ83Lq9N6SvQF6Vsi/fiHM5BSVCI0DZTaMkDFL34O9Xj4bDbzw51wEkyBoVHx1IokF7RPqJP+GvKe3XbWA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/mm: account for PGT_pae_xen_l2 in recently added
 assertion
Thread-Topic: [PATCH] x86/mm: account for PGT_pae_xen_l2 in recently added
 assertion
Thread-Index: AQHYfJt5YVvowoL3VkeMPGEizKI7eK1ISn8AgAABW4CAAAVsgA==
Date: Fri, 10 Jun 2022 08:36:57 +0000
Message-ID: <225cf643-56d8-dd09-8313-628d16e3f9ef@citrix.com>
References: <ee7e7e1f-8d3c-0d8f-24ef-c281b09faa25@suse.com>
 <93283a6c-0a5b-aa73-7632-21cc9b4cae62@citrix.com>
 <661a2177-2352-a33d-3e75-39eacaff1b13@suse.com>
In-Reply-To: <661a2177-2352-a33d-3e75-39eacaff1b13@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fde0f242-f655-40f9-24c7-08da4abc619a
x-ms-traffictypediagnostic: BLAPR03MB5393:EE_
x-microsoft-antispam-prvs:
 <BLAPR03MB53938F26C811F2FC0E9806C2BAA69@BLAPR03MB5393.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 25mqsTwsH1giMiHmV6jHQ97qERIRrCL86MzZyAZFtHFiyEArPlzgpWfdIMAfvnv0UOU8QqaQDhwBm/BxSX5KJbZFa6T106PWL1dyglVwJQkmouBCMdWDFk1STSKA8bCZPfw8/ak0yyL5/qJog9JtlnXN4MfOWv4yp7fqDLplrqdIOsWThrT6GyshJDCKxIoYi+tKebzv7qM6LyghROriJNrOVVnLeAHZqx5uFEpzRGApBWW0WNvMR4X7c1qM4rtH0TakCjqtEd/Qxk6A0SLQD97x5XjUoGdusBrqLT7NEBCrIDMYBzqws2voFLSye8J0pyS74i+MES+ZjCHMzBmeaH0Wbj3MVUUEa/kP32X3iMQKWEWQxihgxOq+HBIXCJaFVASzvv6i2AR0aPfv2xTFR+nWAdGidt+jZkHHqHZyL6GlGKuap348FGoQMgdTnB2PbXUfeGx1l7kcVcnok/Cf6rnGDPdXAVTyVgxGbM2qL6L9Kkm3fDHEjSmn3LRUVmMQNPq+PLD+ObP4W6c1GlAvu9qLSg6Sbg5qjo2oEoS0EL9IRp+TOR6cNZgOeKnhslE5splLarCgNoZzTSYuFLzWlC3vahb/lZcg/N5GcmtB3FeZUKem4V/MFRMWU2ELELHNjd6YzB++Q4Cptd7sxqZPWAEyJiAUBAcJ+pR/Mi54JIxkKd4CvGV/TwOhKDKXf0cRsuJ6r89LJt3NcOse2RD60dgttC65F8NEZ5uKO9EPEcvWJvaBx3kyvj2jT55tS7wTI3MGCkUa0SMDWPi99ifUAg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(15650500001)(2906002)(6506007)(31686004)(83380400001)(55236004)(53546011)(6486002)(8936002)(5660300002)(6512007)(26005)(508600001)(316002)(54906003)(8676002)(31696002)(4326008)(122000001)(6916009)(38070700005)(38100700002)(71200400001)(36756003)(2616005)(186003)(91956017)(66446008)(66476007)(86362001)(64756008)(66556008)(76116006)(66946007)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Yk1QbVFicCswTXpLUWQ3dzFoQ1BxZFRwN1R3OVozeTN0TFdpQThKTGJmZXlh?=
 =?utf-8?B?bFVSS2ZvckloQVhteGxQTlRlWUVhVVkvVGw0d3VVZ2VjYVlOZEdyeCsyZElE?=
 =?utf-8?B?dC9leUordSs1UlhrTmZiay8vc2wyemtpbllUczk5Q3A1ZmFWNDl3MmlEVHZG?=
 =?utf-8?B?dEV5c2JZUnJnM3oyc1UyS1huaTR1M2VOWHhFVmYxZXBLZXNoZjA0bDJBWVY2?=
 =?utf-8?B?dERadTE2QkVrZ255UG5PbFNsZHlKMzVLTW40c3ppMElwdWVrUzhwemdWT2ZO?=
 =?utf-8?B?MG5vSVJlYWdIaFA1blBCWm4wbFVmNW9CVXh3L2gwY1RwL2VjUnVuM3RPdFdF?=
 =?utf-8?B?WU1QVmpnbVc4anBrVnFtMUFkZk04R1NiWWw0MExCM0hDdW1uaFdmUDhPT295?=
 =?utf-8?B?UUMzT201U2J6Rkk1ZHoyVzJ2NWFRMFlFdmc5Z3MrYUdtYkZVNGMrOWYxKzVv?=
 =?utf-8?B?Zks4dnB6TWMyR1RxM2hmUnd3QTZNK3RKVEJZdXgraGRleTJRdFpZaWV3S0dW?=
 =?utf-8?B?cVIybzVxM0l2WWZtTGNqbXFOb3hPK29CaFh1SGpMcUVoU3hRTzc5R2pCYzNo?=
 =?utf-8?B?bXI4QVlMMkl5ZEd0ejRUNzlqWW5rRVBzY2RNOEJwcTBOd0R0THY5ZnRJZGhn?=
 =?utf-8?B?dmZVQ0MwbnVRb3h0Um9ORzBEOTkvSlpRL3RSWXlmS3pTUkZ0dEVQTWdFQndL?=
 =?utf-8?B?QXR3Rks5NlRKM1krWE1lanVPb1lWRWIvRXhuK1EzcThpczVpemx3YXdCbUsz?=
 =?utf-8?B?T2Q0NThFbjJseXhqVmlNSExtWUZBZ2RmM3loVkcxR3AzREVnZTN1MTNtZTFF?=
 =?utf-8?B?cW1WSCs4UU44Z1V5Yk5pbWZHeTJ4T0dsRVUzY1FIZ2FuVVUvZlY2VjBsQ0Zk?=
 =?utf-8?B?OHFhRmRZUDN1TCsrWCtSTTB0d0lsd0NjdHFVbTllMUI3V1liQ3c4elhqZGE3?=
 =?utf-8?B?QzV5bk15UGkrWC9Iako3dk96MnFyRGZLRUlneWFYRjA3RE43bW9NQVJiSm5p?=
 =?utf-8?B?b09haEI5Wm1yZ24rQjU4ZC90akZtL09wMjErU1RHREZ2TzRxSHJBak5lS08r?=
 =?utf-8?B?bXlhbFJ1TWdsZ1hKTXY5b0pIYllpZHhhYVNMbjZMNzFTamRGb3NqZy8xUHpt?=
 =?utf-8?B?NXhtd2swaUl1RDdlemcxMzg0YVRIUHR3bWc0K2JsVk52RXlUOGxjZ1lXYW80?=
 =?utf-8?B?bFNtWlZIbWVWQWZUUEtSZzJUZStOeDZMbUFKNUwwU2NYRERldTJZUUUrTHJG?=
 =?utf-8?B?TE1PNEoxVi84MUhzTFJoNitDb294Q0RxdElJQVRkTlFYTjJMNW54Titwa1By?=
 =?utf-8?B?bkNEUDF1ZzkwampiMXFxeGpsazNlTEI3UG00K3M3bXhMRHNLMWs2djBZZ3Mr?=
 =?utf-8?B?OXdIdTFWdm0wNXl1RTAxeVBLdS92QW8rOGFRUHp4L1ArSWlqYW9jUUFRTTZW?=
 =?utf-8?B?TERXZjJKVG01NTZGMWVVN1ozUGpXVnoybVhUOTZ2L09iVmJXU2J5R25hYTNh?=
 =?utf-8?B?Sks5cy9NT2RIME5iN21QcWpUOWhOSnVkL1lMOG1KZ2FTVEdybndhS0Z3a0hD?=
 =?utf-8?B?OXduMnloQjYyQ0xrMHNNWUx5T2NKWXJaTm1FMWlrZnEyZzltU1ZQbDAyWEV4?=
 =?utf-8?B?TjlIRXkyb0R5aVNVZm1ZZytLQVNrbFhyd0pEaWxIRnBTWnNSQ1cxaW9MK282?=
 =?utf-8?B?NmVOQktHMjJaRVU3K0JLTkZ4MGswNVB2RlVlZzVmTzNzVDBtSFVYeXd3Zldw?=
 =?utf-8?B?UVhqakJ0OUFNWlVoT25TVERrdlJhYjN3Rk9SdXYzNGJIeFJ4RjVIU3duME5E?=
 =?utf-8?B?clhJZ3p6NUd3akFWVGFjYnN4eERqQXZzUDE0NUNPS2N1ZnlJUHM3OHBRQlNU?=
 =?utf-8?B?a0pMWDlDb29kOXpSY25sYjVJR09DTCs5T3hla3VzWStQVmlMRnJUSFVMSFQv?=
 =?utf-8?B?MmFjV25wUkNmcmRNNzBnbEdQbjdHVWZCZ2NzQ1NVZE5pN2pHS29lVWs0VDVR?=
 =?utf-8?B?Wi84QmR3UW0yUTZYbzI5OHE2YnljaUIxcE5WQlJOeU1JYVdZdHphem5jYkJB?=
 =?utf-8?B?Yk9wQkpEVHl1d3MyWGdnVmxhR2hpbzVaWWY4dy94WUF1ajYvVmY1a2U0Ylk3?=
 =?utf-8?B?Vzg4M1VvQXg5bU80djRuaG5GT3NCZjBzTGdSdHJvY0poczN1RU5qQ2xINkxo?=
 =?utf-8?B?c2Rxem80cHBGaUt3cGg1UEczQ21TMUxRNkF6REJzQ2kyOFVQU0YwZW95M1RR?=
 =?utf-8?B?ZDdkbEs0TzliWVFrMVgwM3g2R2xhdXZaWmEvNGxyMmswVXFWQWFzeWpuMzZX?=
 =?utf-8?B?VXZFV0ZBWFU2YzV6aHF6dHJldHc3NHJoTTArOVE2VStJVlFJalZ1UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <746DF271CF1B354297233DCAD992575A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde0f242-f655-40f9-24c7-08da4abc619a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 08:36:57.7676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4irZ0TfRxenITXAnN87nsexybg3IMd2UTyhNEAu/yZ9zS2AN6DD/nbi/SbVkPABlUe4tMEOQH7zkgt5KCydPze2Z86HreAm9Jat+UF/wLO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5393

T24gMTAvMDYvMjAyMiAwOToxNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEwLjA2LjIwMjIg
MTA6MTIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxMC8wNi8yMDIyIDA4OjI2LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiAtLS0NCj4+PiBUaGUgY2hlY2sgYXJvdW5kIHRoZSBUTEIgZmx1
c2ggd2hpY2ggd2FzIG1vdmVkIGZvciBYU0EtNDAxIGFsc28gbG9va3MgdG8NCj4+PiBuZWVkbGVz
c2x5IHRyaWdnZXIgYSBmbHVzaCB3aGVuICJ0eXBlIiBoYXMgdGhlIGJpdCBzZXQgKHdoaWxlICJ4
Ig0KPj4+IHdvdWxkbid0KS4gVGhhdCdzIG5vIGRpZmZlcmVudCBmcm9tIG9yaWdpbmFsIGJlaGF2
aW9yLCBidXQgc3RpbGwgbG9va3MNCj4+PiBpbmVmZmljaWVudC4NCj4+IEl0J3Mgbm90IHRoZSBv
bmx5IGluZWZmaWNpZW5jeSBoZXJlLsKgIFN0aWxsIHBsZW50eSBvZiBpbXByb3ZlbWVudHMgdG8g
YmUNCj4+IGhhZCBpbiBfZ2V0X3BhZ2VfdHlwZSgpLg0KPiBZb3UgZGlkIHNheSB5b3UgaGF2ZSBz
b21lIGZvbGxvdy11cCBjaGFuZ2VzIHBlbmRpbmcuIEl0IHdhc24ndCBjbGVhciB0bw0KPiBtZSB3
aGV0aGVyIHRoaXMgcGFydGljdWxhciBhc3BlY3Qgd2FzIGFtb25nIHRoZW0uIElmIG5vdCwgSSBj
YW4gbWFrZQ0KPiBhKG5vdGhlcikgcGF0Y2ggLi4uDQoNCkF0IHRoaXMgcG9pbnQsIGl0J3MgcHJv
YmFibHkgbW9yZSBhY2N1cmF0ZSB0byBzYXkgdGhhdCBJJ3ZlIGdvdCBhIHBpbGUNCm9mIHBsYW5z
IGFib3V0IG1ha2luZyBpbXByb3ZlbWVudHMsIHJhdGhlciB0aGFuIGEgcGlsZSBvZiBwYXRjaGVz
Lg0KDQpUaGUgbWFqb3IgaW1wcm92ZW1lbnQgaXMgdGhlIGVhcmx5IGV4aXQgZm9yIFBHVF92YWxp
ZGF0ZWQsIG1ha2luZyB0aGUNCnNlY29uZCBoYWxmIG9mIHRoZSBmdW5jdGlvbiBleGNsdXNpdmVs
eSBmb3IgdGhlIHZhbGlkYXRlLWxvY2tlZCBzdGF0ZS4NCg0KT3RoZXIgaW1wcm92ZW1lbnRzIChv
ZmYgdGhlIHRvcCBvZiBteSBoZWFkKSBhcmUgc2h1ZmZsaW5nIHRoZSBUTEIgZmx1c2gNCnNldHVw
IGxvZ2ljIHRvIG5vdCBldmVuIGRvIHRoZSB0bGIgZmlsdGVyIGNhbGN1bGF0aW9ucyBpZiB3ZSdy
ZSBnb2luZyB0bw0Kc2tpcCB0aGUgZmx1c2ggY2FsbCBhbnl3YXksIGRlZHVwaW5nIHRoZSBwYWdl
X2dldF9vd25lcigpDQpjYWxscy92YXJpYWJsZXMsIHNvcnRpbmcgb3V0IFBHQ19wYWdlX3RhYmxl
IG5hbWluZy9zZW1hbnRpY3MsIHJlZHVjaW5nDQp0aGUgbnVtYmVyIG9mIHJlZHVuZGFudCB3YXlz
IHdlJ3ZlIGdvdCBvZiBleHByZXNzaW5nIHRoZSBzYW1lIGxvZ2ljDQoodGhlcmUgYXJlIGEgbG90
IG9mIGludmFyaWFudHMgYmV0d2VlbiB4LCBueCBhbmQgdHlwZSksIGJldHRlcg0KZXhwbGFuYXRp
b24gb2YgdGhlIGlvbW11IGJlaGF2aW91ciwgYW5kIGJldHRlciBleHBsYW5hdGlvbiBvZiB0aGUg
dGxiDQpmbHVzaGluZyBzYWZldHkgcmVxdWlyZW1lbnRzLg0KDQpJZiB5b3UgdGhpbmsgc29tZSBv
ZiB0aGF0J3MgZWFzeSBlbm91Z2ggdG8gZG8sIHRoZW4gZmVlbCBmcmVlLg0KDQp+QW5kcmV3DQo=

