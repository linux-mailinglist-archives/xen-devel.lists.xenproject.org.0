Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026B865F4DF
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 20:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472136.732274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDWNq-0000eR-4Q; Thu, 05 Jan 2023 19:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472136.732274; Thu, 05 Jan 2023 19:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDWNq-0000bY-1a; Thu, 05 Jan 2023 19:58:38 +0000
Received: by outflank-mailman (input) for mailman id 472136;
 Thu, 05 Jan 2023 19:58:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+KT=5C=citrix.com=prvs=36272ec6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDWNp-0000bQ-7V
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 19:58:37 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5570c304-8d33-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 20:58:35 +0100 (CET)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 14:58:31 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ2PR03MB7111.namprd03.prod.outlook.com (2603:10b6:a03:4f4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 19:58:29 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 19:58:29 +0000
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
X-Inumbo-ID: 5570c304-8d33-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672948715;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=A5DcOx1HurqUvgeh7+k8zn9b8IirzaV/OriLckeh4Hk=;
  b=Mlp/CeQrAiSbVJT8gjMWCRrFIGXZueFuTZwCws12wQ2Hunr6cfIhiKpm
   6Qy7pgpOmuxK9/cyNcgIpAYBsEKRVB4DEy6oPDjSor53+R649M76K5Ihw
   xayiZLCk95it5/2JCWg9QlffPXRYiRpYdSZpJUCefxHF6Jd/JQi/LhM9m
   A=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 91373675
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SUBD3K4s/PD5/zJEPIOu4AxRtM/GchMFZxGqfqrLsTDasY5as4F+v
 jFKCjqFbqmOYjanfNx3O4+28UJXvsfVndZkSwE/+38xHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZlPakT4QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m/
 PhIEA5dahC4gOuPnKKdWLJ9lJkgM5y+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooj+WF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNLT+LjqKE36LGV7nMwDwJGb1u+mqW4lmifZPAEE
 2w4/iV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8ywqUA2ksTzhfaccnvss7WTwr0
 FCSm9rjQzdotdW9THuH876OoDCaOC4LLHQDbysJUQsE5db4pIg5yBnIS75LD6qdntDzXzbqz
 FiisCk7r6Uei4gMzarT1UDKhXegq4bESiYx5x7LRSS14wVhfomnaoe0r1/B4p59wJ2xS1CAu
 D0OnZiY5eVXV5WVznXSHaMKAa2j4OuDPHvEm1lzEpI99jOrvXm+YYRX5zI4L0BsWioZRQLUj
 IbokVs5zPdu0LGCNMebv6rZ5xwW8JXd
IronPort-HdrOrdr: A9a23:8LwbLqibOOMxa/Nn/EPnU5OCpXBQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="91373675"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2YyvaLvZvrl3ZruLCpIl93JC4EYd06NrS8HhlF3EVWJqTaO+e3UEWkvG1D0mSHHF5k/3XhwFIUx+E3Yjo9Q6IiJgUldKFyHbr5X23zennlAHuTY2N/th5CdbpqnQBP0+XIQd/1NRNpTWzVpGYmUcJg8pWBIFXroMb6EeoSg2G9X1WNsrXw36yYYtdWljNVtLmayRsiHp+4n17ue2HJ3X52G1LHzDEhsn+M2G+mfe5p/isJeCbNmFIEx+ke2iy+znN0tI2Zt6L7CtIzTPoWmbjI4GURhcMbqAP3aKmRj/xIrPLuQfEQoJUhjXNLTVnEfEJdoNObwLFnIjzXFUyblTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5DcOx1HurqUvgeh7+k8zn9b8IirzaV/OriLckeh4Hk=;
 b=GKIcsnA0LpeKE2C2/NOUsnsrGmM9pqGYbrbljVtWTXmLsO5fIpF1uD7zLYYSkZF2W6JCqMHXeAehQXGrcRGeaCNYTlWyIP+czz+v4/K3JrbhP8I2zqK0Zc7ocJ7R5EiyLeJ+XUyuTlTRddfRbfgKhhgBDsEXOJBwjXvHm+KyDM3/Imq0Zs488JJjn3Xqe+mbZy3/IH51jV4bhFkb1rf4COMvsMuRLJvNhGopWnb4o5Dbx8JqyOfNr9MKcQcZBKNEzMgsYeBw9+DT2PaGqeq748fwXO9b6T+tuToeJ6lW0xQB0lfy47nToDD9hSxTHVJ464GPQ+3/Ujo6oKnkohuIug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5DcOx1HurqUvgeh7+k8zn9b8IirzaV/OriLckeh4Hk=;
 b=ioebbGTWgv9qbVNkiN4x/IHPYF9YCDzyka8iIBxFYTsNOqJA57zmoTRfMpsqI1jf2lx3TJwRrOIAxCn8KWHZwe+PfAhVwSPvxe2TPHAakJmDNRaHPOtys1nZ6j+YaZPmRXYoMSZUKwsoo56BWmosOifKjkkiYvfJ1LsALsMcjZ4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>
CC: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 3/5] x86/mm: make code robust to future PAT changes
Thread-Topic: [PATCH v6 3/5] x86/mm: make code robust to future PAT changes
Thread-Index: AQHZFlVFWAiHUIB/Aka1sujnPXJ1rq6P77GAgABjzAA=
Date: Thu, 5 Jan 2023 19:58:29 +0000
Message-ID: <52df603e-624c-56ae-dd5b-c732f3ca5fe6@citrix.com>
References: <cover.1671744225.git.demi@invisiblethingslab.com>
 <00505454afa89b759122008852502a5ef7b1b1ee.1671744225.git.demi@invisiblethingslab.com>
 <ad323ad9-28f8-9eac-f6f5-f6b6373e2272@suse.com>
