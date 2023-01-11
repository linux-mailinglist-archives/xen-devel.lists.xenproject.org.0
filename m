Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C041666635
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 23:30:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475740.737549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFjbl-00077U-Vs; Wed, 11 Jan 2023 22:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475740.737549; Wed, 11 Jan 2023 22:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFjbl-00076F-SP; Wed, 11 Jan 2023 22:30:09 +0000
Received: by outflank-mailman (input) for mailman id 475740;
 Wed, 11 Jan 2023 22:30:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHza=5I=citrix.com=prvs=3687a0f96=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFjbl-000765-7X
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 22:30:09 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f0a6dd6-91ff-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 23:30:06 +0100 (CET)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jan 2023 17:29:56 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6421.namprd03.prod.outlook.com (2603:10b6:a03:398::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 22:29:53 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 22:29:53 +0000
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
X-Inumbo-ID: 7f0a6dd6-91ff-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673476206;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Tfci1Yft9hO6QbrKbFegdwobYO10oeVT7nn7iT/MQl4=;
  b=TPYap8oc8EmPdWt0QDtyvxKuRwsLN2OV9NHIRh0SWZrA1dTEGju+NJ0T
   LWsEhbx1K4Jqd7l/imqi+1fnU4A0sctycOnsg1nsUc8mi6BXjsdW8G89/
   40BPB635pUZpVd5XuhjOXDL5Lefsoq9hXyPZvGGC3z3gGvfLWNJ3Lxem7
   U=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 91140376
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:etQh+KIKNIBJC4T8FE+RG5QlxSXFcZb7ZxGr2PjKsXjdYENS0DIAy
 2AcXWCHP/aDZWbyfN8nb97i9E1VuMWEx4QxHVFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mhA5wVnPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5GAjl20
 P1GMwsgbzbboMyqnJejddJz05FLwMnDZOvzu1lG5BSAVLMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTGMkmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHqiBNpJS+PQGvhC2HrUwnAjLh4sCXCLpdu2iHWPZPdYE
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWXVHac+7G8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdBjXY0
 z2M6i8kiN0uYdUj0qy6+RXLhmyqr52QFwotvFyIACSi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02DaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:Jk9w9arwl7G7Ed4GeEkhl3caV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.96,318,1665460800"; 
   d="scan'208";a="91140376"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HO8e/QD+7uaOC5vz8NVQJXiyssWsxNTtXGAcxaSkv+MO/e1NDBa/57NE0IzRdiVt8OttfiNyCFB+44J8FGgtIm0Yp4gp0j0JSdCvtVgU5/T9ry4rAoAFf2w5E96NHsCot2pw56aSzVv+xr36+rBoa57ftSC5n2ZS+5Ii8nuY9islLbiYKiU/u7yEvmJ6MFEcChrSuvnarvpL3e5gkCRPcleL6+Ibsu0YCU1+nIuYrukfRLfMg81ED+sx/yyrVRBSl/BOBpn+jJq4CsoOnI5utPB5uaPlCTfUrYbyD+z+JJIEZdOOvOeO0xbomOaJXQU6zjx6EjgV/FNX+zMw8qW0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tfci1Yft9hO6QbrKbFegdwobYO10oeVT7nn7iT/MQl4=;
 b=H20khbe0Ggu6T/0hGnNBKXWwMb8E55/cXcFpvepSHL5M6DSV32X5Y8aXEmUbxr0GVfUIdZDuhqqTAfkyg4C3aSfV2zjrt/VfWlkN29fwkstKyopD9srrja/Xll4ex3rIQo+ZCigqIQQb7CmWfE7bc6QTp8qMprVkZgZc9bwqo/N662KuUFuh06eRSJigy9Ipy1hdtSI6J9IpKsocR8vWCJRxRLfedBc1/vtsjd+0tW9njzVrru7w1IFDomHap609b6sviWoAw51D5vrSTcqPlOpsAkYYBFMS6aKokteP+1FHokIKbv6W6tThIuNhJpsRnA86qH9xv5qNUgmRA2ASIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tfci1Yft9hO6QbrKbFegdwobYO10oeVT7nn7iT/MQl4=;
 b=KmRKLqSQNKOEGc7dNt1ettwHatY0keKRuupZfWWsf8D5bSJYR/1ejetVwduA16EkVnqw3r8XqrS8ACun9ewFrmvkVRtl5LtsV7UI8sza80klgfh7uNM5aGlVx1Et+nFf1ors6JywySe8tv2b/EwjAfIIwIfoAjMOPriOKLG4FOk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, George Dunlap <George.Dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re:[Multiple reverts] [RFC PATCH] build: include/compat: figure out
 which other compat headers are needed
Thread-Topic: Re:[Multiple reverts] [RFC PATCH] build: include/compat: figure
 out which other compat headers are needed
Thread-Index: AQHZJekaQF9ZU0LVM0eT+jo0D4jURa6ZzKCA
Date: Wed, 11 Jan 2023 22:29:53 +0000
Message-ID: <5c7ffbe4-3c19-d748-9489-9a256faebb7a@citrix.com>
References: <20230111181703.30991-1-anthony.perard@citrix.com>
In-Reply-To: <20230111181703.30991-1-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6421:EE_
x-ms-office365-filtering-correlation-id: 9dcd06f4-ea76-4dde-08fd-08daf4235c6a
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 q6JYKNIOkAugNmAjkql06KTLpHptgJiMSS3lt8jrDM6goAK+sSWDENno2yVKPp1lKXBRK5LLCHbKeqaZWmaneazMdyRLMZwAfxWT14lwh3W6+9YuMzUHZ2Lmmp1MKJkxzSIYqScjkDmGEr5q4xBKQQLiL0QbiyLWFepaHqPSdGWU7wFyUgWnURs8eZedBmhRfv5b98FOs8R6OdZDKu1C1rJPfG+aQWDckqsIrErXTr35xE/ZOg+gh6B5vNAxa4u6CYh+FOqLFYZHqdFVVHFGNXUYJOr87On/w61Hy2+8XyMq6j8TBkSHkO8JHF4mBMGM8fiC74CNP9d6p/EtcLccQmY3h+Tn3/6hViIIPqdoIeudo8mEgKyiaRVa0wh1+hP/gJWrK8OnY9E3IFnwxQFr3Ds/BZymcMfcnu194lQPP6nJOVEVQGCK6TyAuN+F3h2OYBS96c9NqDI33tgUhYkoYFWe802Qq1LTm4aAxH0k9jmLcvch4KAEbHONvWIV1JKecWe3/FxVvu4sPgGwcsgUgopfZYSuE1muGPdOBKJUQc5L4ch/EJNBWOnyisz0qPwPIJT/95w7SFh+jGhPP3nvDuAaVUyjzCKyTDv0Wa80Wx4kG7/zGXvB2RXko9EVCsE5kV8PvXO0o5eL8sYOyFcSBUi3Yz4256/Mh+zz6X1fqtzEdIK6hm8qaKLC5TaTaUNlqKjGdUECq3sUqKZ61/k/Wzf9vZAtM1jsVxYXlte1kGxMn2KTMYdMxNuhpY9aLcwaX8XJPTiv3MnX2+OSp6CT2HcDL2uvtGk2zMJMIDjqUnggQ6ywoOAA50BZGK+ouRj1MQehMU1q9OEEUoTR3/3b4iWcNAERvtxLXCx5c+nV+H8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199015)(82960400001)(38100700002)(38070700005)(122000001)(86362001)(31696002)(91956017)(66446008)(66476007)(64756008)(4326008)(76116006)(66556008)(54906003)(66946007)(8676002)(41300700001)(110136005)(8936002)(2906002)(5660300002)(6512007)(2616005)(83380400001)(6486002)(53546011)(71200400001)(966005)(186003)(316002)(508600001)(26005)(6506007)(66899015)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WnZFRVdLRVN3TDJ5TS82U1ZwWHd3bTFVaGtQaHNSaFQyb2RLWFJOSWdKU2pP?=
 =?utf-8?B?L1UyeWN2UWhDdmVFeFZqb0o4bElwN3RmYWtFaENDRUFRUWorV2xjUWxKb2R3?=
 =?utf-8?B?NFR3UTBTc2NIdjVqb1pVMmhqNmV3dnlrSHdINytzQnh6aEVtNFJnRU1Gc2pn?=
 =?utf-8?B?NVM0anNabnUwSXpEUXgyRHkyS2x0SW9zWjd0N3VzRUpWYjRzTXkyS3pIZEpD?=
 =?utf-8?B?WjlsbXRlaitkUWtmSjI4TVJ0d29RN3ZMZWdvV1Vpa0IwZ1MxR3QvdngzNXpC?=
 =?utf-8?B?cmk3WUlVOTNnVDV3QitFZjI0TnQyNHgvTitzYStmWnRjbDZDOGNoZzdPWEVF?=
 =?utf-8?B?cUVodUx2Qk0yRHp3cjU0UVZhZHd1YXlZSVk1VkNHM2toMHljSG43NFE4eUJk?=
 =?utf-8?B?dXF1Yk1IT1U4QndHa1h2WnZrbmdFODJUcUZWNHRFRkJibFJkY2QreWlCZExI?=
 =?utf-8?B?TE13eTRKQjV4UkkzMTVINHIwNXZzRjJWNVVoZHNGWU05dEkrMXlkZ1l3RE1V?=
 =?utf-8?B?bHRqdnpIZStXNkc2RW9WS2RlSE5tRklCZkZkRElybGxnVzd0MDZDSmJGU0Vx?=
 =?utf-8?B?Rm0rdlhLNERPZ3llb2J5YXhsUGpONUVMV29GaHRsaFIrdjMxdUdQUmY3VlEz?=
 =?utf-8?B?MjhXM0tpcTI0TDYyTHdncktJK2tCY1Q0cGZsMnlTaDhheGJLcmR2dG8rYWo0?=
 =?utf-8?B?MlNmeFZJUGh0Z0JDOEQvbDlQT3UwZ1BqNUdCMG44Qi9zR2pNeERKaUdRTlR6?=
 =?utf-8?B?bWNUcDlIelkrR0JjZVlneisxSWhiVldlS0ZnUXo0TVQ2enE4U0VUdFcxYUhN?=
 =?utf-8?B?RHlYU0RXNnNwUDMrblBDT2ROZjduVWhKMmxOQ2Vxa3hDTnl4K2xFQ280dm5y?=
 =?utf-8?B?aWpZMEMxWGpJVnIyVmFkaVliOTFjNkNITWlwWE9hSHhYNnNKT0RtRVYySk1K?=
 =?utf-8?B?NEN1ZTl2Q1RjUnIxalB3bmN6eTdGRjhwR0dVcVFWbXFIdHVmNC9lSEk2QUE0?=
 =?utf-8?B?Y0o3N2hDbTBQcjFZRk9vV1RBVmV4ckpQeW1XRTc3RlhrVVo2ZmZBdlF4Wmkx?=
 =?utf-8?B?RmdzeTJ6cHRHNE41YkRaZjh1OWRnZ1pNMm1JT25vcVJvK09jdFNJdlByS3ly?=
 =?utf-8?B?OTdqWW1FUXlXSEM5TjBCbFp5UlM5VTFVMHRGdTdHRGhKL1dwRGJEUEszZnRp?=
 =?utf-8?B?RFlTamJleENwS0hPQjZySUNzMjgxckduTTJwcklzbXRDVzVlb2UwZStaakdq?=
 =?utf-8?B?emtVQkIvNlZOZkVMamc3MjM3YUxBTGRDbVgyWFNXcXdyaGV4OERQTzFnRGRO?=
 =?utf-8?B?ODBoWHBnTGNqK1hiek9NNkdMMXpoclVoWE55WFJoSU9JNzdybXExd2t2ZGNM?=
 =?utf-8?B?MTBUUEtITUZRMytrUFdPa0tmSUdCRnRnb2JGcHBHMUFnQ1hBZitzb0hhUWNN?=
 =?utf-8?B?aG1XQ3RGTk5EbnYxaDVtYW40Ni9ULzJrKzNkcHhxMnZEL2pJS0tKTy8wbVRU?=
 =?utf-8?B?TXdtMTljVkNrQktDZzI5UmRDQ2hobkZWcG80cmpZOWh5QUJjT3dnOWdQKy9C?=
 =?utf-8?B?SEdRdHFrSnd6RDRqakQrVXNMYm1ZWTVGQlB5elBaRXRWRU5pK05vV281R01o?=
 =?utf-8?B?WHlYQ29DMDZTRUFjaC9MMzc1THlGa3F4bkpha1RnNTl1RmRESW9zME9JNDhC?=
 =?utf-8?B?WG1QanY5N2FYMFYzaWoxSXJoWm9YdXVkMmtNYVFuZGZTQnpOSmtoZWpMamtR?=
 =?utf-8?B?RlVWU1R2UVo4cVFocS9JNDNPSFZoV0tEQnpQZ04rY0VlSTZWMDJyYm5WYTZ3?=
 =?utf-8?B?aVpqMjRTc2lZbFpnaXJjQlc2VHRIcnJRZFJUajJKQ1N0S2Vmczdld3gzSXUz?=
 =?utf-8?B?ODVKRjdyck9uQkEvN2ExRklTeDNuem5veUZBZ1Z0dnN3RWlEZ2RaWkZVTTU2?=
 =?utf-8?B?cGg4dVg5M3pVazlyaVhDRE9tZUwyLzJPa3FzVzl4Y28yYTFSS2ErMEhiSm11?=
 =?utf-8?B?cE1XZ0x3UmRDWDlpcnBxanpWbDN1QU16TlFDeWhSRnhld0V1eEg3SmU2bDdX?=
 =?utf-8?B?QlZwTVZwWkVtN1phKzlCTVp6bDBQZU1yWXVRQkxwN1RsSHo3TnBlVGRpMzdM?=
 =?utf-8?Q?awuamTOUJC2BR+j0CBhcDniND?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A018F9DF57C8A4F87AE15F76341704B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bqcKTcAvIujz7kVq8lq2wXP56A6k8wx/SA2+NpHyTFHO8VyRxSx5ugmScsc3NxqDyOyzylofRv7/iPSolybaZQwgb+l43dR0crQL5iEiF4URTzbdFinIlHIouHqd0K0hm5LNHr4iEGEj9qXftS8LmwO/wFr4JYlaawU9FC7y6B2z5qIxtYG1XVgcp+KwqXD+0UYvV1rYzHVuYdSmIyy2HwXi3pvHmwqFI1Mi7egvRI1xMIUue7l/VfA9IHKJ2Pf46whOnIF3hsCeALyMH9R7VTrCUVAZLt7Eq8nJNxmnhZcD0w21BIYKpVIYU67Zzy2MiV8HjtiEJIAiNy/VswscKi3DWsXusBl7947rybV6oNzY9nPHRTKDsWy+CScj+f65xwV63cVIgtAUUkQHz8p13nfrXHSUzRD9a8jBMlE/1DXZ0c+xeRzXf86KNdv/hfY1+6FoJUnBlLD6bzShp/2nQTfZfxroBh4TCl2v0PEcO0H/L61zWJC70M20e2PQ6YwJKzH+W9PJZb3ocVBlpaoLjGlKNN4ZCBF9dKKICKOpF6RhnfMdFl4KoRigSPRybkqsC2Nm60Hhyu9GI9YEZnmTQGdXXjFM00tNdQnzoBB97m34Syt5uWzqwT8xQgT8aRlnaJTcNGAJCoYUxdiz3cSqVjL9r88CDMDFFTi37c6oQg0nh51MykwZ7SdHTutogCYXxIvmzbeRaqF4SQ48KgZsyJpf62JFt9NYaXciCxuEnVRUlqMoCHigLflYsMlOdRbCU6HYh9tnO2UdN3JN3K11YXU6L4GhhBxeVtyKX3uufvsROgv1h13/svSE8JfcQs08RbCFA7flPtE70ethA4b9b6gasFMIwwSPwbpIKmu0YdI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dcd06f4-ea76-4dde-08fd-08daf4235c6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 22:29:53.7363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cQcCq1t3mbjfKRe9li1q4uZ4qUWeg4JONgWI7ZLPzNl00hxEpLalzk6NyJrcbrNrITy+FCMW3puL9HEaUpDoHyCdgYCfEAP4RHQ9p05GMtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6421

