Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E004CAC73
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 18:50:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282531.481268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPT6m-0000ne-K4; Wed, 02 Mar 2022 17:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282531.481268; Wed, 02 Mar 2022 17:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPT6m-0000lI-Fh; Wed, 02 Mar 2022 17:49:52 +0000
Received: by outflank-mailman (input) for mailman id 282531;
 Wed, 02 Mar 2022 17:49:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HSw=TN=citrix.com=prvs=05368ea7b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nPT6k-0000lC-NN
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 17:49:50 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2672eac7-9a51-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 18:49:48 +0100 (CET)
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
X-Inumbo-ID: 2672eac7-9a51-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646243388;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jV+HGttWRMg/h9om4MtM6jMgMtGYDbiSm1WHHdoSZ5E=;
  b=JHhB3CG+nyUZyf/HxVL+Txfnj9j8YBoMwjY8oBRXmg/V3cRFO/KdYPwh
   wRznVj5s1UTgbzXZdp4b0cc/IQnQDQPtiAX651zOnMtqDwUMmw69kqXIM
   TU9mASRAAEYbfm/8TPqxIvpQ67GgqOFKxU3VxQxE63r+55UYnT5LclBGt
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65731401
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NRy+MauTIJm4bto1RnNrUb8PDufnVEBeMUV32f8akzHdYApBsoF/q
 tZmKTzQM62OYmSgLt9/OYq38x4Hv8DTzd9lTFY5qiFjRnlB+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV4
 4upyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8HMZTLuMQ2fSV4KCBkep8bypGeGT+g5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllJyz3DAOlgapfEW6jQvvdT3Ssqh9AIFvHbD
 yYcQWQyM0+ZP0UWUrsRIIwRk+uKp3XiSCxFklTLq4E86mXv5QMkhdABN/KKI4fXFK25hH2wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZ2gFyIgG0IThROUUC8p9G2j0e/X5RUL
 El8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO8M10Qat6oH63yaiB3JDfGNzRoUe89BjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtACzARVodt/xory9U
 J4swZL2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1bJ9aIWe4P
 haC42u9AaO/2lPwN8ebhKrrVqwXIVXIT4y5Bpg4kPIUCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGMqd9DdQ1RdCNjbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3VApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:Det6j6vM5lwIRdFCyHMEVZ5O7skC1oMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJh5o6H9BEGBKUmskaKceeEqTPmftXrdyRSVxeZZnMrfKlzbamLDH4tmtJ
 uIHJIOcOEYYWIK7/oSpTPIburIo+P3sJxA592utEuFJDsCA8oLgmcJaTpzUHcGPjWubaBJTq
 Z0jfA3wAZIDE5nF/hTcUN1OdQryee78a7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFuxaR3NThj9iLjjvnk0PD5ZVfn9XsjvFZAtaXt8QTIjLwzi61eYVaXaGYtjxdmpDs1L9qqq
 iIn/4TBbU115rjRBDynfIr4Xi47N8a0Q6n9bZfuwq6nSW2fkNgNyMLv/MmTvKQ0TtQgDg76t
 MX44vRjeslMfuL9h6Nl+TgRlVkkFG5rmEllvNWh3tDUZEGYLsUtoAH+lhJea1wVh4SxbpXWN
 WGNvusr8q+sGnqGEzxry1q2pihT34zFhCJTgwLvdGUySFfmDR8w1EDzMISk38c/NZlIqM0q9
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbJPHiJKVrqGakbMzbGqoLx4r8y+Oa2EaZ4gacaid
 DEShdVpGQyc0XhBYmH24BK6AnERCGnUTHk2qhlltFEU33HNczW2AG4OSUTepGb0oci6+XgKo
 KOBK4=
