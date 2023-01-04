Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0068D65CB4F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 02:19:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470843.730485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsQi-00055f-NQ; Wed, 04 Jan 2023 01:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470843.730485; Wed, 04 Jan 2023 01:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsQi-00053j-Kf; Wed, 04 Jan 2023 01:18:56 +0000
Received: by outflank-mailman (input) for mailman id 470843;
 Wed, 04 Jan 2023 01:18:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpAs=5B=citrix.com=prvs=3612a7559=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pCsQg-0004ud-Ie
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 01:18:54 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be53b235-8bcd-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 02:18:51 +0100 (CET)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Jan 2023 20:18:48 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6000.namprd03.prod.outlook.com (2603:10b6:5:38b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 01:18:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 01:18:46 +0000
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
X-Inumbo-ID: be53b235-8bcd-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672795131;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eqOY2ksHn1dUxyXx0p4brYvZm8CgsRTAnDvPno2SXMU=;
  b=hPwFtGuK+WOXxkhjj5L5hL3KxNJ9FtWvcK3hc3N/Nh6NIO8o9tRRoNLb
   wrfcclBn0ZTX7uBcC59OcVfRBKHLbE23v/9UrTLNiyvfzD9U++VwX3QEQ
   f4FBo9eQ5GIr06LsXwsbVJo32wIe+KgwYov40Jw4b/WfCQ25rMjFZfoYe
   U=;
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 91475240
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:uQtTcaJdowZapfqTFE+RMZQlxSXFcZb7ZxGr2PjKsXjdYENS1WQGm
 mRKXmiEM66JZWDzKd9wbN/lpx5UvMXVmtUxQVdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mhA5wRlPa0jUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c55AjBiq
 eVGEAs8YzWngsa1+LG7aOpj05FLwMnDZOvzu1lG5BSAVbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGLlWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHqnB99ISOXQGvhC2GSq4nQ+DQcqa3ih/Min03GzUol7N
 BlBksYphe1onKCxdfHmRAGxqnOAuh8aWvJTHvc85QXLzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rydtz+1NAAeJHUOYiJCRgwAi/HmoYozhxaJScxxHaqdh9j5Xzr3x
 liiqywzhK4SjIgIyr+89lDEhBqjo5HISkg+4QC/Y46+xgZwZYrga4n271HetK5ENNzAFgDHu
 2UYkc+D6uxIFYuKiCGGXOQKGveu+uqBNzrfx1VoGvHN6giQxpJqRqgIiBkWGaujGp9slePBC
 KMLhT5s2Q==
IronPort-HdrOrdr: A9a23:oR5fUagVgY0Y7I1Gq9jpB7YwxnBQXvwji2hC6mlwRA09TyXPrb
 HVoB0+726MtN93YgBHpTngAtjmfZq4z/RICOYqTNSftWXd2FdAT7sSibcKoQeQeREWrdQtrZ
 uIGpIWYLbN5DNB/KPHCWeDcuoI8Z2u7L2vnuvGymcFd3AQV0ii1WtE48Sgf3GeiDMoOXPxLv
 Sh2vY=
X-IronPort-AV: E=Sophos;i="5.96,297,1665460800"; 
   d="scan'208";a="91475240"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KexJpr9wgWU1QiwPzIyza/NBjZfYyhJGuUIwvIrS0oXyTbRL47jIaJCS4OKsfjTaCADleOsFH9cQEkMfZ8VpBgZ23D87LLqz1tonN7DQCtlD3kfDnPhW4goQkWASuxeB4QYZKfOI+f8tqbnk+FRyGXoNU9QADsVG6GINLBwDSa18Y0QqHGZGalpe3wGAKAGrTAikCa8Rop5k8oJqYEBeA2CBgJYPJltk8fXwvEV/x7kDAsyLYUh3RmS4Ecg/kKjKCwafc3dSRRCVDltJzATDBXXU5TeX5Ac5JwhTAlbFHjhxh1wnUwCIqWVIdfs/BJW1C38uHiLZafNkIf6UkSm2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqOY2ksHn1dUxyXx0p4brYvZm8CgsRTAnDvPno2SXMU=;
 b=R64kivNJImWCR+4n54KC9VBP/NI8x4cJe9gGN5vvbA+VhHuKszB09VsylC52SM+kyeCq6QRzsYSsEiZs4tTuBssj7AhSdS1RChwmkhQ81dGe2WkkCOzaNqgMBUdb0irl6aKl1PZjyIHsd2GPMA6Tfdhyx5ncHjfQ1gR9RtmY4+pIp0kzzi9Ft4DvHPmlPoRGwebfneSTvj1560eToN1yRGl3QdPraAy6L9Ng1zPsX1h8SZkIASPZY91DI666gD64FG3GGG2yM2FMR2RtxUkt0iOMPylLhRgUmDeesE9n78sn6IYPF2hNnaqg99vIcU24e4zw1U0TEL2vQqX3Tpe71Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqOY2ksHn1dUxyXx0p4brYvZm8CgsRTAnDvPno2SXMU=;
 b=RJQF9NfNE2QdHMcbPFp8yVLTrnQunnAauwAo7Wk9M7oSlzj92h8WdKF2PdsbEqWmA43fW6jB/NuhseKQpYEU2wRIj0adW9Ccmu194LB96oeHQH9tIOmEpv1ZkXomSak/ey9f9wZszQcqvp4KaDic1DrSd9NORpyksuhzPxNYIaQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Anthony Perard <anthony.perard@citrix.com>, Michal Orzel
	<michal.orzel@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/6] CI: Remove guesswork about which artefacts to
 preserve
