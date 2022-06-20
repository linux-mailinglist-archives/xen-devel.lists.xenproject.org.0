Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D956C551553
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 12:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352707.579557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3EK5-0003Vt-BS; Mon, 20 Jun 2022 10:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352707.579557; Mon, 20 Jun 2022 10:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3EK5-0003Tm-79; Mon, 20 Jun 2022 10:07:57 +0000
Received: by outflank-mailman (input) for mailman id 352707;
 Mon, 20 Jun 2022 10:07:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ook6=W3=citrix.com=prvs=16312ba74=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o3EK3-0003Jj-Jm
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 10:07:55 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d86fa552-f080-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 12:07:53 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2022 06:07:50 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6616.namprd03.prod.outlook.com (2603:10b6:a03:389::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Mon, 20 Jun
 2022 10:07:49 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5353.021; Mon, 20 Jun 2022
 10:07:49 +0000
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
X-Inumbo-ID: d86fa552-f080-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655719673;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BrkBczKJRh0JmtNDuH0h2zEOcWlVs8YN2TqqPR5TdIw=;
  b=PLuRfdOvyKFlbXLgEbuAjotuGxMvTeG/pNF3GrHGNyXPuCC6W6YQy2nM
   65BTqYGijOCL7X2llCdsVgnh5J7nKHZMmalZyuzHFKqFxgUXYwZRbLUb2
   P2IBnp1KlmFqzNXT0IhpPPmjK+QzoaX8lD7eN1ZItZK9+uIbSeipsCPAO
   k=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 74405531
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0y3/jKPhR9y1eADvrR2TlsFynXyQoLVcMsEvi/4bfWQNrUorgjNUm
 GAfUT/TOfmDNGH8fdwjbYm1oE1SscLcn9QySAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFUMpBsJ00o5wbZn29Aw3bBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z2
 sQKlbvgVwIVA6DtkrkfCkR3NwckFPgTkFPHCSDXXc276WTjKiGp5so0SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB4H9afHs0m5vcBtNs0rulIEezTe
 Iwybj13YQ6bSxZOJk0WGNQ1m+LAanzXLGEE8A/I/vNfD2777CFxjYKyavvuftWAYvlppXuX+
 CX08DGsav0dHJnFodafyVqum+vOkCXTSI8UUrqi+ZZChVyYxmUXThoMR1a/ifCjjwi1XNc3A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52mlyKDZ/gKYDWgsVSNaZZots8pebScxy
 laDktftBDpumL6YU3SQ8vGTtzzaETcRBX8PY2kDVwRt3jX4iIQ6jxaKS8k5Fqew14fxAWuon
 23MqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgPpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:pqjpTqs1VwdA4Um+fhktBU+B7skCL4Aji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPuftXrdyRGVxeZZnMTfKlzbamDDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjIzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIO/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfqWG0hYczBgNkGmpDq1L8Yqq
 iKn/7mBbU015rlRBDxnfIq4Xi47N9h0Q679bbSuwqfnSWwfkNHNyMGv/MZTvKR0TtfgDk3up
 g7oF6xpt5ZCwjNkz/64MWNXxZ2llCsqX5niuILiWdDOLFuIIO5gLZvin+9Kq1wVR4SKbpXYt
 VGHYXZ/rJbYFmaZ3fWsi1mx8GtRG06GlODTlIZssKY3jBKlDQhpnFojvA3jzMF7tYwWpNE7+
 PLPuBhk6xPVNYfaeZ4CP0aScW6B2TRSVbHMX6UI17gCKYbUki94KLf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwb0BciHzPRwg2fwqaWGLEDQI+1lluhEU+fHNcvW2AW4OSMTutrlpekDCcvGXP
 v2MI5KApbYXB7TJbo=
X-IronPort-AV: E=Sophos;i="5.92,306,1650945600"; 
   d="scan'208";a="74405531"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbPoLwKKNm6tfSOWPHXDaZVU5FOY5C6WdVaN1Ly6uA2KsJKwCx4a4b0ncSgXuEqlZHG03HD7NXnEEMRM3olVy4Tp86fWh0LLiOdi5rQpbhg/yo+aqESxxlVI2NsuyvoVHMjYWDkmJIIzWkKWauXmtEZgG0ED6yXWSBRKKzVPIvVp/BqOgBsariWm6wbJ2eb+C7mP499UT11LaEncDV2HO+30bBrub932G4/0UKnV7RiBQGGL9kAFQzeJhY+/vl+gHwT9lqvYtpzF9xhHvvAYMaYPcTAABPXMSiKqbdVBO45DybJ6BVrUu561kdb6BOSJPWGtVII+222e34EIR031nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrkBczKJRh0JmtNDuH0h2zEOcWlVs8YN2TqqPR5TdIw=;
 b=JM/U0dmw8kdZwOJ6rWULDlM6WIqv8H+kLgCSaNX6dYdUodX2Zssf0LugYrLZX8+UOa+H8mzkEpPKUeBy93P3lV0DO+703Em75O/GOXt+TRJKg6dCURC8SBgy7cJkqBNdA1Rs50ZSqlpKwZ6Oy3Na7F8Rep0vOzo+IzC5ohwxcMdlan8/Bft/hDEygQ4LToTzkagk44ayKozDN3DqbGl19N1mEHqxqBEHeAsa9du7KyXdQr7CczwGLC5XjYlbPj9PXc/so08yWo2cbHnHVtIy24/kxe/zv2Ng5bgN9zmCOO9fBoIL75rCHzLYkeKSDSWPSKbDivJyDWXZmJEiF63nFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrkBczKJRh0JmtNDuH0h2zEOcWlVs8YN2TqqPR5TdIw=;
 b=dfrod0xfE8s2I5LjcG07l3hsXtGEluyEALW3NUZG5yhpwSUa1qfaOktAebf6KGrJHgpIwaPnCFfuWsoxJOggZhVIJWqYMaz1hxUvT7ETdv2eTYjxA4EEAEYqAfyVUzwNL8oIgc6jS7vRESf41VJt3momWKYfx/agZJZOk9C6q3Q=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 5/9] include/public: Use explicitly specified types