X-IronPort-AV: E=Sophos;i="5.90,149,1643691600"; 
   d="scan'208";a="65731401"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxWHlRa4/0ZxsI2LKm/aSXIPLjtfc9m/FG7Xu8YxFJw1MqgIkf4FN2X8zBBk/NAerPqSBIrKhI2C6zdb3SzS65wqNj4K7op4F3WqVV0NbiS3k3pIBZRkgKg9rxVCxErCrUqaiP8syU6iIQHdzrw2efNAzfv/k15Z23bJA19Su12zvdltt4IdphjmomHoi634NY+WgjEYc8an4VmGC2+BFt8n0tOwVc9bhpUPxK3PNlh/hH6ZUFgt76XGoGY5ibQPB/sIcqa5l7SUGJt5ee2EJh4/uqXkixPjCutJCdZcD45GpqCFvhxgWcMA+Zay/kUDTos8sXnZ3IS4ND3Us3OJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jV+HGttWRMg/h9om4MtM6jMgMtGYDbiSm1WHHdoSZ5E=;
 b=Ghkx1yYj2RHQpLvU+Cl1SyF9AsJW2ZnMWBHTjfo1cBsK85PLJLV+AK1emB+p2DorGC5pBCd9DL1xzwrbiEg7FAK0PAKoqTikd1Yq0Sp92zIqe8AMGK7854PPYFxxck0OFEv/J4jUV1B/FkSzAsGrD0oegSliUKz/vllY1xMmX65QUXf7LL1awyTfrkonRt1JPA2KbhEMYC4STpbxyNmdz+FQNC7+TOURJ2HbbNsNsigWc2Vviq4xClt0Rqe4xOhlyATyiaMW64Q2wmZ3Zt+zmxSNk0OyCI0fpuL0Dc1PCydcu/zYEvouFcxjgFX0T/Xc3N2y6sbKTKTMXzxj8JkFsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jV+HGttWRMg/h9om4MtM6jMgMtGYDbiSm1WHHdoSZ5E=;
 b=taQvnmJUKxgqS+t1/py4Yjp4IOeSkZzIhq+vKhPiPzFZDHdY5eU+KUlGj+uKA8ONpi+03DD/jGfp7cWuzlGODob3M+kduQSug3j48fwxtlo5I8XTTTaZrVI0duBqfZBrY3L7cGwlqydaHEFeGR58/NQDlWMwlurqr74LaO/V3y4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Alex Olson <this.is.a0lson@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: PIRQ handling and PVH dom0?