T24gMTEvMDEvMjAyMyA2OjE3IHBtLCBBbnRob255IFBFUkFSRCB3cm90ZToNCj4gU29tZSBjb21w
YXQgaGVhZGVycyBkZXBlbmRzIG9uIG90aGVyIGNvbXBhdCBoZWFkZXJzIHRoYXQgbWF5IG5vdCBo
YXZlDQo+IGJlZW4gZ2VuZXJhdGVkIGR1ZSB0byBjb25maWcgb3B0aW9uLg0KPg0KPiBUaGlzIHdv
dWxkIGJlIGEgZ2VuZXJpYyB3YXkgdG8gZGVhbCB3aXRoIGRlcHMsIGluc3RlYWQgb2YNCj4gICAg
IGhlYWRlcnMtJChjYWxsIG9yICQoQ09ORklHX1RSQUNFQlVGRkVSKSwkKENPTkZJR19IVk0pKSAr
PSBjb21wYXQvdHJhY2UuaA0KPg0KPiBUaGlzIGlzIGp1c3QgYW4gUkZDLCBhcyBpdCBvbmx5IGRl
YWxzIHdpdGggImh2bV9vcC5oIiBhbmQgbm90aGluZyBpcw0KPiBkb25lIHRvIGhhdmUgbWFrZSBy
ZWdlbmVyYXRlIHRoZSBuZXcgZmlsZSB3aGVuIG5lZWRlZC4NCj4NCj4gU2lnbmVkLW9mZi1ieTog
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiAgeGVu
L2luY2x1ZGUvTWFrZWZpbGUgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L01ha2VmaWxlIGIveGVuL2luY2x1ZGUvTWFrZWZpbGUNCj4gaW5kZXggNjViZTMxMGVjYS4uNWU2
ZGU5Nzg0MSAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUvTWFrZWZpbGUNCj4gKysrIGIveGVu
L2luY2x1ZGUvTWFrZWZpbGUNCj4gQEAgLTM0LDYgKzM0LDI5IEBAIGhlYWRlcnMtJChDT05GSUdf
VFJBQ0VCVUZGRVIpICs9IGNvbXBhdC90cmFjZS5oDQo+ICBoZWFkZXJzLSQoQ09ORklHX1hFTk9Q
Uk9GKSArPSBjb21wYXQveGVub3Byb2YuaA0KPiAgaGVhZGVycy0kKENPTkZJR19YU01fRkxBU0sp
ICs9IGNvbXBhdC94c20vZmxhc2tfb3AuaA0KPiAgDQo+ICsjIEZpbmQgZGVwZW5kZW5jaWVzIG9m
IGNvbXBhdCBoZWFkZXJzLg0KPiArIyBlLmcuIGh2bS9odm1fb3AuaCBuZWVkcyB0cmFjZS5oOyBi
dXQgaWYgQ09ORklHX1RSQUNFQlVGRkVSPW4sIHRoZW4gdHJhY2UuaCB3b3VsZCBiZSBtaXNzaW5n
Lg0KPiArIw0KPiArIyBVc2luZyBzZWQgdG8gcmVtb3ZlICIuLiIgZnJvbSBwYXRoIGJlY2F1c2Ug
dW5zdXJlIGlmIHNvbWV0aGluZyBlbHNlIGlzIGF2YWlsYWJsZQ0KPiArIyBUaGVyZSdzIGByZWFs
cGF0aGAsIGJ1dCBtYXlub3QgYmUgYXZhaWxhYmxlDQo+ICsjCXJlYWxwYXRoIC0tcmVsYXRpdmUt
dG89LiAtbUwgY29tcGF0L2h2bS8uLi90cmFjZS5oIC0+IGNvbXBhdC90cmFjZS5oDQo+ICsjIGBt
YWtlYCBhbHNvIGhhdmUgbWFjcm8gZm9yIHRoYXQgJChhYnNwYXRoKSwgb25seSByZWNlbnQgdmVy
c2lvbi4NCj4gKyMNCj4gKyMgVGhlICQoQ0MpIGxpbmUgdG8gZ2VuIGRlcHMgaXMgZGVyaXZlZCBm
cm9tICQoY21kX2NvbXBhdF9pKQ0KPiAraW5jbHVkZSAkKG9iaikvLmNvbXBhdC1oZWFkZXItZGVw
cy5kDQo+ICskKG9iaikvLmNvbXBhdC1oZWFkZXItZGVwcy5kOiBpbmNsdWRlL3B1YmxpYy9odm0v
aHZtX29wLmgNCj4gKwkkKENDKSAtTU0gLU1GICRALnRtcCAkKGZpbHRlci1vdXQgLVdhJChjb21t
YSklIC1pbmNsdWRlICUvaW5jbHVkZS94ZW4vY29uZmlnLmgsJChYRU5fQ0ZMQUdTKSkgJDwNCj4g
Kwlmb3IgZiBpbiAkJChjYXQgJEAudG1wIHwgc2VkIC1yICcxcy9eW146XSo6IC8vOyBzLyBcXCQk
Ly8nKTsgZG8gXA0KPiArCSAgICBlY2hvICQkZjsgXA0KPiArCWRvbmUgfCBzZWQgLXIgXA0KPiAr
CSAgICAtZSAncyMuKi9wdWJsaWMjY29tcGF0IzsgOiBwOyBzIy9bXi9dKy8uLi8jLyM7IHQgcDsg
cyMkJCMgXFwjJyBcDQo+ICsJICAgIC1lICcxaSBoZWFkZXJzLXktZGVwcyA6PSBcXCcgLWUgJyQk
YSBcICcgXA0KPiArCSAgICA+ICRADQo+ICsNCj4gK2hlYWRlcnMteS1kZXBzIDo9ICQoZmlsdGVy
LW91dCBjb21wYXQveGVuLWNvbXBhdC5oLCQoaGVhZGVycy15LWRlcHMpKQ0KPiArIyBBZGQgY29t
cGF0IGhlYWRlciBkZXBlbmRlbmNpZXMgYW5kIGVsaW1pbmF0ZXMgZHVwbGljYXRlcw0KPiAraGVh
ZGVycy15IDo9ICQoc29ydCAkKGhlYWRlcnMteSkgJChoZWFkZXJzLXktZGVwcykpDQo+ICsNCj4g
IGNwcGZsYWdzLXkgICAgICAgICAgICAgICAgOj0gLWluY2x1ZGUgcHVibGljL3hlbi1jb21wYXQu
aCAtRFhFTl9HRU5FUkFUSU5HX0NPTVBBVF9IRUFERVJTDQo+ICBjcHBmbGFncy0kKENPTkZJR19Y
ODYpICAgICs9IC1tMzINCj4gIA0KDQpGb3IgcG9zdGVyaXR5LA0KaHR0cHM6Ly9naXRsYWIuY29t
L3hlbi1wcm9qZWN0L3Blb3BsZS9hbmR5aGhwL3hlbi8tL2pvYnMvMzU4NTM3OTU1MyBpcw0KdGhl
IGlzc3VlIGluIHF1ZXN0aW9uLg0KDQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gYXJjaC94ODYvaHZt
L2h2bS5jOjgyOg0KLi9pbmNsdWRlL2NvbXBhdC9odm0vaHZtX29wLmg6NjoxMDogZmF0YWwgZXJy
b3I6IC4uL3RyYWNlLmg6IE5vIHN1Y2gNCmZpbGUgb3IgZGlyZWN0b3J5DQrCoMKgwqAgNiB8ICNp
bmNsdWRlICIuLi90cmFjZS5oIg0KwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+
fn5+fn5+fg0KY29tcGlsYXRpb24gdGVybWluYXRlZC4NCm1ha2VbNF06ICoqKiBbUnVsZXMubWs6
MjQ2OiBhcmNoL3g4Ni9odm0vaHZtLm9dIEVycm9yIDENCm1ha2VbM106ICoqKiBbUnVsZXMubWs6
MzIwOiBhcmNoL3g4Ni9odm1dIEVycm9yIDINCm1ha2VbM106ICoqKiBXYWl0aW5nIGZvciB1bmZp
bmlzaGVkIGpvYnMuLi4uDQoNCg0KQWxsIHB1YmxpYyBoZWFkZXJzIHVzZSAiLi4vIiByZWxhdGl2
ZSBpbmNsdWRlcyBmb3IgdHJhdmVyc2luZyB0aGUNCnB1YmxpYy8gaGllcmFyY2h5LsKgIFRoaXMg
Y2Fubm90IGZlYXNpYmx5IGNoYW5nZSBnaXZlbiBvdXIgImNvcHkgdGhpcw0KaW50byB5b3VyIHBy
b2plY3QiIHN0YW5jZSwgYnV0IGl0IG1lYW5zIHRoZSBjb21wYXQgaGVhZGVycyBoYXZlIHRoZSBz
YW1lDQpzdHJ1Y3R1cmUgdW5kZXIgY29tcGF0Ly4NCg0KVGhpcyBpbmNsdWRlIGlzIHN1cHBvc2Vk
IHRvIGJlIGluY2x1ZGluZyBjb21wYXQvdHJhY2UuaCBidXQgaXQgd2FzDQphY3R1YWxseSBwaWNr
aW5nIHVwIHg4NidzIGFzbS90cmFjZS5oLCBoZW5jZSB0aGUgYnVpbGQgZmFpbHVyZSBub3cgdGhh
dA0KSSd2ZSBkZWxldGVkIHRoZSBmaWxlLg0KDQpUaGlzIGRlbW9uc3RyYXRlcyB0aGF0IHRyeWlu
ZyB0byBiZSBjbGV2ZXIgd2l0aCAtaXF1b3RlIGlzIGEgbWlzdGFrZS7CoA0KTm90aGluZyBnb29k
IGNhbiBwb3NzaWJseSBjb21lIG9mIGhhdmluZyB0aGUgPD4gYW5kICIiIGluY2x1ZGUgcGF0aHMN
CmJlaW5nIGRpZmZlcmVudC7CoCBUaGVyZWZvcmUgd2UgbXVzdCByZXZlcnQgYWxsIHVzZXMgb2Yg
LWlxdW90ZS4NCg0KDQpCdXQsIHRoYXQgaXNuJ3QgdGhlIG9ubHkgYnVnLg0KDQpUaGUgcmVhbCBo
dm1fb3AuaCBsZWdpdGltYXRlbHkgaW5jbHVkZXMgdGhlIHJlYWwgdHJhY2UuaCwgdGhlcmVmb3Jl
IHRoZQ0KY29tcGF0IGh2bV9vcC5oIGxlZ2l0aW1hdGVseSBpbmNsdWRlcyB0aGUgY29tcGF0IHRy
YWNlLmggdG9vLsKgIEJ1dA0KZ2VuZXJhdGlvbiBvZiBjb21wYXQgdHJhY2UuaCB3YXMgbWFkZSBh
c3ltbWV0cmljIGJlY2F1c2Ugb2YgMmM4ZmFiYjIyMy4NCg0KSW4gaGluZHNpZ2h0LCB0aGF0J3Mg
YSBwdWJsaWMgQUJJIGJyZWFrYWdlLsKgIFRoZSBjdXJyZW50IGNvbmZpZ3VyYXRpb24NCm9mIHRo
aXMgYnVpbGQgb2YgdGhlIGh5cGVydmlzb3IgaGFzIG5vIGxlZ2l0aW1hdGUgYmVhcmluZyBvbiB0
aGUgaGVhZGVycw0KbmVlZGluZyB0byBiZSBpbnN0YWxsZWQgdG8gL3Vzci9pbmNsdWRlL3hlbi4N
Cg0KT3IgcHV0IGFub3RoZXIgd2F5LCBpdCBpcyBhIGJyZWFrYWdlIHRvIHJlcXVpcmUgWGVuIHRv
IGhhdmUNCkNPTkZJR19DT01QQVQrQ09ORklHX1RSQUNFQlVGRkVSIGVuYWJsZWQgaW4gdGhlIGJ1
aWxkIHNpbXBseSB0byBnZXQgdGhlDQpwdWJsaWMgQVBJIGhlYWRlcnMgZ2VuZXJhdGVkIHByb3Bl
cmx5Lg0KDQpTbyAyYzhmYWJiMjIzIG5lZWRzIHJldmVydGluZyB0b28uDQoNCn5BbmRyZXcNCg==

