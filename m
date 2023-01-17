Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE9B66E84E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 22:18:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479832.743910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHtLB-0000iq-5H; Tue, 17 Jan 2023 21:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479832.743910; Tue, 17 Jan 2023 21:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHtLB-0000gl-2S; Tue, 17 Jan 2023 21:17:57 +0000
Received: by outflank-mailman (input) for mailman id 479832;
 Tue, 17 Jan 2023 21:17:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHtL9-0000gf-Rf
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 21:17:55 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66d42822-96ac-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 22:17:53 +0100 (CET)
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jan 2023 16:17:50 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5442.namprd03.prod.outlook.com (2603:10b6:208:291::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 21:17:48 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 21:17:48 +0000
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
X-Inumbo-ID: 66d42822-96ac-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673990273;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NJKwbt51lAIQ5yBjh6WMmX6f7pvIIpA15gy8NIXAXMQ=;
  b=YnLZYUVBobtUpP+4TQA3fFtbZPUB1kxu+Z9zbo0va1YhbzdMmGFQTD/b
   4zHD9HxlFEv52dZRXXXmYnOlR7emXrmSGR155vexUous6wyi6mjm+GpZR
   cQBytEoZS9y/wlNaGsgD3ef6RzYrc8qr6brSycpXVyUlDOZ96P08okTWr
   M=;
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 93100853
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:u4t+GKhev10Nkq4nsaBAACBrX161qhEKZh0ujC45NGQN5FlHY01je
 htvUDqCaPmMZ2TzeNgiOd6z9k4BsZTTx9Q1HFZo/n82Qiob9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5QaBzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ7Iw5VXDCStdvr//Wxe+Y9hu0kIefCadZ3VnFIlVk1DN4AaLWaG+Dv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluG1bbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6RebhrqY63Qb7Kmo7Ki1KbFWnvMWFq0uDRolHC
 lFM3nQIsv1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+WsDezNC49PWIEIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 FiisywWl7gVy8kR2M2GEUvvhjutot3MUVQz7wCOBma9tFohOciiepCi7kXd4bBYNoGFQ1Kdv
 X8C3c+D8OQJCpLLnyuIKAkQIIyUCz++GGW0qTZS81MJrlxBJ1bLkVhs3QxD
IronPort-HdrOrdr: A9a23:PX/DcavC8yYv55/FLR6GL87u7skDZ9V00zEX/kB9WHVpm62j+v
 xG+c5xvyMc5wxhO03I5urwWpVoLUmzyXcX2+Us1NWZPDUO0VHARL2KhrGM/9SPIUzDH+dmpM
 JdT5Q=
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="93100853"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wz62AltO+8ziIU9ONWiHHk99476slIL96X5He1iufQnV/90y4eRgS/zY6xBqBRFSLoyJJNnQ0iUeUanQmEERxgev66hwfr0LkDbcmtR4HrkM/O+Iwk/j5wJmRaT3nteWxvQ/THOlEqe59UytCrGbmY3IsCSAwveFm7ICK3s2/YPYQAh+jMuy9Erz9VZ+lUNJF4Q3c/3oix+N5x+VmuhYTRFyB/ysu1lyGc+rIica6HorkIXzYVhIF9W5mSd5c5V2ORfWbSis8mD5SINPQLOVjGriZpNrvWVISeOA+oWUdtS0L3wqPlReYn0bYVw2tLgPjRXsXHwjHtnKiNnEOVxQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJKwbt51lAIQ5yBjh6WMmX6f7pvIIpA15gy8NIXAXMQ=;
 b=Ddrp3gmuRLnTlrqO5qeijHikWcQTaCXGhVvkPlcJEB7UhsSQnaHVzIkNu3n1UmTd2VrQruZbSSDNGwerSfS4PrAGCZGY7yMlBgeGnyYwhztBIl1LQvsWKHSoGnifqP4u4n+5/PNTyDL14WL4Jjb8oHKKoeLQkLYfxkwpu/W9nMSsK/XIMLI4o6BshxrBIfOeshDu0ooDd3trHfEuG0lh5K8ecvY9fZm3um7HxM0vMW7xdfyH/w3VHiJNbeSCNw9tZwbeYcOAESN2BJhJOhwTfmaDT6RIdDPEjdBdbp2zePplhR73gKdAoC4t9B0sWxl5KrrOwg5o5lL0rCZSZ0JiKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJKwbt51lAIQ5yBjh6WMmX6f7pvIIpA15gy8NIXAXMQ=;
 b=QzpLl+NYzPKDpTxadPXcAy8uKxwGCFBM75btAYXHeTrPKA63UO/9jEj5rwEiGcZjRufA1K65ARLFRwIAhoZYiB7MKdSJ43Wp6B++xgdwzDUgcS7cTNxlhH/ADccFPy2QjSnvkl4vR1L4meEiWkRqulD/d3s03LfiZ1/Ai4Fg5zo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Subject: Re: [PATCH RFC 03/10] domain: GADDR based shared guest area
 registration alternative - teardown
Thread-Topic: [PATCH RFC 03/10] domain: GADDR based shared guest area
 registration alternative - teardown
Thread-Index: AQHY444WbZhuHDQ41k2+L84eJy1YfK6jqy6A
Date: Tue, 17 Jan 2023 21:17:48 +0000
Message-ID: <8d002c7f-a532-e8e5-0a71-801af4712d47@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <214c9ec9-b948-1ca6-24d6-4e7f8852ac45@suse.com>
In-Reply-To: <214c9ec9-b948-1ca6-24d6-4e7f8852ac45@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5442:EE_
x-ms-office365-filtering-correlation-id: 6f62cd35-78b3-4b20-9a81-08daf8d048bd
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pkZ2buP88hjnVFFSPc1zUU3rDibDY/1RcGg0ZK97D84akspEGxFMu/tttu1uUTBYHkf/DNIHhwSv1+TRuxHG7m8slIBqLLAgWHKHFoXJ29/dbUcskMuhOml64cYOGASFOoOm/gSOOrDPGLmJETmuidIyELRJG9+5y51SXkwzEci44DZ+tdxgmf35FZteCci0G+vt/E09tqmha/KShO8mxlU83ffXlUYFdSublhSWK2BUWh7XMbWwD50PvNszME4Eiy2IxyC9NoUpzM6uii3FPDNwRs9DJ2x1r0XsmPgVEQZJV943ak5ohPvD+3rPwXAUDuUhvR1UkR6XdI6lUxDkACgB4+l9u71Bvs/IOmrHOLbeR3DHeIU9putUrpixRE7+xnUAncmi60m5BfzPIy5k9ZHA0cm1o38um4Hlezs3+LNgogb+csbxpnZQQ6lDrI6h4UMqcxu6SSk3ZhesZlKrXe1s6jJmrxrrHAJTOFZkJGGQ/9qrX/bgwo5sI/EFfLh6V3mE4t3iVpRUIJF1AZ4ShpKUkEppdr4UBWs+5eEDljnhLAdsdUyL57nu4pisETUf9BjYVslX5Qt5LMbQgbU+EjrDLF9CqWo9KkCal8bmBVVys3vcNHxJ1bHw8nezRU/WNPr4WlRF3eusZXPYw2MIdcl42nn1oszx4USMqmOzjU7Hb2GrI5bKcnA1EBX/kWK029/19nD7/5aULc6DT6S7zf7c6Qtbx2vsUFnWpkStWom97kmlbyFKDKMVA/6NGGRwJf0K4nYrHL2rYKKBAYa3ww==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199015)(26005)(478600001)(82960400001)(41300700001)(6486002)(38070700005)(6512007)(66446008)(38100700002)(66556008)(71200400001)(186003)(31696002)(316002)(110136005)(54906003)(2616005)(86362001)(66476007)(66946007)(76116006)(4326008)(53546011)(5660300002)(36756003)(107886003)(6506007)(2906002)(31686004)(83380400001)(91956017)(64756008)(8936002)(8676002)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VEtsR2FJa1VxWkhReHpUaXJwYkRHa1ZNL2h4dnArcXZxUXh4MDRkNjh3dDdV?=
 =?utf-8?B?Yy9xMzB1ZDNoNUV5VXYraGN2eGJ1RjJ0c3BHOEpCaHh2eC9yNngwU3JRbWlz?=
 =?utf-8?B?Wkw4eFJPMFNidlZrWWNNV0lCc3NHVzJUK3VlY0dJS0V6OC9NeThKT0cvSGhL?=
 =?utf-8?B?SE11Z1NQR0ZmaUErcVdmQ1JzTHVSTmp1Qk1UU05iOXNKcGdZTWJvZkE1THBB?=
 =?utf-8?B?RFVkZHFVdExJRTNXVVJGTHRkLzlNUHVYMDBlYjBMN3ZGU2tyRHJPMCt4cUNU?=
 =?utf-8?B?K2Jmenl4VHVkMlZ2QjFQbmFFUWVmejdydllYdEZHOHJveExpbk9XVnc2YW12?=
 =?utf-8?B?Qm9FdmhNUnRsTWZ2dXhaZUFhKzU2S1VmeThvSnJQcncwcHJKVVQvWVZsZ1Nl?=
 =?utf-8?B?WWpJSXZuNlhSU3lPWHJHL2tibHpWeW16MW16d1RpdlVteDBYVUxodWtualNE?=
 =?utf-8?B?WTllWHhJeittKzRHbVBpeXg0M1FWZmQ2enMvcFp0cWx0WmVHRTYxcW1GUmk0?=
 =?utf-8?B?cU0yR0p4YXRwL0RBeUhBdnRKdW9OcmlPUkFqeFh6aFcwcW5hWTRIUmU3Mnln?=
 =?utf-8?B?TGhRM1FlVk55cHJEY29wNXR3S3YxN1NiT3lvc0F1UHd4d1lXWjFtRnh4Z2tV?=
 =?utf-8?B?b3JFN09LbEIyS1UwMlZBMkxkOHdCa1plcW5Jc2R6dXNiMzZJWnc1QXhHeUg1?=
 =?utf-8?B?L2pDdGJGVUJyd3NpM0tJMFZCb3FIU042YTVOQ09uWml6NTV3YUtkN3FXUHVn?=
 =?utf-8?B?TzJqMklBVWtsTW5HZS9pRzROWURMMWpJS3VNYi9VSUNzN053Vnptc3VHQW9I?=
 =?utf-8?B?dk5TOHZ3d1lLOEVYU0Fwa09zelFZL3NpaXZaWUlVd0ZYVnVVbkJDZk5QanVB?=
 =?utf-8?B?dkhoM0VXSHo3SG9uQkh5a2xtb0ZRMm9kQlh5ZE1SbUtsWlpHVXNlWkF3N3V1?=
 =?utf-8?B?ZWFreUlNV1g5RVlDcVBZOE5LemVyN2YrSUFFWHR6VmdmKzljODFpZ1UweDJZ?=
 =?utf-8?B?SG9ucjFLWFJ1RXYxK2VvWWRVSFExRzRwYnRlKzZuNXZDajhGWC9mR1hLdTV5?=
 =?utf-8?B?ZnRZd09SMHhzRUJVOFpvU0J3TWhZRGJCWUVzcW9XWW44VHhWSFU5TjljR05Z?=
 =?utf-8?B?Q0lFRlk5eHk0U1dBazdzVEc0cDNaNUlNbHBERWt5OGRmK3R5NkpyM2U2RDlX?=
 =?utf-8?B?SXVRVEYyZm0yY2w0N1Y3NXNPZUdPVFJlVWZucWxKYk1CSGlPcFVoUlQ5cjNV?=
 =?utf-8?B?Q0xpeUozREZpajA1bDExUVozenRycGxkS1JKUWdSSGF4dXVDeTZzUVVYN2FK?=
 =?utf-8?B?clNMMEhRb0lBTzRuRS9NTDFsQ0pzYkwwcU1oZXAzVnlYMmhqWGJyM014dlpB?=
 =?utf-8?B?U0F5eVpVRi9JUWV1UWRRWmVvYzkwRzEza0hLQUJMbUxDaWJ2VStPRld5SnVm?=
 =?utf-8?B?TEl0cEZDRmp3OVorUXB6c0F3Zm8xZGJjVVJnNU1iaENMMUlUQUFET0ZxQTAz?=
 =?utf-8?B?Zm5LVEpUN0l0QkxQOEN6NVZLZ3RJUXhmWnNPb2JDeU9NWm93dTBBNXdXNStQ?=
 =?utf-8?B?Rkt3VVFDcDdrMlcyVFdPM09UT25CUWE3dzVlQ244RWtXclBzenVDeWRJcHFo?=
 =?utf-8?B?L3I0VFJab2tFRXFPTlJLTUlTWm1RVUduK3FsbXVvYXJHQjlZakZnZkREK1la?=
 =?utf-8?B?RjFCcjU2dVlTc2xxWGZ1U0VESHRZbmpSNE02ejdHYVFyQm84eDlUSTVFbWNl?=
 =?utf-8?B?ZE4vbHRTL1c3THRhUk04UElDcTQwd21YOVBXcmNvNWlpOEFXcnhINkFWRG5X?=
 =?utf-8?B?S1E4YkpXR2hXYlRhVTR0Zm90d3JFbEtFeWt4YnhCYndIZHJKVmJ6eDNDc3h0?=
 =?utf-8?B?RWpPRG04dVhLUWR6dzJQVFE2TXNLTHRWMFp6N1RhUXhsQWNRVWF5eFFFWjBK?=
 =?utf-8?B?OTFnSHQvdzFnc1ZwVGZxN2dIUFpkUXYwdktFNTBFTUtNYUlEVU1wOC9CVVR3?=
 =?utf-8?B?RWlGUGJvcmxiMUUxb0dyU2lIdjNkRU5uOUJtZi95OHMzZEhEcnVhQk9GdUp5?=
 =?utf-8?B?WjNoRWlxMFhtMnR2U28rMGxuT29jSC92L0sxYit5SlJvMGVaVnU3NmUxdmVH?=
 =?utf-8?Q?YNb0Yp0fSHyQGZZn1tB8dk6iZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BE696DEB5DA93409095A4AC0137A143@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	446ypXTtGwmsUC3saUsFquJUoo63HoLNv2GAIxj2L1sLydO59kuUrMFTkXnydkixdjq44xK71TxeLISPVCuCxrUY0yYqPa4U+kemqSpGZKqqesMn+ji/+Sx0xSarVjL7dwAigWRwELS1pRq1wqGNobGGrpwR+9zhaZMiEjRTN0F0C9q+d0BDfHuozqXsWYw2Q/mFkeE6HIJHtWNKxx7DUupbATKDMjuAxfId6OEFDs4CBhQX12HG7TimrwtT9yD0w1ktHqKYbx8f2Bg6XKRekrNJ/kve6PykQhZ/S1DLXIVk2YgFRuI/INi+SiINbCWKVwVqEP8IJj6LsgC1fHR2ghpZhgxNUnBLtT2GBXVrt4kX0ryi5WfdkLl1IV5y7uWZhNUoBcggsfiENEAVBCEq9lTHz9s7jPlPdtnsQ79QDOI1nG8kd3969S0+49a+RHtEKG+KqZKVOr5oJPxaAMscgFUEUgszTMy+/Tp0jq4sHI6oaHyTw+raGBkXR9OkNbc2bn4io7nVcIEmYcFnmcg4cBkrWBKeGrgzzGdb85tKdUtQLURo9hGRJ7EuU7ZIFPU74yDbRoehbqXVqbHNnEfI2nUgIA97pFem/BHjOCjl/cBhz4mw4bnn19BioDtaTY+cZqVdA3k8b9Zi5epgSUGzIC3GVamBu2iilR2bTqBWech+iPsF/J9/l7zvzycw9kjMyMQPsYpaQKBLpjDew/4obUfbIRKdZB48zdZ62poFhFpwkffTssVHlAet3gF5rE87unkyto9gYLEcQqm9bKHfndHMD3B8VKUx7wqT5KQ39LBQxLiUpfRNlyLnEmRkUApQDa0vOC46j+PbjSV7H7levpz0QtuhAluvRaDwTAvZh68=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f62cd35-78b3-4b20-9a81-08daf8d048bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 21:17:48.3149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0FKC8pv8WtvSdeACF5MTerInfZ3ECLMiltONxX56E4hqcYfDSVeWlf1KWtL43IxAkc+wYdmUuTZa5rdcpbRrn8vO/4oIbNzt86G0iEBPFoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5442