Thread-Topic: PIRQ handling and PVH dom0?
Thread-Index: AQHYLlrY/dua2GHNF0yeezsM7bCSAKysXvKA
Date: Wed, 2 Mar 2022 17:49:14 +0000
Message-ID: <6ad3e3f9-0d3d-4223-0951-0f8ee7fa4b8b@citrix.com>
References: <7c85d28831f3f30fb61bb359a23f570c34b4d31a.camel@gmail.com>
In-Reply-To: <7c85d28831f3f30fb61bb359a23f570c34b4d31a.camel@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0ddbe0d-7167-43fb-3b1f-08d9fc74f74d
x-ms-traffictypediagnostic: MWHPR03MB3005:EE_
x-microsoft-antispam-prvs: <MWHPR03MB300545442B1ECF9F906673F6BA039@MWHPR03MB3005.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V/ospENK9Oo3zuTfdTPiF9gJVodypaNkAQv2nYMP630xrxPz0JLG3oR54avlnCPMgND6oT2lUcxhGCij/6o3N4zFDqKlA0oDFQ7PV9VkM1CT/V/2rYdFbY0u4OJFC3+klz5azKoA6EEArJM5VlAD3JB3FVezcubloH2fPtUKxGPrSTfVPm/Rn51RPY8M37XiVpLxQUzFhsp4mTP2yxDSxreLlQX8+OCDHZLlY/DBsNI7KUBvlMZ54dR4w/SR4nEv+Qtiu8qrrb9QD9cupvGjMxz6LUmWkqerWAz/ICGVapGVvWSmnTqazTerqi5+JfEAdOZgR97dpUM2qHBZ+W4cLCDtaKuKIriiRUBeriHQfJtk89wsyLL6O9gyERLug5n6mXGeE4nWxoqZqZzev0QXFN/18p0LjGzzdGgEUlPV/zLDtat3mr6ZGN363jGGgi1ZpsRZgWo5ltxMIkJsyrLnOfYnXybMpfqLSvkq3u+JL7xns+2n5Y9kZuJHSofA35Qc3VfeEhRiZt0dV7YTUBTzTojqiewcEI9H1eoHp1opxJtfmddbun1DU1wMTfP9cnaYPyaL4L5qJFga+6loMd+zdkb6IYvoAOSyE55Qs+bS92ZdB5m/AYR0n4dgiTXUVSFvwAp7g0dTHjLo6BVD9qC8ic0hIq8mKYJ9G/+PdjfUGqGs42Kxgq4zjCfvyv+DT5O+H4ugD7fNslcNpYRke6sk5EgtdvU3yxGy/O6k3pwAlNqxhZzRz86ObEXnzwuSkjgp1f73te+TZU9rWtl7IAQ+0w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(38100700002)(8936002)(86362001)(31686004)(53546011)(2616005)(316002)(6512007)(6506007)(26005)(186003)(110136005)(83380400001)(107886003)(8676002)(66556008)(4326008)(66446008)(122000001)(66476007)(64756008)(31696002)(2906002)(508600001)(91956017)(82960400001)(66946007)(76116006)(6486002)(5660300002)(36756003)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkpwbGFDNVZHVWNvZHdjM1duK0FVTVhrODJBSlVxMVNTZUdoaDNUQm5oVVE2?=
 =?utf-8?B?N1Frd29oUy9iUG8wckRnYTRPYkZWMU1rWk8rUjJuTWNPTXdROW5qM1pFbVJT?=
 =?utf-8?B?SVlOV1U1TDJjeFVOT1dxTkdTT2xCQndQNnptTE1zUGx0b3lQSWRiU3Y5eENG?=
 =?utf-8?B?R20rMVNkcHRMejMrd2FGb2dydlJ1SlRvNzNsRVhsNkhrRUc3SUJ4c2d0aGpy?=
 =?utf-8?B?ZnNFZzJqZEtxbVhZc2x5cEl2Z2pnZXV6UnBZQ0RTZkNRS0tPRW9MMFhoWURP?=
 =?utf-8?B?NzZTYnlwQS8vdzc0SmJJWVFuRHpoSVhYWHpxR1NjbGlWUWxXRHJEM3Fmb0RO?=
 =?utf-8?B?TVBVRjNySmlzK2ZCY3h3Z0dxOE45K1gxVHhYYUd2OG4xaGU0NWxSait2bzg5?=
 =?utf-8?B?QVlEWGNKTEY0QjZ5NlllcmNLdFcwOE1oRkJUcDNMbWg3MzlXMUpxalNMVFlk?=
 =?utf-8?B?angwdzlLbmlPRjZLbWJjR01ubzJkaHZQT09lQzhDYndvNTZ2UHo0N0xnODZT?=
 =?utf-8?B?QjN3VUp3OHFBby8rQ1Z4dnRXaGFVeDNMKy9FTW9hai81b3NsZG92bUxXVTBa?=
 =?utf-8?B?TXQ4YytoaG00TnVKUm5xOEFubUpkbVVyZ0YvTWhxT0NkUFd4c1ZYSmRUUFV6?=
 =?utf-8?B?YWhNYXUxbEkraVJPNm5kMnFGdmJoYUNIcUFMNXp5aGhYTzYxTldwY3hRbW4x?=
 =?utf-8?B?b2U1NTIwb2hjT0YzSldhVkFOcDJ6S0psQ25GN25PMHUvNjZQMDN5aUFnZFc5?=
 =?utf-8?B?dFd0b3d6Nk5VeXdVMElLM09UQVZFK3hIUzBRaERoaDh1b1h5RnQ2c1FVK0M1?=
 =?utf-8?B?bVlGTVgxUm9SbjRoZWtKREhKazFORDB4cllxWW56NVYrR0U0R2tnVW1DNGEx?=
 =?utf-8?B?QkVuOHd3ejd3dUVBZlI4OWdPT3dDRVgwbGFhSG9rMjJUampZbWJPeHNtS0Nr?=
 =?utf-8?B?aFQ5ams5cHlCMHBQQnJXcHIvN0pPR2NYZWZ4UFA2SGxQZnFFdFlvTGd4UFcw?=
 =?utf-8?B?WkpVckx0OUdyU1BVclhMR1RyS0FKeFdoVmxxeWpaUlJkRUxIWWVhdTQ0KzZR?=
 =?utf-8?B?YW4wVm1DSzBoV3gxaEtNWkdFTU80bDc5YmFkNmQ0VkxYZG8ya3JvUXpSczBn?=
 =?utf-8?B?YkxLLzgvU09UZ3JCV3ZMUDFXc3dIYjJFT1B1cWxtOUREYk5sZGg3bU9WTXhL?=
 =?utf-8?B?SHZZWnl2THhCYS94cHk0WGw4ZVA5cUZ4ak9RdzgyNWVlVVl5WjFsd3liOXJ5?=
 =?utf-8?B?bnZOZzFWK0x6SlV3SkxnS3RWdkt1YjB5T0NKTk9BR3RENHljQTI1dnJzZ20w?=
 =?utf-8?B?Z1VnVmFWbjFtcSttVnVyYVR1T2tjUzdkc2RQR0MwZTZ5a0JPTXFPYm03dnIw?=
 =?utf-8?B?bVdNeWhnSjVGYUo0bGE0bGVrT0FuWmZRb2xkWEdIMEk5NGszbGZwbjRzamxo?=
 =?utf-8?B?Q0FDelloNy9aVFNPeTgySkVIMkpXaUxZSEJ3ODRnd3Z6VWtLZTRQKy9uVTJV?=
 =?utf-8?B?WlZLUXpkbkdhdlNzelNMbEJIeC9PT3A4OEI2eG4vQ1d0TWUyQjhRMzgvNXpS?=
 =?utf-8?B?WnluM1V2bmFUblhzNEZXTFFYS1ovWnYzY1c1NGRqeUIyZW1qamNjN0FWLzdo?=
 =?utf-8?B?cmNWMDR0SFVtblRFbUo2cHE5OTJ0UDJOVTYyemNiMU5wTkZXdXJYYkpxdmNZ?=
 =?utf-8?B?VHVzUG5wK1o0TTJiSDZJQmkzM1BBRDZMZ2VXQ1dzRWdWSFJ4ZThHT09ZUVhG?=
 =?utf-8?B?S3E4cTdXM3ZHR2pLb2RMc0JBVU1LRXFUOHhSaVJReCsxSmZ4bHZvZUVyeWV0?=
 =?utf-8?B?K1lnQld3TityS0o3cXBnR3czRGpVdXFGQmhnQ1R6em9RRHRvUTlXUTJtVDNV?=
 =?utf-8?B?RDVJRzRkYjd0S1MyU1F4aVA4YTlNMWtZMk91WlllRWM5d2haMG12Zm51dVdn?=
 =?utf-8?B?Z3ZwcUdqaVBlY2M0Y3RNQ0F1VUxmR1lsZUFkYzNrOFBzY3UxSFg5S2NKVEl3?=
 =?utf-8?B?OGhrd3VTYWx5djF5ME9JMUJrVEpHdXQ5UzJ1RzgvRFNaTGxmVW90RWN3ZVBt?=
 =?utf-8?B?U0xnMDF2Vlpsa29qNktXcHRWSzg2NTRhVnJmR0hEeUlvZlpDczRBTTdidWQ5?=
 =?utf-8?B?cVFQcThNYmoweGVyeWpGS3FOd0p4Mllwbk5LeFF4RTNRNkZHdHZMYWRLaEgv?=
 =?utf-8?B?elo3eHY1T1ZyOXVUM0xFUVhUMXJXNGkrNXhJOXhXRkJ2dFV6bHQ2eGVkT2ty?=
 =?utf-8?B?dzF5M0ZrTEZUZERYMXVpdENPQjF3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C006F8F0DEC7584B964565EFDF8552D9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ddbe0d-7167-43fb-3b1f-08d9fc74f74d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 17:49:14.4294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OuO71YkAHWUMnmzqVljyxVdGR8C0oOJ/CPmH1Jnx2K7LNFlO/yitRnoEKUos+3NItDCxfR5yuEFEXZQkB8SaXeA4bF0LGjpGDSmuJkuiIDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3005