Thread-Topic: [PATCH 2/6] CI: Remove guesswork about which artefacts to
 preserve
Thread-Index: AQHZG+cbH36uve2aEUGxm9tAfYRLqK6NeucAgAACRYA=
Date: Wed, 4 Jan 2023 01:18:46 +0000
Message-ID: <71b7e387-8607-039b-6cb3-8555a1593361@citrix.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
 <20221230003848.3241-3-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2301031709570.4079@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2301031709570.4079@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM4PR03MB6000:EE_
x-ms-office365-filtering-correlation-id: e2cc64c4-edbb-42ee-88e5-08daedf1a098
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oLwOb5ZgR2ChadQU6PJ7ze67qYvJKlEOSjXMEAqXrdiJvp+2j1kTJQ+pbGZxNxfKyLLNEzDH6QGSJ5hhQU0dexfU9i4HqIqCsxBfiZneHyk4DubPDZrfk74nt1yVoDg6GBwZX6Noa6Mc7xJkFxqUKo8z0lo8k0clh1sRtAiNsbaafY6zD8upIB6qTDiGKH2Tm2FCdRZI8c4Ok17F0wrnjlPCLg5Sp0Ae51oHs0u6+sYqueLjsSkJrobUqHNbokQjtmvdhA63XMrZHjxDAPoSquM2LLvM8xdM+oy0tbG8zyD9yFqdauHk5ZTAB1+FlBbsAT1/ZkglA23iqx7Y0+1bEaoLQUQWG2rJzpz8SQD493dX8gjepcdzU4ES1sQE2xlEmio6t3D3aJP6nwmt4gsDAAFRCWzr0ikICW3sE30LmYnfWgV5vpV9HIP82wehOBd7xM4V3cid4kmTYseUnlX1fr4GV7SONo6OkXOUv6/xqpcigrTXkyJfiThNudBQ3yoCbabF84NKBr97R7cU4jPIUEkCBn6lwmWEEx7Hqll+PFa9R5uO4vzP7eUWi0M3DAs8boMMVsET/MbZBnHOg9ewhDvzvkUMnYNeMLAlGKWKNelAFQDosXM6CtV9gCskVfHnwiw407dwUy8/+bY00DkNbc5Xa6CDvp6HapZJLFlpY0bR7VMLtCmgxOe7CDOnyKAf5GQVWU8798H5jf5JjIVY+2y/m7XqielGqon0iqM+gjMqg5R8EN4Isn++yLssjAXaF4xqLvD7Atz4CWXqV9bzsQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(451199015)(38070700005)(53546011)(31686004)(41300700001)(66946007)(66446008)(66556008)(76116006)(66476007)(6506007)(64756008)(4326008)(91956017)(8676002)(316002)(6916009)(2906002)(54906003)(86362001)(186003)(31696002)(26005)(83380400001)(478600001)(6486002)(6512007)(82960400001)(38100700002)(122000001)(8936002)(5660300002)(2616005)(36756003)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aCsyd20zQ09jQXdOeCsrandUNVUwRFU4RGoxY1RVK1dZdzhIdkM4Vm9zNVdo?=
 =?utf-8?B?Y1lSOGI2bFBvTVpESGtvbjN5NW9yWW9vVXYzdFd0TUFuRVdGV1FBRUF4N3U4?=
 =?utf-8?B?amcrN2toelVqWnNVSW9peTcwYUIrdmZNV25TVWFhaXlDR3J5dGlQbXRTbjM0?=
 =?utf-8?B?U2lvQ1c5TjZpZHF0Qy9tdlpDNGpiZG0wS3c2Y3IxZXVsbmRYVmZaQlcrd29M?=
 =?utf-8?B?U1ZQSlNuM2lTUmoxN3AzOGpNb01JSXZkZ1lmeENpbGtCKzhXdnZJeW5XK2Rl?=
 =?utf-8?B?eVpnK25zQ3YwTWFSMlR3c3RvZlpISnZCd0Nyb1RCWk5YUi9qM1NiTUVRM1gw?=
 =?utf-8?B?RnNJSXVkamtuZGwrY0VRRXlCVU93ZTU1L0VyY2tGNkJOSG05Vk55TmsvNmJW?=
 =?utf-8?B?WjNXcGhseWhaWEFIeFRwUUhHZGpEWXVURFdPV0N6T1N2bnNkemdnWXhLZ2k4?=
 =?utf-8?B?MXo3a05SalJjRXpjcjhIOTJUSUFMQU5iMU1uWXB5WFlIeFVrdWFxc1NLOGVF?=
 =?utf-8?B?TUdOSTgvMW1PeXhaTDB4K3cyaUhZTE1IRHROR0lBM1VzWHhyNkpNczNYZjhY?=
 =?utf-8?B?djRqZXRHUHpWVU5rZUxNSnU4OTdrS0QvZkh0bkxDWTJub25vUlQvNnJGakt6?=
 =?utf-8?B?ZEJka0dnYnc4aDlUdlh6UTd0c29ReXo5bEpMM0dGeVE1NGdaQjh5c2NrY3Fx?=
 =?utf-8?B?ckdPQTRQcU5aWFkzbW8yTzVkNzNqSDJNb0dRaENXRHo3dmd0eEtjaUJUem43?=
 =?utf-8?B?cDNvSUlNODNIWWpMWi84Tlh3TnNWOGFLOVlTcmp0dXl1QWVhVTIrVkpMaGdY?=
 =?utf-8?B?QWptNDVUaHBFblVLUE1TTU5oMDdmeEZ0YjUwWEw1Yk9YQ1BFLzcwRC9waHhS?=
 =?utf-8?B?VlVIRTVIUlZtM1Zmak53dkRXcDhCVW4zUlZpWE9JR3dJcTJZNjhiUWx0Nk8y?=
 =?utf-8?B?VzloUVFDSFhLUzZzeUR6bjEwRXl2YmxJdEF1eDlJdnNleUlRd2kzbnFYOUFN?=
 =?utf-8?B?T3dieCttM1RjemVNU0xZcEZydTJycFp4UFZUZ3czVEREWEJSL1JVN0FSYnIx?=
 =?utf-8?B?YSs4SXFjMWZxTkQrMDhBeXBRclVlQlJpc1ZueHQyT0pNcW9uTk14WUNDTXdZ?=
 =?utf-8?B?cURoNVZGdHQvaTZvdTBoajc2SnpkZ1ZNQWlwYTB0VDFCRUpFRlVlYWJrNGc1?=
 =?utf-8?B?bnVJNWxMbEd4dmFHVXBVK0xyWkIzemhGa0FueHdCeU5JcGVuM0ZONGZtRUdC?=
 =?utf-8?B?NGdyWEtsK2hiK3E0dm40TzZKdjh1THJBRlpDd0c1Z24yRG9WS3RYdzZMdCsy?=
 =?utf-8?B?WnBEN0YrOFl2a3Aydk1OYjlUYUNLQXNUU0lOOVZRQlp5aGF6QmorRGNwZmNY?=
 =?utf-8?B?R0cxQ3VOZFFKQ3RnYmhDTlJMRFlkRVlRR1c1cGh2WElwaU1mWk5YVGF4cHpz?=
 =?utf-8?B?YTNEMitzbHVoa1YwSXhVWGNhaFZaTGZUT3BRNDhvbkVOTUo3QWJoQ0dJMTJk?=
 =?utf-8?B?NkVJcFFyM0ZaNHlFdHYzMnREaDAxRGZhZ29SVFBDWDU2V2tBQWJ0SjlpK0sz?=
 =?utf-8?B?aTVEaVVrck5jaFZsWllZUjVSU0w2dFVISmNZMmVJWWFRaFJoaTF0bkJjeU41?=
 =?utf-8?B?TWhyRVozMVZnbjBHeDBhTGRvOWpMdCtsUUdnMExDV0pkMGduMmpnL1lxeUJt?=
 =?utf-8?B?V3JVVmhKMTV0dDdzUmhKV0U5dkc2NjljVFdqVFVQTnhBNU9NT2FvaWQxNXIw?=
 =?utf-8?B?bHhTczBSblRFVjhuYXRnZGd4VWFQOHU5aUlnMGVmL0VqNzl1TEUrK3Rva0xS?=
 =?utf-8?B?eEFac3d4U2xZaGUzKzJtTXBDOXlmWW5JU3Q0VS9sV29RbVZPRzFjaHlET1J6?=
 =?utf-8?B?K3hHUTU0MDRDUjVyaHhFdWJlRTcrdWIxVnQvSVZhVVU5aWtjVHZwcFRycGxS?=
 =?utf-8?B?QUF5ZXNBK1ZEM1JOVVRaK01iYjdqckdLeXhkbWFVQ0dhLzlQajF5Z0FVN1lT?=
 =?utf-8?B?THFYQVdHUjNuUnF3bkYxbDFoZ1p4NllPOHJieERVNTdZUTJsR3ptWnZxZ0Zo?=
 =?utf-8?B?dGJVNXA4SE5rOEM1Tmx3dVFVUmZDalRxY1N3V1MzNjhhK0FVbS9pMlJVYU52?=
 =?utf-8?Q?It8kPRFIJfPqW90rrgbMNu64Y?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AA8B9985F017B41AE18BC62411A0977@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S3b/7Qz6Xw4UxshWtUYxuMWsS3DufwTYg29sgfxiA6aYJbYPqt2VVy12JCURjGThrPgWNZaUmCPaNJV8hk2iQSjj2oKPwF84fmmZtV4FaaKF/5vS6P9OgaEfs3Uo2gFtmLbF+f7ImWbX2JU1bIF0jEYcDjPKlCMU4rbJ8woy781wLTfAtiVbMBuqBpc82xtfbkTbHfONJPQJLuawbL5CYHo5IwAFaXweLyoGnozsFN6yI2D+0qjJ7MGHU469yMlriF+Th10s6+FPUbrjr18XIWcAOyycdQwmnMXaDcmxvAaSfXwl4YOJiKoaoTx2aL2K4ukMfXiwIQr1dwefCzRx4slw6ithlaa0tAvyZbeGG8dSKHur3tTu99+TTiCJtnjpV9pQNhayzYCOb4FzeWo6oEUN0kosB/hqZHzqm2N37+wfdGXRqgy6UfMdi2V3Th/GPMGzb3c9QUChwSH/eJFbfl5oJmLaXRFg9FG6kQ0bntROq33TjL5udV6LkM4XTbM05tFC7kN/+sluyBdLkt8rRJy2GuveYdh4+R5cV33bh82OmM14p8/AVbHzSgTamXdmSLxI7YJxWUrWrv1N4Emm6BwVtHyF04TRllOUr/9fDolnc64IELqpdQ1BovIcBS4ORRPdPE7OCyI2vVYnWTUfF/jpJs7HpC/vpYHHVPYoU4gpHAQeoMTjdGFFtw24cyKZrF96fO2egnMFylTzsl7Eko5DvL0LZApH6NW8DS/HFXeDVtxCFAFCxBVH3MnCAf6H8ASb1pgDlIl0TNEMyuyOCXefH1VT0pknUBgk01wPu5X+bU84IpQhT1smz8ev5raAIFjRnL3RTg2ay0CWqFCPAAxJNJTtliB42Zv7DMjRS7UM02kZ7zDxNZiZmW9UCwuw
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2cc64c4-edbb-42ee-88e5-08daedf1a098
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 01:18:46.3442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RT7KOKbm2v8+qj3Oy4Wt3bPQmuX4jweA1l5LpC+H4/RP2pjzzb1u7RcFqpI76wER/aPwXbk6+8I2R64s8gK4NSNs4u2ZzJ1ane3d23gLrCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6000