In-Reply-To: <ad323ad9-28f8-9eac-f6f5-f6b6373e2272@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ2PR03MB7111:EE_
x-ms-office365-filtering-correlation-id: 90df5c1e-ff22-4256-8e66-08daef573707
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LjSnePJvZTwgIOZdHkPQuGjMvcApVPFlnQBz1CEFLzTdsWVBTcHjCjkVCPeOmM/KXs9ETW9fn8TjxJ9oEIuTipH9ZaaOF8s4fcVoF9vKRqIbKkGxuSZ6FnQbUf8EM1hbmBaCPQfjFGe4a8UxJztFZLY1krsjAGGbcqIVSYxc8A2SvNzGTKu9NZvMy4JJ4mo7JKioQ5eSBauaVC062ZBC4Ab1dHJDnq6J4GYdgfdi0uGn+YH2CiDKkYcdSjMTwKXr1RqdwBA6zEM//mdQ9kH0Vse+ZEJZRatv47TCy7FuW/vs/52xZYPtgMJyryNWkJHF80COT30WJWfe2fy54lvc6F4SJ2NxMuLsyFz/7afuUr4raa6vIR8MWFpMMIt6cPWR3L33zfjRJxuMOgNHw44dJ8mmmAp14vYZj+sF/SjEN+cFI0BeJeIzUQ+of6Sl7FU1HS4S+K/whUCW8zKjsHsvm6BHgJYVTFJ++S1+8T06KrcHujaW5hLZp65AmlnlpXwnpRpeeazVDaPPE8hFqahnTLQSDQtW8xQQJsfJJiI7pXTBbfGq1sE/1jkQf3l5WIigSVQzwQLjyu7DM07kPtfpFBlHtrIYIKl31Bj2EJwLzlcCPpSC3zlCs3+BrQVVUHndXicctg3LGLxRwCpzgVMB6KR5lj55zlojffMxRCqhKCiDlTSAcp8u2C623cr+xLuJwvQwcnlx2pioFB8qNsSwmzRqVZApP3jMgmSE0VUdWFEmVXuQKronkZOqe6aPfpuMSpK8Gok7dLJwNBUlY/cJ8Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199015)(6512007)(186003)(26005)(91956017)(31686004)(71200400001)(478600001)(6486002)(6506007)(110136005)(53546011)(2616005)(66556008)(66446008)(66946007)(4326008)(41300700001)(64756008)(8936002)(76116006)(66476007)(8676002)(4744005)(5660300002)(2906002)(38100700002)(122000001)(38070700005)(82960400001)(31696002)(316002)(86362001)(54906003)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVJGNm1HSU5LNnZmMExEY29XQXlDWnJwdkRITnRnYUkzSUtPT3NFQ2lZYktI?=
 =?utf-8?B?SFk1K3B4d3l1K2xJbEp3bWJGZnAycXp0NlhuQk4xWHJMbW5wazFtWDg4Z3U3?=
 =?utf-8?B?WXQ1cmtCcHNqNytvVmZsMVJnMXBaSEdWQUdGYkVuTitMUGZHMXJxU3RMMTR0?=
 =?utf-8?B?b2Ezall1aTNYVld5TldjSDJCeFNmZ05LY25EVEd5YmFBNFRjWElaejIyMldo?=
 =?utf-8?B?ODhKaVRqT1JpaHhBamV2WUI0dEN6bWtpQ002b1l0UEFqWm5wdTZsUGozd21p?=
 =?utf-8?B?amFLOWthSExxTDRTZitjL09kWGF0WjA3SFdxQVc4UWg5ZGY0YzgrRU1Vb0gy?=
 =?utf-8?B?NkdZeS9tRCttbXZqVm1MTXo5elNVNWp4akwzOStEOGpQTWlWUGxCWE91UTRE?=
 =?utf-8?B?OHFTZmNKQy9Jd0Zib0VaUXBYZGpsNVl6cUtuVmN2dEt2cmVNY1p3Mnd5Wlc2?=
 =?utf-8?B?emFSV04waGdZcEVFZXBDcXpzOFFBeVlzdHV6NndSWWcyMVJkVDNVdjQ0bVJr?=
 =?utf-8?B?NGt6ZXVMMVN1b1ZzOFlVVEVaMFoyN055VnVLcitqWGIrSGhYZVpWZW5JM2Rp?=
 =?utf-8?B?MmFoMVNZamdEdkN0M1dtYUlZbG5UenhSN3RsMk9VYU5YcjBnTWxaelQvTWFG?=
 =?utf-8?B?WlJGZEJ5VVhHa0tOSm9YdTVBK0tIcTBSZHE4b2U5WWdlczE0b2RUY1dDQjVN?=
 =?utf-8?B?c21YVSttZUhMcjVkSVpFdnR4SERMTVJYZHZjcjdhUU0vdG5zNm84cC80MTF3?=
 =?utf-8?B?NXMwMjhhTjhyaGNzWGR1OU5YeVVSU1NDRHRmVHFlbTBLckRmV2dHdmYyUjQ0?=
 =?utf-8?B?Zmc3N0xPVW5VTXNLbXNiYVR6Vi9wMnlKT3YvQWFCSlh1ZkMrL0Z6M05oOFJX?=
 =?utf-8?B?WVl6cXNCbkRCVS9kc0l6WVkzejR5WDRlT3RSNHFNN3djWnVFL1RzRHZVYS95?=
 =?utf-8?B?b3ppRjByQ0ZYbUJwcmdOZ0x4S3N5dXNRcGI4ZGVIb1V4L1NCeS92cnYzL1ZT?=
 =?utf-8?B?MTdqWE4reUVxeW1GL3hxUk41YVJrclFocFNpekJ3QW5yL05SR3BSQjh1SkFE?=
 =?utf-8?B?T2Nic1dWeS8rZmFNd0pMeFVVT1hXTXduaWs5eitlYnRCbXBmalhTZkFSN0Qv?=
 =?utf-8?B?QWpQVG5GOGlYcWRMSzFTZS90RmZWM0lnMXhyY0x3MVROMGg2TjIwenBWRUNo?=
 =?utf-8?B?Q0o0ZDBBUEJ0U2JIZUZiV0J2NXZYNHBUcmI3NzZvY2I3NXJURE5QcW5JbGFt?=
 =?utf-8?B?cW1YZXRtTmVWV29KOUx5R3l4NnltY0hUZTEzNE9DOFpoTGFGZFNQS2IwUXlJ?=
 =?utf-8?B?blNoTzhRZEhlK0w2c3Jzd1BzelA0d3U4Nk5GNi9kYUNpT00rejFTRVN2SG5s?=
 =?utf-8?B?TXB0c3RHd3liK2tEVDJkVUtEcEhOWjMxWEFnajRuRlJJMjNZelVzZWdNOTh6?=
 =?utf-8?B?dXNjckdEcUxPNGdmdWRxalovSGhVam1LNDBOM01HVzNMbDRYclFtajJWalNO?=
 =?utf-8?B?OCtiYjN3WWoxTkl5cFQzTFZaZElvSVhvNFNxQXIrUERRUDduMUR0bnMxMHcy?=
 =?utf-8?B?SkJmNVplWlFlYTM3b2ZOZ0VMdkczaDNPZFBIQnpQdElDZU1KaDd2aFU3cHNI?=
 =?utf-8?B?VFc2WkU0NlZSaWhZSVFiU1RwRndmdDhYQ3pXOGFpSzFiNEdjbjN4bFRoYW0z?=
 =?utf-8?B?Zyt3dXJwbndZbWlPWXQ2c3cyVU5YbFp3enUvSzdMM2trUk5md3JJMjZ0SW5G?=
 =?utf-8?B?MXVtdzZRQVVFSmV2MGd1Y2VSaE5wbWJKZWJhZjl3UkFrQUpicUlNeGRTQ1ha?=
 =?utf-8?B?aHVvVDJMOUJwWTZicThUTTVRZU9ycDl2Q0lDWmlnRXp4ZzM2dHY1dXZGRngx?=
 =?utf-8?B?Y2VWUVIzaW9kQzl3VlU3bjFROWJWM3RwQ2IrcTFwQWhuTkJOTFByVVVXSWh2?=
 =?utf-8?B?bTFRdGI4K2lWcFFQaWNRL29tNmFhMlc0WklZZG85dnVZcU80SnhsOXhvMGZs?=
 =?utf-8?B?YXNWZENtSHJGTk9LTUduS3hrQkh0RnZ2MjdELzNiYlJ1VlFFVDQ1bGdSU2l3?=
 =?utf-8?B?aEJpRWpicDFnV1BSVEZ1TXpNN01uK3NoRzNkakV5UUg3cWYyNlA3L1crZ1J5?=
 =?utf-8?B?R3c1Sm9WekRUVFduSHJ5QXE1anhGQXJWVTlQN3RrT2FjT2hTb0hFSGFCenJQ?=
 =?utf-8?B?L3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00F1820B124F124B8B6C10D840CE692E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?Y1k1NnV4dG05eHVkU1kvbUsrdUd5VXdwNU9KRUQ3TXRkKzlqOFFES1JaTnhS?=
 =?utf-8?B?WmNBdWdTVVREZ1hXQzkvTDAwdXpTZC9GTklReEZYK1J6eFdKc2xHRFJYTHMx?=
 =?utf-8?B?WWdJVGwyYUNsMDVjOCtoR1dwbUt6Und0UUg4VzVvY2dwNytPUmpHY21OSmZV?=
 =?utf-8?B?NHZMb0tlbzJ4K3FOUTFjbHM1S2JLV1UxMlN5YTB6SnMyYm9wTEJuRDZpWEEz?=
 =?utf-8?B?dFNwYmw0R1V2VDJPZ01xTmcyM2U4eWdxMG5helAxMWpmMTh4dFo3cGxNWm1p?=
 =?utf-8?B?MkgwQmJITXlTNWtXekFFM3VmYjM3TkF2bTREa0NCZjBzMkVFK3M3UmxYUGhR?=
 =?utf-8?B?b3FsTHE1OEtSeUd2LzluL2VFdGxQZXlwblVNRnA0MEt0bDN5WXlFVjF6OHZm?=
 =?utf-8?B?eTJBY2ZjeFoxS2s5ckUxbDB1RWN3SThGT0VEOHF4M3lKeDdNejdRRnZCRjdy?=
 =?utf-8?B?K0FjL205alIvMHp1Z21ISEp6ampuSnFCWFRkTm9jb0tnWXBNaVlPVHFsOE9O?=
 =?utf-8?B?TUpxT09wMFJtTjlhVHpEb0dHUDRlcHhWT1B4TllGWnZVQkVBMXJkZkVPalk3?=
 =?utf-8?B?YTNJeERTL1AyTURWa1o4TVNIZXFwcmovSlhOVlFkcHQvaE0rYytGZmFkd01P?=
 =?utf-8?B?WEdxdmtyOFV4NHpIOElpN3BPK0xLWTB3R0d6VEczcnM4TlBlbXZ5N29idFVJ?=
 =?utf-8?B?eWxKTStwb3NCTzlJcGdhcE1MajlCd3MwektsVXhLdlkrZ0FFTFJSakc1N2N5?=
 =?utf-8?B?TDM5UVRDUFNaOWwwVk5SQnZDcERYTGJvWkVwaEh5OE51TVBwVTdyMmJtL0NM?=
 =?utf-8?B?RmFvSFRYb1prWlF4OHRQdWV6aUZBckZYMWZUcDQ5ZzVaTWU1MTlJRDk3bVR4?=
 =?utf-8?B?RlJmRWF3T3dHdTBvVnB3WTR6OURNY0JpNmlxb0Y4UWlEajFvSXRJWXc0Q1hv?=
 =?utf-8?B?UHFBc2RYT004dmtJL2hqTjJ6a0NqTHlHa0VDeTB2ei9DYmZIaFZoN2txWTNQ?=
 =?utf-8?B?VkkybThjNlRFeFNzeXI0RHRtaXloVXNvRVhLSk5EWVpRT1pFZkk2aUtBc2FH?=
 =?utf-8?B?cFJLQWdUVVc0WGZBd2JVSVZGL0VqM0VLV0NDQkdGVWdHRThRL2J5RG9KcW90?=
 =?utf-8?B?dWpTaFh0MU5QNDRzQTdxYS9aNHVXY1E1VDJwcHU4ZlMyU3pOcVBTL0pGU1JK?=
 =?utf-8?B?NDlMRndJV3ZRWnJOamNQTkZqemVRVDJSSldiSFVNRE5jL0FvU1kyN05YR1I5?=
 =?utf-8?B?ZWZaYlp1SFhHaURCbVV3L0Y3QUpMZjlEd0E4Z0w3V20vNDZUdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90df5c1e-ff22-4256-8e66-08daef573707
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 19:58:29.0469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TPIWb6wAnITXz6UMltIEA89Wd7MpGjecZzRf+PkCE3o9jzHPPm/zMzudlKNNE8w3fXdjymY3CMZnyVtu51aW/v55FgebrpIlsGeG1YyIu8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7111