X-OriginatorOrg: citrix.com

T24gMDIvMDMvMjAyMiAxNzoyNywgQWxleCBPbHNvbiB3cm90ZToNCj4gSSBmdXJ0aGVyIGF0dGVt
cHRlZCB0byBzZWUgaG93IGZhciBQVkggZG9tMCBjYW4gZ2V0IGJ1dCBoYWQgYSBnZW5lcmFsIHF1
ZXN0aW9uIHJlZ2FyZGluZyB3aGF0IGlzIG5vdCB5ZXQgaW1wbGVtZW50ZWQuLi4gDQo+DQo+IFdp
dGggYW4gaW5pdGlhbCB2ZXJzaW9uIG9mIFJvZ2VyJ3MgcmVjZW50ICJ2cGNpL21zaXg6IGZpeCBQ
QkEgYWNjZXNzIiBwYXRjaGVzIGFuZCBhZnRlciByZWZyZXNoaW5nIGhpcyBlYXJsaWVyIDIwMTgg
cGF0Y2hzZXQgInZwY2k6IGFkZCBzdXBwb3J0IGZvciBTUi1JT1YgY2FwYWJpbGl0eSIgcmVnYXJk
aW5nIFNSLUlPViBzdXBwb3J0IGZvciBQVkggZG9tMCwgSSB3YXMgYWJsZSB0byBnZXQgYm90aCBw
aHlzaWNhbCBmdW5jdGlvbnMgYW5kIHZpcnR1YWwgZnVuY3Rpb25zIG9mIGFuIFNSLUlPViBuZXR3
b3JrIGNhcmQgdG8gb3BlcmF0ZSBjb3JyZWN0bHkgaW4gUFZIIGRvbTAuDQo+DQo+IEhvd2V2ZXIs
IGl0IGxvb2tzIGxpa2UgYW55IFBDSS1wYXNzdGhyb3VnaCBmb3IgSFZNIGRvbVVzIHdpdGggUFZI
IGRvbTAgaXMgbm90IHlldCBpbXBsZW1lbnRlZC4gSSBzZWUgdGhlICJQSFlTREVWT1BfbWFwX3Bp
cnEiIGNhbGwgZmFpbHMgc2luY2UgdGhlICJlbXVsYXRpb25fZmxhZ3MiIGZvciBkb20wIGRvIG5v
dCBpbmNsdWRlICJYRU5fWDg2X0VNVV9VU0VfUElSUSIuLi4NCj4NCj4gCWxpYnhsOiBlcnJvcjog
bGlieGxfcGNpLmM6MTQ2MTpwY2lfYWRkX2RtX2RvbmU6IERvbWFpbiAxOnhjX3BoeXNkZXZfbWFw
X3BpcnEgaXJxPTE3IChlcnJvcj0tMSk6IEZ1bmN0aW9uIG5vdCBpbXBsZW1lbnRlZCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIA0KPiAJbGlieGw6IGVycm9yOiBsaWJ4bF9wY2kuYzoxNzgxOmRldmljZV9wY2lfYWRkX2Rv
bmU6IERvbWFpbiAxOmxpYnhsX19kZXZpY2VfcGNpX2FkZCBmYWlsZWQgZm9yIFBDSSBkZXZpY2Ug
MDo1OjAuMSAocmMgLTMpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+IAlsaWJ4bDogZXJyb3I6IGxpYnhsX2NyZWF0
ZS5jOjE4OTU6ZG9tY3JlYXRlX2F0dGFjaF9kZXZpY2VzOiBEb21haW4gMTp1bmFibGUgdG8gYWRk
IHBjaSBkZXZpY2VzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IA0KPg0KPg0KPiBXaGF0IGlzIFBWSCBkb20wIG1pc3NpbmcgYXQgYSBjb25jZXB0dWFsIGxldmVs
IGZvciBQQ0kgcGFzc3Rocm91Z2ggdG8gZG9tVXM/ICBJIG5haXZlbHkgYXNzdW1lZCB0aGF0IGFu
IEhWTSBkb21VIGd1ZXN0IHdvdWxkbid0IGNhcmUgbXVjaCB3aGV0aGVyIGRvbTAgd2FzIFBWIG9y
IFBWSCBpbiB0ZXJtcyBvZiBwYXNzdGhyb3VnaCBkZXZpY2UgSVJRIGhhbmRsaW5nLi4uDQo+DQo+
IFRoYW5rcw0KDQpIbW0uwqAgeGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYyBodm1fcGh5c2Rl
dl9vcCgpIGZpbHRlcnMgbWFwL3VubWFwDQpwaXJxIGJhc2VkIG9uIGN1cnJkLg0KDQpCdXQgdGhp
cyBpcyBidWdneS7CoCBJdCBzaG91bGQgcmVhZCB0aGUgcGh5c2Rldl9tYXBfcGlycV90IHBhcmFt
ZXRlciBhbmQNCmxvb2sgYXQgdGhlIGRvbWlkIHBhcmFtZXRlci7CoCBXaGF0IHFlbXUgaGVyZSBp
cyBkb2luZyBpcyB0cnlpbmcgdG8gbWFwIGENCnBpcnEgb24gYmVoYWxmIG9mIHRoZSB0YXJnZXQg
ZG9tYWluLCBub3Qgb24gYmVoYWxmIG9mIGRvbTAuDQoNCn5BbmRyZXcNCg==