T24gMDQvMDEvMjAyMyAxOjEwIGFtLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIEZy
aSwgMzAgRGVjIDIwMjIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBQcmVzZXJ2ZSB0aGUgYXJ0
ZWZhY3RzIGJhc2VkIG9uIHRoZSBgbWFrZWAgcnVuZSB3ZSBhY3R1YWxseSByYW4sIHJhdGhlciB0
aGFuDQo+PiBndWVzc3dvcmsgYWJvdXQgd2hpY2ggcnVuZSB3ZSB3b3VsZCBoYXZlIHJ1biBiYXNl
ZCBvbiBvdGhlciBzZXR0aW5ncy4NCj4+DQo+PiBOb3RlIHRoYXQgdGhlIEFSTSBxZW11IHNtb2tl
IHRlc3RzIGRlcGVuZCBvbiBmaW5kaW5nIGJpbmFyaWVzL3hlbiBldmVuIGZyb20NCj4+IGZ1bGwg
YnVpbGRzLiAgQWxzbyB0aGF0IHRoZSBKZXNzaWUtMzIgY29udGFpbmVycyBidWlsZCB0b29scyBi
dXQgbm90IFhlbi4NCj4+DQo+PiBUaGlzIG1lYW5zIHRoZSB4ODZfMzIgYnVpbGRzIG5vdyBzdG9y
ZSByZWxldmFudCBhcnRlZmFjdHMuICBObyBjaGFuZ2UgaW4gb3RoZXINCj4+IGNvbmZpZ3VyYXRp
b25zLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+DQo+PiAtLS0NCj4+IENDOiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRv
ZS5jb20+DQo+PiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pg0KPj4gQ0M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KPj4g
Q0M6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+PiBDQzogT2xla3NpaSBL
dXJvY2hrbyA8b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+DQo+PiAtLS0NCj4+ICBhdXRvbWF0
aW9uL3NjcmlwdHMvYnVpbGQgfCAyMiArKysrKysrKysrKysrKy0tLS0tLS0tDQo+PiAgMSBmaWxl
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZCBiL2F1dG9tYXRpb24vc2NyaXB0cy9idWls
ZA0KPj4gaW5kZXggNWRhZmE3MmJhNTQwLi44ZGVlMWNiYmMyNTEgMTAwNzU1DQo+PiAtLS0gYS9h
dXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQNCj4+ICsrKyBiL2F1dG9tYXRpb24vc2NyaXB0cy9idWls
ZA0KPj4gQEAgLTcwLDE4ICs3MCwyNCBAQCBpZiBbWyAiJHtDQ30iID09ICJnY2MiICYmIGBjYy12
ZXJgIC1sdCAweDA0MDYwMCBdXTsgdGhlbg0KPj4gICAgICBjZmdhcmdzKz0oIi0td2l0aC1zeXN0
ZW0tc2VhYmlvcz0vYmluL2ZhbHNlIikNCj4+ICBmaQ0KPj4gIA0KPj4gKyMgRGlyZWN0b3J5IGZv
ciB0aGUgYXJ0ZWZhY3RzIHRvIGJlIGR1bXBlZCBpbnRvDQo+PiArbWtkaXIgYmluYXJpZXMNCj4+
ICsNCj4+ICBpZiBbWyAiJHtoeXBlcnZpc29yX29ubHl9IiA9PSAieSIgXV07IHRoZW4NCj4+ICsg
ICAgIyBYZW4tb25seSBidWlsZA0KPj4gICAgICBtYWtlIC1qJChucHJvYykgeGVuDQo+PiArDQo+
PiArICAgICMgUHJlc2VydmUgYXJ0ZWZhY3RzDQo+PiArICAgIGNwIHhlbi94ZW4gYmluYXJpZXMv
eGVuDQo+PiAgZWxzZQ0KPj4gKyAgICAjIEZ1bGwgYnVpbGQNCj4+ICAgICAgLi9jb25maWd1cmUg
IiR7Y2ZnYXJnc1tAXX0iDQo+PiAgICAgIG1ha2UgLWokKG5wcm9jKSBkaXN0DQo+PiAtZmkNCj4+
ICANCj4+IC0jIEV4dHJhY3QgYXJ0aWZhY3RzIHRvIGF2b2lkIGdldHRpbmcgcmV3cml0dGVuIGJ5
IGN1c3RvbWlzZWQgYnVpbGRzDQo+PiAtbWtkaXIgYmluYXJpZXMNCj4+IC1pZiBbWyAiJHtYRU5f
VEFSR0VUX0FSQ0h9IiAhPSAieDg2XzMyIiBdXTsgdGhlbg0KPj4gLSAgICBjcCB4ZW4veGVuIGJp
bmFyaWVzL3hlbg0KPj4gLSAgICBpZiBbWyAiJHtoeXBlcnZpc29yX29ubHl9IiAhPSAieSIgXV07
IHRoZW4NCj4+IC0gICAgICAgIGNwIC1yIGRpc3QgYmluYXJpZXMvDQo+PiAtICAgIGZpDQo+PiAr
ICAgICMgUHJlc2VydmUgYXJ0ZWZhY3RzDQo+PiArICAgICMgTm90ZTogU29tZSBzbW9rZSB0ZXN0
cyBkZXBlbmRpbmcgb24gZmluZGluZyBiaW5hcmllcy94ZW4gb24gYSBmdWxsIGJ1aWxkDQo+PiAr
ICAgICMgZXZlbiB0aG91Z2ggZGlzdC8gY29udGFpbnMgZXZlcnl0aGluZywgd2hpbGUgc29tZSBj
b250YWluZXJzIGRvbid0IGV2ZW4NCj4+ICsgICAgIyBidWlsZCBYZW4NCj4+ICsgICAgY3AgLXIg
ZGlzdCBiaW5hcmllcy8NCj4+ICsgICAgaWYgW1sgLWYgeGVuL3hlbiBdXSA7IHRoZW4gY3AgeGVu
L3hlbiBiaW5hcmllcy94ZW47IGZpDQo+IHdoeSB0aGUgImlmIiA/DQo+DQo+IFlvdSBjb3VsZCBq
dXN0Og0KPg0KPiBjcCB4ZW4veGVuIGJpbmFyaWVzL3hlbg0KPg0KPiB1bmNvbmRpdGlvbmFsbHk/
DQoNCk5vIC0gdGhlIHNjcmlwdCBpcyBgc2V0IC1lYCBhbmQgeGVuL3hlbiBkb2Vzbid0IGV4aXN0
IGluIHRoZSBKZXNzaWUzMg0KY29udGFpbmVycy4NCg0KVGhhdCdzIHdoeSB0aGUgb2xkIGxvZ2lj
IGhhZCBhbiAiaWYgbm90IHg4Nl8zMiIgZ3VhcmQgKGV4Y2VwdCBpdCBhbHNvDQpndWFyZGVkIHRo
ZSByZWd1bGFyIGRpc3QgLT4gYmluYXJpZXMvIGNvcHkgd2hpY2ggaXMgcHJvYmxlbWF0aWMpLg0K
DQpBdCBhIGd1ZXNzLCB0aGUgb3RoZXIgd29ya2luZyBvcHRpb24gd291bGQgYmUgYGNwIHhlbi94
ZW4gYmluYXJpZXMveGVuIHx8IDpgDQoNCkkgZG9uJ3QgbXVjaCBjYXJlIHdoaWNoIG9mIHRoZXNl
IHR3byBnZXRzIHVzZWQsIGJ1dCBwcmV0dHkgbXVjaCBhbnl0aGluZw0KZWxzZSByZXN1bHRzIGlu
IGEgZmFpbGVkIHRlc3QuDQoNCn5BbmRyZXcNCg==