Thread-Topic: [PATCH 5/9] include/public: Use explicitly specified types
Thread-Index: AQHYhHPXhH2gjwLhME6AOejjpMzR0a1YDrCAgAADlwA=
Date: Mon, 20 Jun 2022 10:07:49 +0000
Message-ID: <72e0814f-bae5-ee08-a0bf-ffbe64e42886@citrix.com>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <20220620070245.77979-6-michal.orzel@arm.com>
 <e91f6bd2-271c-12c1-ee7e-bea3d74c8beb@xen.org>
In-Reply-To: <e91f6bd2-271c-12c1-ee7e-bea3d74c8beb@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82a3b933-0fe9-4ac7-2de0-08da52a4bb11
x-ms-traffictypediagnostic: SJ0PR03MB6616:EE_
x-microsoft-antispam-prvs:
 <SJ0PR03MB6616287B4B4CBCF176697648BAB09@SJ0PR03MB6616.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 //qitLjOUfTnJiTEaAKv66v/VbW49g+IMY1l6ZkslkDYnsAk5944DsA0cPmbkXmNhDTZH0uiq1aLZQa+MmNNxTC8v6A+iNy7pvSKFjXZBAkKqYH6ISI8T2RoeP19NRzQ8nkqJwTE21UQt4Xf3upKc3qGIvgtvd3UQ1ry9r/59Bf8m5I1iNRRar1lCoiNpBF2+1yWCBUIl7165O4xB+i4ROYvX3MaQMhpryvYkogo1n9oakfKc5PdNiPvdChtpyjfSSmenQ+XtbAy+lqtINaVVHLpTc0ykz5hVCPxvNxpj3PXDtvj3gaH36ibbftOdboUGt72gCvAcp3a0ziAs0OZnmqOayBh4ugSheyQLRCGpu7N+RbAVOEk6kdjf3T5ex+tBI1Pnniu9i4xnrMEMD920KbhsXE60IE/RGGqN39EW5C2YJszl9VHmnIjN8WCVRXsbwq2kZz5RN61w6XNyoKthzJTLXXy9DmVJ4EO+RFFJcBm3Glm6kbFUpXlxN4iKydeUXPwvkIvGNLDUPEdXxnUD22crrHaXNN21ir/PmNJAlI58ggmrFtCk0tOAwG0jZ8HJxtzP1JRhZY7bZOS+UNWIhOs65j68z7ySIprTna7QtUNdhrIZEITO/fjDs8tgFZ2ak0GAecew4WGY4Rl242TsQnNqa4C3cxFt0mEl5zPXaqmKhK3xm7gq1CvzuWGdZPBI0AsTWYRihMa1hkj1RCWgtP5J+C+5N1SRtegmK4uk+Cx2lSYgaMwopncgI6jZtb+1YDStE/1YCrRqk0sU7eTPQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(186003)(91956017)(26005)(66946007)(8676002)(38070700005)(4326008)(66556008)(76116006)(4744005)(64756008)(66446008)(66476007)(41300700001)(71200400001)(54906003)(5660300002)(122000001)(110136005)(86362001)(82960400001)(478600001)(6506007)(2906002)(36756003)(31686004)(38100700002)(31696002)(6512007)(2616005)(53546011)(6486002)(8936002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dklKRnJsWmNYNS9PVmFuclAvNW1mSUJ2ZStQWmVSMlBNSk9vTnZLUUVyOUNz?=
 =?utf-8?B?TWEzWVBpT0IwMDBneHZYZDQrUjlBb1ZlZ2Z4dDZSRVU1UGhwQWgxSUZKcjF3?=
 =?utf-8?B?MjRsOG5kWk5zYlVJYzNNbTlPcG9WeWNYSG5SS25BRTBEVkZwWmgxVEVZbXR6?=
 =?utf-8?B?d3JjcHJhdG9OV1JYWjlZRVJwY1ZaSXhuYUhqOXU2RXpWQWpBTVllc0hrWXZU?=
 =?utf-8?B?Zkp5WnBxcWFCWHZwMm82azhTM2llb0RBaGlmSHhTSXA1RVo0blhIL090WjA5?=
 =?utf-8?B?bE05dVJOTmxDVjhKSHA3WTJodkNMMTBrOEx0TXhQck10ZWJpMVE1M0JvVUI3?=
 =?utf-8?B?MHNyOVlCaHdlN1Vqb2ppNzdsNXdSdnNqQWpodmxmNjFzOEdQR3B6eWg2VXBT?=
 =?utf-8?B?Rzg2N3ozTllMVXFYTnZGL1YzNFBxVm9EbUhFMzVXTTNMUjlJVHh6SmhUemNo?=
 =?utf-8?B?UFRZdmxsaUEyTkorNFNQZEo2ZDFzY2J5dldFeXVqWktCdVhYczVMTUxyeExq?=
 =?utf-8?B?RW1lWEUzbE0wR2RSL3RRNFoxVzFTQWs4UnBmdDlXYS90WGwreEdvdEorcXlZ?=
 =?utf-8?B?a080ZUQ2YWhqbXdqVU1RYUpVMyszN2dBZkJSdWpFVzNIR21aZStTZnE4V09L?=
 =?utf-8?B?RG1VdVM4ZFllSk1XMzJWZkpkSnoyMFB4QmlNR0JxNEZKLzc5L1dNeG9kc1l6?=
 =?utf-8?B?RURGdmt2a0NKM0U1aDBsa0d3c0JiRGF5Umk4dUp2SGhDbDFJZFM4WkNJdzNG?=
 =?utf-8?B?Y3VxLzlnOXdDSk5WL2p4Qkd6dEVSdWlqYVh6RFE4WlJJY2x0SXJBMmltRDh0?=
 =?utf-8?B?eHlIV0hRTjZCMk11TW9keWtOaEMzUGN0YlNLWGdxNkVpaSt0Q05jU283MnNV?=
 =?utf-8?B?cFQvQWFYL3RQWDQ3aGJTdVdYbCtNVENGSHhFdzN6dGM1aGM1T1VGcDZTVDBJ?=
 =?utf-8?B?N3pXUTRPL3V0OFNYN1k4dCt1aEh6TUx0bFNEcXhjaXRwTkF4dUdGMllSTEYx?=
 =?utf-8?B?bkwyMzlBV3dwSExJOHduM1YrZVVCdzN5elM1MCtPdjZqSDNrUGVha3c3b1Jh?=
 =?utf-8?B?VEdreDBGSk55Nm96RncvZ3l3WFpKa2JBeTJjRlp4bnlEZ0NWM1RDUjRBM2pK?=
 =?utf-8?B?OEt4L3RGZkZ5cEZXVUIvcGpiQ1Z5bFNaU3dYaHR2MVJDUDlvYW1SNWpKU1hI?=
 =?utf-8?B?bGdFSVFNYnVCbFYwYUJmZmtUNStWWXhVeFN5RkFLb0orQWJRbEVoMU5qaG9J?=
 =?utf-8?B?Z0k4bXkzUmRyK1cwaFhqSFQwWU5qYit1SUZaMHIveENJVjVuNlp0TWJqVXZo?=
 =?utf-8?B?dzFlOHMxZVU3SllQTzlwdEdHV2lvNlh3d1Rsck1LdUo1Uk5Mc0cyRWZxczRo?=
 =?utf-8?B?SVZ0UmpkcXNKNURFSHpseGtHSk9jODlyWmVieC9iUWNxUnRTNE1uU1V5Visx?=
 =?utf-8?B?RXZnUmM5eENzSTBwbmNwdWtGVXpobmlscHRzT3hiVmtFTDEyMk4wb0w3UDRy?=
 =?utf-8?B?UlRoQ0ppR0Rmd0NMeGNvQjhHaTZRS0lzNFdYQWhPWVhmajVQUVBrQVJqZEE0?=
 =?utf-8?B?RlJmQ2hUMXo0d3BUVWVBTU15OGZER29FZVZ1Wk5BNXFxM0V2L0tlU2NJZGZF?=
 =?utf-8?B?RXZ6bkxRU2FqQTdIMlVjbzhSNW5FMExJMUhyWEU4MHN6dnVGZHRXd0VvSFZW?=
 =?utf-8?B?UmVZdDR1N2lTKzlCMU0renV2WkQ5OWk0UnZuN3FhYlBUUlVwdVd5TnJZMGFS?=
 =?utf-8?B?eHRLcTNDUVMvbEV3THlkTlZaM3JFR2FpY0dPbk1ob2lURUlyMS9PQUFXRytt?=
 =?utf-8?B?NkFvMjhDVkxocGYvZkRod3ZHMnh2ZEVIcHdxeHBDQ0VkdHladEhvdjAxUWVD?=
 =?utf-8?B?SGYwTmZnVHd1a3p6TE1HVUhRZXdaR1lJa0xQcjdIQzYvQ2lsMFNObUNtd2Ew?=
 =?utf-8?B?NUwydkt4a1VnMVB6cmxGR1B6MFQzbGlLSlc5THlJOEcrc0RuYUhRWHNjOXdF?=
 =?utf-8?B?NkUxemNrVHlrNEZoWkNtSUVYQUFncVdSb0JmTDhSdFIzdmtlLzhScFRKUG5Y?=
 =?utf-8?B?ZUhtQVRNMWpzOHdabWYzbGM0TVZ5dWFMZ0JBM0ZEVmozUnNiVHZCTVlnTzJz?=
 =?utf-8?B?TEdBN0JaMFRPeG1ubm4vOWREWDZEV2NTK2V3OEFabi85Z3hFNEhRRmpDT0hi?=
 =?utf-8?B?d3U3WmQ1bDh4bG5PZEZScDhNditucm9ZdnRwMW9rQjM3WVFnRy9qbmJJUytZ?=
 =?utf-8?B?M3hGQ01RYThTWXZZUVprVUN4R3lNeEdMM3FyeFBkRHhDWkFhSks2NHZYaWll?=
 =?utf-8?B?cms5TWJYMEhBVm9JOFVvYXlWYjkrYkFmeG43am1Ra2tScWJyVWp6OURGSVlV?=
 =?utf-8?Q?VUqGBlZGdCEYC5zg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DFE223740ED46409A2EEA5B9D1DA5C7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a3b933-0fe9-4ac7-2de0-08da52a4bb11
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 10:07:49.2769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r3IB6Inu5OABE2QWPdsDIZOoCYlb8i9tXjsBDw+8OJe3c82qQMQ512lkC0xks6aiL1kdxnwUXsRkPEfezZe1qWEsHqLM5TA6zQB5i1WpkU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6616