T24gMDUvMDEvMjAyMyAyOjAxIHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjIuMTIuMjAy
MiAyMzozMSwgRGVtaSBNYXJpZSBPYmVub3VyIHdyb3RlOg0KPj4gLS0tIGEveGVuL2FyY2gveDg2
L21tLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jDQo+PiBAQCAtNjM1Miw2ICs2MzUyLDEx
IEBAIHVuc2lnbmVkIGxvbmcgZ2V0X3VwcGVyX21mbl9ib3VuZCh2b2lkKQ0KPj4gICAgICByZXR1
cm4gbWluKG1heF9tZm4sIDFVTCA8PCAocGFkZHJfYml0cyAtIFBBR0VfU0hJRlQpKSAtIDE7DQo+
PiAgfQ0KPj4gIA0KPj4gKw0KPj4gKy8qDQo+IE5pdDogUGxlYXNlIGF2b2lkIGludHJvZHVjaW5n
IGRvdWJsZSBibGFuayBsaW5lcy4NCj4NCj4+ICsgKiBBIGJ1bmNoIG9mIHN0YXRpYyBhc3NlcnRp
b25zIHRvIGNoZWNrIHRoYXQgdGhlIFhFTl9NU1JfUEFUIGlzIHZhbGlkDQo+PiArICogYW5kIGNv
bnNpc3RlbnQgd2l0aCB0aGUgX1BBR0VfKiBtYWNyb3MsIGFuZCB0aGF0IF9QQUdFX1dCIGlzIHpl
cm8uDQo+IFRoaXMgY29tbWVudCBpcyB0b28gc3BlY2lmaWMgZm9yIGEgZnVuY3Rpb24gb2YgLi4u
DQo+DQo+PiArICovDQo+PiAgc3RhdGljIHZvaWQgX19pbml0IF9fbWF5YmVfdW51c2VkIGJ1aWxk
X2Fzc2VydGlvbnModm9pZCkNCj4gLi4uIHRoaXMgbmFtZSwgaW4gdGhpcyBmaWxlLg0KDQpJTU8s
IHlvdSByZWFsbHkgZG9uJ3QgbmVlZCB0byBjb21tZW50IGJ1aWxkX2Fzc2VydGlvbnMoKS7CoCBJ
dCdzIGENCnBhdHRlcm4gd2UgdXNlIGVsc2V3aGVyZSwgYW5kIHRoZSBCVUlMRF9CVUdfT04oKSdz
IGFyZSBpbmRpdmlkdWFsbHkNCmNvbW1lbnRlZC4NCg0KSSdkIGp1c3QgZHJvcCB0aGlzIGh1bmsg
ZW50aXJlbHkuDQoNCn5BbmRyZXcNCg==