T24gMTkvMTAvMjAyMiA4OjQwIGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gSW4gcHJlcGFyYXRp
b24gb2YgdGhlIGludHJvZHVjdGlvbiBvZiBuZXcgdkNQVSBvcGVyYXRpb25zIGFsbG93aW5nIHRv
DQo+IHJlZ2lzdGVyIHRoZSByZXNwZWN0aXZlIGFyZWFzIChvbmUgb2YgdGhlIHR3byBpcyB4ODYt
c3BlY2lmaWMpIGJ5DQo+IGd1ZXN0LXBoeXNpY2FsIGFkZHJlc3MsIGFkZCB0aGUgbmVjZXNzYXJ5
IGRvbWFpbiBjbGVhbnVwIGhvb2tzLg0KDQpXaGF0IGFyZSB0aGUgdHdvIGFyZWFzIHlvdSdyZSBk
aXNjdXNzaW5nIGhlcmU/DQoNCkkgYXNzdW1lIHlvdSBtZWFuIFZDUFVPUF9yZWdpc3Rlcl92Y3B1
X3RpbWVfbWVtb3J5X2FyZWEgdG8gYmUgdGhlDQp4ODYtc3BlY2lmaWMgb3AsIGJ1dCBBUk0gcGVy
bWl0cyBib3RowqAgVkNQVU9QX3JlZ2lzdGVyX3ZjcHVfaW5mbyBhbmQNClZDUFVPUF9yZWdpc3Rl
cl9ydW5zdGF0ZV9tZW1vcnlfYXJlYS4NCg0KU28gaXNuJ3QgaXQgbW9yZSAyKzEgcmF0aGVyIHRo
YW4gMSsxPw0KDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4NCj4gLS0tDQo+IFJGQzogWmFwcGluZyB0aGUgYXJlYXMgaW4gcHZfc2hpbV9zaHV0ZG93
bigpIG1heSBub3QgYmUgc3RyaWN0bHkNCj4gICAgICBuZWNlc3Nhcnk6IEFpdWkgdW5tYXBfdmNw
dV9pbmZvKCkgaXMgY2FsbGVkIG9ubHkgYmVjYXVzZSB0aGUgdkNQVQ0KPiAgICAgIGluZm8gYXJl
YSBjYW5ub3QgYmUgcmUtcmVnaXN0ZXJlZC4gQmV5b25kIHRoYXQgSSBndWVzcyB0aGUNCj4gICAg
ICBhc3N1bXB0aW9uIGlzIHRoYXQgdGhlIGFyZWFzIHdvdWxkIG9ubHkgYmUgcmUtcmVnaXN0ZXJl
ZCBhcyB0aGV5DQo+ICAgICAgd2VyZSBiZWZvcmUuIElmIHRoYXQncyBub3QgdGhlIGNhc2UgSSB3
b25kZXIgd2hldGhlciB0aGUgZ3Vlc3QNCj4gICAgICBoYW5kbGVzIGZvciBib3RoIGFyZWFzIHNo
b3VsZG4ndCBhbHNvIGJlIHphcHBlZC4NCg0KQXQgdGhpcyBwb2ludCBpbiBwdl9zaGltX3NodXRk
b3duKCksIGhhdmUgYWxyZWFkeSBjb21lIG91dCBvZiBzdXNwZW5kDQooc3VjY2Vzc2Z1bGx5KSBh
bmQgYXJlIHByZXBhcmluZyB0byBwb2tlIHRoZSBQViBndWVzdCBvdXQgb2Ygc3VzcGVuZCB0b28u
DQoNClRoZSBQViBndWVzdCBuZWVkcyB0byBub3QgaGF2ZSBpdHMgc3Vic2VxdWVudCBWQ1BVT1Bf
cmVnaXN0ZXJfdmNwdV9pbmZvDQpjYWxsIGZhaWwsIGJ1dCBiZXlvbmQgdGhhdCBJIGNhbiBlbnRp
cmVseSBiZWxpZXZlIHRoYXQgaXQgd2FzIGNvZGVkIHRvDQoiTGludXggZG9lc24ndCBjcmFzaCIg
cmF0aGVyIHRoYW4gIndoYXQncyBldmVyeXRoaW5nIHdlIG91Z2h0IHRvIHJlc2V0DQpoZXJlIiAt
IHJlY2FsbCB0aGF0IHdlIHdlcmVuJ3QgZXhhY3RseSBmbHVzaCB3aXRoIHRpbWUgd2hlbiB0cnlp
bmcgdG8NCnB1c2ggU2hpbSBvdXQgb2YgdGhlIGRvb3IuDQoNCldoYXRldmVyIGRvZXMgZ2V0IHJl
cmVnc3RlcmVkIHdpbGwgYmUgcmVyZWdpc3RlcmVkIGF0IHRoZSBzYW1lDQpwb3NpdGlvbi7CoCBO
byBndWVzdCBhdCBhbGwgaXMgZ29pbmcgdG8gaGF2ZSBkZXRhaWxzIGxpa2UgdGhhdCBkeW5hbWlj
DQphY3Jvc3MgbWlncmF0ZS4NCg0KDQpBcyBhIHRhbmdlbnRpYWwgb2JzZXJ2YXRpb24sIGkgc2Vl
IHRoZSBwZXJpb2RpYyB0aW1lciBnZXRzIHJlYXJtZWQuwqANClRoaXMgaXMgc3RpbGwgb25lIG9m
IHRoZSBtb3JlIGluc2FuZSBkZWZhdWx0IHByb3BlcnRpZXMgb2YgYSBQViBndWVzdDsNCkxpbnV4
IGludGVudGlvbmFsbHkgY2xvYmJlcnMgaXQgb24gYm9vdCwgYnV0IEkgY2FuIGVxdWl2YWxlbnQg
bG9naWMgdG8NCnJlLWNsb2JiZXIgYWZ0ZXIgcmVzdW1lLg0KDQp+QW5kcmV3DQo=