T24gMjAvMDYvMjAyMiAxMDo1NCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBNaWNoYWwsDQo+
DQo+IE9uIDIwLzA2LzIwMjIgMDg6MDIsIE1pY2hhbCBPcnplbCB3cm90ZToNCj4+IEFjY29yZGlu
ZyB0byBNSVNSQSBDIDIwMTIgUnVsZSA4LjEsIHR5cGVzIHNoYWxsIGJlIGV4cGxpY2l0bHkNCj4+
IHNwZWNpZmllZC4gRml4IGFsbCB0aGUgZmluZGluZ3MgcmVwb3J0ZWQgYnkgY3BwY2hlY2sgd2l0
aCBtaXNyYSBhZGRvbg0KPj4gYnkgc3Vic3RpdHV0aW5nIGltcGxpY2l0IHR5cGUgJ3Vuc2lnbmVk
JyB0byBleHBsaWNpdCAndW5zaWduZWQgaW50Jy4NCj4+DQo+PiBCdW1wIHN5c2N0bCBpbnRlcmZh
Y2UgdmVyc2lvbi4NCj4NCj4gVGhlIHN5c2N0bCB2ZXJzaW9uIHNob3VsZCBvbmx5IGJlIGJ1bXBl
ZCBpZiB0aGUgQUJJIGhhcyBjaGFuZ2VkLg0KPiBBRkFJQ1Qgc3dpdGNoaW5nIGZyb20gInVuc2ln
bmVkIiB0byAidW5zaWduZWQiIHdpbGwgbm90IG1vZGlmeSBpdCwgc28NCj4gSSBkb24ndCB0aGlu
ayB0aGlzIGlzIG5lY2Vzc2FyeS4NCg0KWWVhaC7CoCBObyBuZWVkIHRvIGJ1bXAgdGhlIGludGVy
ZmFjZSB2ZXJzaW9uIGZvciB0aGlzLg0KDQp+QW5kcmV3DQo=

