Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC5563F224
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 15:00:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450751.708179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0k6a-0003yV-DO; Thu, 01 Dec 2022 14:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450751.708179; Thu, 01 Dec 2022 14:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0k6a-0003wf-AP; Thu, 01 Dec 2022 14:00:00 +0000
Received: by outflank-mailman (input) for mailman id 450751;
 Thu, 01 Dec 2022 13:59:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmm5=37=citrix.com=prvs=327587bd7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0k6Y-0003wZ-Bx
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 13:59:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f27e4d6-7180-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 14:59:56 +0100 (CET)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 08:59:37 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5195.namprd03.prod.outlook.com (2603:10b6:5:240::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 13:59:35 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 13:59:35 +0000
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
X-Inumbo-ID: 6f27e4d6-7180-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669903196;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PMPnxgIzo7ykEuiZkyBSQB0i85IGY7wDUm+O3cK+iCA=;
  b=BnI54CBZ5cE/Z4vTUnNK2kF1JB2gBsBA8hx4j/Y3d5X3QXQ40YY7eG//
   nEm35iBn0lAjBq3tzDk+e+dXk8CKTdaLy4LRDPaVv72v8JmL5dbVU8Azs
   U/yEkJlQP29w+QGEFvKdcaxuXIjmZuOUTFu60HrpGzBeCVYsmhQt/dU7v
   M=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 86057461
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:31KB/a8xxNOsp2QPKJeHDrUDoH+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mccWGmPO/fZNmH0c9t1Pdi3ox8DucTUm9ZiGlds+Sg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnP6gS5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkli+
 dwjByEmMSndiuCmnYC9bulotsc8eZyD0IM34hmMzBn/JNN/G9XmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTaNilAquFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAurBtpPS+Hmr5aGhnXIxXQDORQ1W2C4+/ajyX6bRd1TC
 VcLr39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOuMYoSBQw2
 1SOntevAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACA4aud/qpdhpigqVFoo4VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraT1sTA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:WfrL2KxMUQmdrm+1qHGfKrPxBOgkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2jnC6l87nzFjmfx1M7XylUybkv3G
 DZm0ihj5/T8s2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHBmxulf4NoXpyFpXQQrPu04Fgnvd
 HQq1MLPth16VnWYmapyCGdlTXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MJ40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIWLH5AJlO+1GkUKp
 goMCju3ocRTbpcVQGBgoBb+q3pYp30JGbffqFNgL3P79EcpgEF86JR/r1iop5HzuN8d3AM3Z
 W7Dkwj/os+MfM+fOZzAvwMTtCwDXGISRXQMHiKKVCiD60fPWnRwqSHqYndydvaD6Dg9qFC7q
 jpQRddryo/akjuAcqB0NlC9Q3MWny0WXDoxttF75Z0t7XgTP6zWBfzA2wGgo+lubESE8fbU/
 G8NNZfBOLiN3LnHcJM0xflU5dfJHECWIkeu8o9WViJvsXXQ7ea/tDzYbLWPv7gADwkUmTwDj
 8KWyXyPtxJ6gSxVnrxkHHqKgfQk4zEjOdN+YThjpsuIdI2R/xxWyAu+CSEz9DOLyFeuaore0
 Y7KK/7k8qA1BuLwVo=
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="86057461"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQEVRYQNvpiaITEGBJwoPlEW8EfWeRggyQsN9bhDyw9d9n573VduqJCOfmhX411//prRSQPGvsuiiYnVOXSrR+GpzAZaP3pvK6hKKOh0pWUytRMgivU72hC9oSChjTbO84wzArOtz5bC3r3iKnPGOxZlpAqhmJz83aJyk5UNKYORNkoyq6RzbWYfVT0kgZdEWd+9FQcQARwk8qZFI5uNT0Xk9tFyP9sHu5D1G84k6NlwREm0KuQO/vGiCJxoNdjrNHBBFQ5nI7QrLKa7XsjqywL/mh4g2jPEuFWsjodItv0SY0Cfc3udcKqZx7/Tprbdg2nceE+8Oy3rGGy38wjMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMPnxgIzo7ykEuiZkyBSQB0i85IGY7wDUm+O3cK+iCA=;
 b=PpKlTr1sc26JRPEyosFYVyWVe6jF3e7Zl0Uue9PGCyQXrkF7Box+2EJ4QdAA10A390GTERdE1Q2LiwgWk7XNwXUJl4PXotDyVZM6xpbWYjMGFAKjYxl4w0uzhJWa+uhM8YAoni9iKoWics0Xy0oPl7wWg/ywWu+CVtUZrECjHN4Eqa9JUjLWpEHz2WiTZQWGVnx6L/rN5ip+ksJy4crnc+XhZJJs/J8IN6jiD7znuO0ELTkBtQwUMz1v8rsj99wsHRmCK756IzpI14qZGffaAr5R4MlXh3Ks3iycozHnWdQzQSQ6N0t55uKr0PN8pHR1FlYuLYNDvTgSv774wqOvLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMPnxgIzo7ykEuiZkyBSQB0i85IGY7wDUm+O3cK+iCA=;
 b=QiqXoXUReOoWAqx2GfFTo5no64QMAicYHNQbYCnEJWo+GXv7Vbsp70FVFBvIXW/rYtNay2WlXsNrsAXmSjubRphPhjQ1b4cOL9LZYXSRWaH2AmsSmK9ep5LtPqedelcbqPNcZ8ccwrTtW25xXh1qUk6Fyg14yC3Iw2eXJ/2Hak8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v1 2/5] tools/ocaml/libs/xc: add binding to
 xc_evtchn_status
Thread-Topic: [PATCH v1 2/5] tools/ocaml/libs/xc: add binding to
 xc_evtchn_status
Thread-Index: AQHZBOHxNXiRQvtogESX/t4C8rGLVK5Y590AgAAh3oCAAAbKgA==
Date: Thu, 1 Dec 2022 13:59:35 +0000
Message-ID: <f32ccd3c-0a68-ef39-296f-8071aed12453@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <4daa8daa6398774e5cb0a90c30648c970faed6af.1669829264.git.edvin.torok@citrix.com>
 <71ff1c99-4006-dd28-e01a-4c2946798f78@citrix.com>
 <EEEF329C-788A-41A0-BDC5-9E42ED07416B@citrix.com>
In-Reply-To: <EEEF329C-788A-41A0-BDC5-9E42ED07416B@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM6PR03MB5195:EE_
x-ms-office365-filtering-correlation-id: 2ac4cd7b-aa37-4e8d-53c7-08dad3a447ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ItzToTgBM8YZOFJHze+7Q7BxztLtl3kUA/kbbxUPtMkZ7gy24BRImjMNhxxuUqWDaG4GYZ5s5YTj9Bf5LeN1OweUzzsbVz/VKFOo5ttUfFhEmZ+fnMw+I8dQndrljIUTZZZf/gKHorZsl0lKJy7IKmMuGC47lmxoa2KkXdf8EmiRgKXURF77HeldvHsFycNUihUb8pC1P+VBCnLZrjfqtoon1sC14tjzTcjGIwwzsuk/PI0P2laZ5Fk6TBH9PkosaSInWtN6eJcf9UP3Db/m7xeT/eii+CWnJfvHoeVBCXilgPzRVoQwl+fwwIc2Xi/n+2SqAxAzDIZepfckQ/tcmRFicldCmtB+jbGWCD7uSVjb1TNwQLeMieXEqPhx9TLJ9gJPUFYpTAPm70oX34U0Bcluu1O1ZlyjcLjV7v74HDxz+Q4cdBpjM7lO9b81IOu9tcSoeg1bhaRRFRpG3nRRp9wf/JRBjPHGVkhEEcjpbD29L0VpiAwmlOAaQZ4ylU5feKj+jVd6WdONzYpV9CrxXwDqWFxDHfqrYYJwS0jkyM6a6fD4iQWyGR1Y89LIOibZNQAic5NorO5/YPcoqXaMiiv1T7muTZJsBTgzSGL6wR2Vjb7a3xlmwa/J+XdCxnHkzs7qqE2G78N4dp2JSpRjBp2hDF32/dMK4yQa1bB4xvykY3Hg711bgMOQ+nPy7gEkLsi2BUJjSqAYawsEk7+/PsTlT8WzJUPqTb4DpVmzO21q6mGXwWvug+9ngK3CDKpCkJbYI9TqMi2lplWF4TlfTA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199015)(5660300002)(36756003)(6862004)(66574015)(41300700001)(2616005)(6636002)(26005)(8936002)(66556008)(64756008)(4326008)(66476007)(8676002)(66446008)(122000001)(76116006)(2906002)(38070700005)(38100700002)(91956017)(82960400001)(316002)(186003)(6512007)(54906003)(66946007)(31696002)(86362001)(71200400001)(83380400001)(37006003)(6486002)(6506007)(107886003)(478600001)(31686004)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2JxejJFRU1qWDNhTWFLbVdIOFFPVEo5R0txWmo2RHJPam8zY21qR2huWnd3?=
 =?utf-8?B?M25XTmp0bUd1b3gwaUdnNFpkbDBWWkpjREtDYnp3RXUzUVc4TTRCVUVHMUt3?=
 =?utf-8?B?ME81aGh2UjB1MTZrY3RVdk13OFQ2R2lIZzB2WUtJV2tORTQyclhpeXBtZ0N5?=
 =?utf-8?B?ZW9zbTAyNllZa2ZlL3pjVW5zbVZ0WVNvODkxQ1lLM2F6cXRjVmovTGFXVDNW?=
 =?utf-8?B?bmZMTFVJc0V6MjVtenl4U1Z2YVhZN3VzVi9sNnVMY0swVFllQnlQVmpXVnJH?=
 =?utf-8?B?VjcwSUVJelBlenVUVkJIQk96QW4yKzFGWWRFRUNNN1hGRUJxM1RDaGcrR0d6?=
 =?utf-8?B?UTFFTjhwSTJKMVFDdVZoUm5OaEx1Z1lHUVpQRXJnMml4ME5sOHhNZ2JMSlhw?=
 =?utf-8?B?OExtQUtMS1hkWFNiNUErMWovQjNSM3IyMmJZNlBLVUVyRkRnYjRETTd3L1FW?=
 =?utf-8?B?NEhCZDVvNjBoMDdmWFFsQkdBSjdaa0NCdktuYXBkdE9iUHZESTVTNlNiS0xR?=
 =?utf-8?B?YWhuWldiYTFIbktMVFRpQUtoeVh0TUdSUmtxWjFReVpIbElodGtqZXNtbzI2?=
 =?utf-8?B?QjBBbmFBcHg1Y3BxQWlGY2pTK1V1djdUcVJOdUg4Ym9IUkQ3cGxaTjRDTS9I?=
 =?utf-8?B?djZDR3Uvak9PV2o5cnFGclc5ZUpxRHVPaDZQdmRGOXdKSG9jUThvS2NUT00y?=
 =?utf-8?B?RENieEpnckFCb09xWFh6d3ZqYkE2dmVoZzVJZVkzVGFlL2h2Ly9YbXBrbUxq?=
 =?utf-8?B?MkxENmVOZ29nOHk4NjNEdytGeGdEUEwyQWIyWFZQWTZ2bEw2OVRaeW9uRlZy?=
 =?utf-8?B?dDZSR1QrMDJDRjhCdDVpblpwU2VFZzZ5dm5oc2FCWDltbWU5cUkyTlZnWTRT?=
 =?utf-8?B?TUs3bDlFQXpTM3I2M1RzN0FVNWVPRWg5ZG8vWmd4SjBXaTlFTm1xczg4c0hC?=
 =?utf-8?B?SEZEYjJRUURzcWFzbkllQnZwb0JmYXRVNVhEMEVaM2oxbVRzUlE0dElFd0Nx?=
 =?utf-8?B?NmwrQ2JRV2NSSk1wMkxidHg3WlZvUnpyQmRVaDkrUVkwZ3MvelZoWEhObytu?=
 =?utf-8?B?TXZmYzZ2ODNXMWJxcVN1Tm9ETENxaVdSeStCU0lhczdTb3NmeG15VVpwOVpt?=
 =?utf-8?B?U1ZqVCtvNDgwTE9pejNaekNIRDAxWDZnVVBJZXRxTnNLZGpxTU5wN0VvdWR2?=
 =?utf-8?B?UGFBRHk2dDRpWlFudGdrZVJDWmd5RHdWb2dzcE1HVVFuRkJidCtrdDlhSGFL?=
 =?utf-8?B?WlMxVEtERzNXenFpc1E3SUkzQnh4QkpzNk1kSStPTDF3ZUZoSEVOdEVtd2tu?=
 =?utf-8?B?YUNhdzQzMXZ1NlEyTTZpZ3Q0R1RRUzloeVpmUlZHNGFMYVJkR0lKVk41MDNH?=
 =?utf-8?B?akJ4czR3cXoyWWo0UTR3S1YydGtYY0prenFNTHd5ZmRUWTg4dmlOMURub2tE?=
 =?utf-8?B?T081RzJGdDdqeXZaT00vejVuM2V2Zk1zTG5MTGF2OW5vY0VRNk1uYzJIeENi?=
 =?utf-8?B?V0NYZ2MxbmtJVWVKZm5HUnVQZnU2TzVvTmdmd3drRjA5clU5NTl5THgvWDNX?=
 =?utf-8?B?S1ZNZmM1ZVBnQmxSOXkwTHVrbFUraEdrd0c5WDk3YkNMeGVha1ZwLzV2VEJz?=
 =?utf-8?B?eFpUbUZjZ05nOGlPeHM0THA5WVZrODY0LzR5RTZyUlZWeXFXTW5IWmRkZFd4?=
 =?utf-8?B?UEtoY0MwZ1JCVUQ2ZzJ6SWxvTjV5djl1dFJyUHNVeXZiN3VuT0ZIUkU3cEtP?=
 =?utf-8?B?TkhMRHRmZlVEN2w4TURYMVo3STFNSitIc2ZtTXFmdXkrLzE3UjEwTGtPcnhr?=
 =?utf-8?B?NzZiSVRsMWlYTTJETTFPbnVMeXNtUThEbnZXTFo1eFdIMnI0ZmpkdmFhUEN1?=
 =?utf-8?B?Qk4xQ0lFL3M1Q1czNTVqMmJYWi9TdVI4YnFtWGtOODJUa0o2bkdRZHhpZUx2?=
 =?utf-8?B?SVpTMDQ3Yk52dDYyM0hvK1JyWGtMa05pQ1Y5Q3FUMTB6RUpBbnh6UlB5dnFN?=
 =?utf-8?B?TlBuY0hqRXBpUk9OSm52VWZwcHczWkFkWEZ4c0piTkV4Z245N3E2MHFPWWhP?=
 =?utf-8?B?L2VrRm1LeWRXVHpOM0Z3c3FCa2NqdVFhbERWYlpRRGN0UkoyajBPMmRNTi91?=
 =?utf-8?Q?kssNN46wOHFhLsEDLQ8FkAaBX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E8DD1F5C125394FB0AEDE27C9D506F7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qb4CFWoozWI6IWF1VocEY+YGAs/MqRZ/j0qys21Q7ycsPwHX4iBvAyuWYTzIxTALtbbVzknr4rZ/lmED7LhtSJp0oiAg2UU7aUPo5QT+tyt5Inn+L2g6lwRlzQw/zgQFPWprye5aShtM8XN82CFgE10lfVUdkRjfqBHBjG/RX95P1yfAppoBOlRYLX77XvmEsCDLg/RKnzD527q5TWsA32EQlYPjv07e/s5nTVYxBOZ6BKdBwo7r82/6AGbYZe7hDodkh15ew/3oNUgkIjrG8z0ib1letD9yt7OuPUO+4DF4dmnuzpn6s509zCCm0imcDp2EkZKpBSCd8NvBxX4NyIqcQs940zAdq0VGbiJ1iV5jY6xfqwkoErKXkpIUGy02jjHgmMVfvVHMW8Kd//HjljYXOaS/n2QvYvWqRnag1TtFOlwFkVfc0MOFRqoxy1yvYCw2VRIsGc00nqJESzsUxa+7M5VCpunjnYFaYUKr2fWDQAgJfUJuSwPi8LgM32QMVaNJHFc4p9e8goWqCadXf2cEWx1CZjdM4cIVXwjXhCouQRAmLuz00p747Q8VQo9Vp6gvvzkVRTFSjpCpPopAoKOo3A0Te5AkiBCQqHdlZeGfLsrJ9m9mowBurkDx2NsQfrsQB356AEKY3VJoAkLDPPGTOID7vBxAmnDduuj5ILP/KvQpr6x4dj99K2JPgr3SgUJT5QIJv5NL1ixtNjwCWydcTXu+0F/z05GNw72Hzr75cr/4ca+QQBhEmle5vdcp+Nhe6mcjFCvtT5AgkGRzQiZOwBKoQxoVDMoRopOQ42r4KjLm0/EEDthePpGbn811mIcAmcpIzYfDy5OIBDxOnQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac4cd7b-aa37-4e8d-53c7-08dad3a447ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 13:59:35.6697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDnGoEp9nj0T/NNxUQ2WOVdL9bOJQRyKmSgQRFjLFWN9lBfKutZiJ1AEBIVtR49ywsx67wHN9XJ/qh2Sttvo6y2j1naYQ0QN9CjYRITiOZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5195

T24gMDEvMTIvMjAyMiAxMzozNSwgRWR3aW4gVG9yb2sgd3JvdGU6DQo+PiBPbiAxIERlYyAyMDIy
LCBhdCAxMTozNCwgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6DQo+Pg0KPj4gT24gMzAvMTEvMjAyMiAxNzozMiwgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4+
PiArDQo+Pj4gKyAgICBjYW1sX2VudGVyX2Jsb2NraW5nX3NlY3Rpb24oKTsNCj4+PiArICAgIHJj
ID0geGNfZXZ0Y2huX3N0YXR1cyhfSCh4Y2gpLCAmc3RhdHVzKTsNCj4+PiArICAgIGNhbWxfbGVh
dmVfYmxvY2tpbmdfc2VjdGlvbigpOw0KPj4+ICsNCj4+PiArICAgIGlmICggcmMgPCAwICkNCj4+
PiArICAgICAgICBmYWlsd2l0aF94YyhfSCh4Y2gpKTsNCj4+PiArDQo+Pj4gKyAgICBpZiAoIHN0
YXR1cy5zdGF0dXMgPT0gRVZUQ0hOU1RBVF9jbG9zZWQgKQ0KPj4+ICsgICAgICAgIHJlc3VsdCA9
IFZhbF9ub25lOw0KPj4+ICsgICAgZWxzZQ0KPj4+ICsgICAgew0KPj4gVGhpcyBpcyBhY3R1YWxs
eSBvbmUgZXhhbXBsZSB3aGVyZSB1c2luZyBhIHNlY29uZCBDQU1McmV0dXJuIHdvdWxkDQo+PiBz
aW1wbHkgdGhpbmdzIHN1YnN0YW50aWFsbHkuDQo+Pg0KPj4gc3dpdGNoICggc3RhdHVzLnN0YXR1
cyApDQo+PiB7DQo+PiBjYXNlIEVWVENITlNUQVRfY2xvc2VkOg0KPj4gICAgIENBTUxyZXR1cm4o
VmFsX25vbmUpOw0KPj4NCj4+IGNhc2UgRVZUQ0hOU1RBVF91bmJvdW5kOg0KPj4gICAgIC4uLg0K
Pj4NCj4+IFdvdWxkIHJlbW92ZSB0aGUgbmVlZCBmb3IgdGhlIG91dGVyIGlmL2Vsc2UuDQo+DQo+
IENBTUxyZXR1cm4gaGFzIHNvbWUgbWFjcm8gbWFnaWMgdG8gZW5zdXJlIGl0IGdldHMgcGFpcmVk
IHdpdGggdGhlIHRvcGxldmVsIENBTUxwYXJhbSBjb3JyZWN0bHkgKG9uZSBvZiB0aGVtIG9wZW5z
IGEgeyBzY29wZSBhbmQgdGhlIG90aGVyIGNsb3NlcyBpdCwgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dCksDQo+IHNvIEknZCBhdm9pZCBwdXR0aW5nIGl0IGludG8gdGhlIG1pZGRsZSBvZiBvdGhlciBz
eW50YWN0aWMgZWxlbWVudHMsIGl0IG1pZ2h0IGp1c3QgY2F1c2UgdGhlIGJ1aWxkIHRvIGZhaWwg
KGVpdGhlciBub3cgb3IgaW4gdGhlIGZ1dHVyZSkuDQoNCkZyb20gdGhlIG1hbnVhbDoNCg0KIlRo
ZSBtYWNyb3MgQ0FNTHJldHVybiwgQ0FNTHJldHVybjAsIGFuZCBDQU1McmV0dXJuVCBhcmUgdXNl
ZCB0byByZXBsYWNlDQp0aGUgQyBrZXl3b3JkIHJldHVybi4gRXZlcnkgb2NjdXJyZW5jZSBvZiBy
ZXR1cm4geCBtdXN0IGJlIHJlcGxhY2VkIGJ5IC4uLiINCg0KSXQgaXMgY29tbW9uIGluIEMgdG8g
aGF2ZSBtdWx0aXBsZSByZXR1cm5zLCBhbmQgdGhlIG1hbnVhbCBkb2VzIHNheQ0KIkV2ZXJ5IG9j
Y3VycmVuY2UiIHdpdGhvdXQgc3RhdGluZyBhbnkgcmVxdWlyZW1lbnQgZm9yIHRoZXJlIHRvIGJl
IGENCnNpbmdsZSBvY2N1cnJlbmNlLg0KDQpDQU1McmV0dXJuIGNhbid0IHN5bnRhY3RpY2FsbHkg
d29yayBzcGxpdHRpbmcgYSBzY29wZSB3aXRoIENBTUxwYXJhbSwNCmJlY2F1c2UgdGhlbiB0aGlz
IHdvdWxkbid0IGNvbXBpbGU6DQoNCkNBTUxwcmltIHZhbHVlIHN0dWJfeGNfZXZ0Y2huX3N0YXR1
cyh2YWx1ZSBmb28pDQp7DQrCoMKgwqAgQ0FNTHBhcmFtMShmb28pOw0KwqDCoMKgIGludCBiYXIg
PSAwOw0KDQpyZXRyeToNCsKgwqDCoCBpZiAoIGJhciApDQrCoMKgwqAgwqDCoMKgIENBTUxyZXR1
cm4oZm9vKTsNCg0KwqDCoMKgIGJhcisrDQrCoMKgwqAgZ290byByZXRyeTsNCn0NCg0KQ0FNTHJl
dHVybiBkb2VzIHVzZSBhIG5vcm1hbCAiZG8geyAuLi4gfSB3aGlsZSAoMCkiIGNvbnN0cnVjdCBz
aW1wbHkgZm9yDQpiZWluZyBhIG1hY3JvLCBhbmQgZm9yY2VzIHBhcmluZyB3aXRoIENBTUxwYXJh
bVggYnkgcmVmZXJlbmNpbmcgdGhlDQpjYW1sX19mcmFtZSBsb2NhbCB2YXJpYWJsZSBieSBuYW1l
Lg0KDQoNClNvIEkgcmVhbGx5IGRvIHRoaW5rIHRoYXQgbXVsdGlwbGUgQ0FNTHJldHVybnMgYXJl
IGZpbmUgYW5kIGNhbm5vdA0KcmVhc29uYWJseSBiZSBicm9rZW4gaW4gdGhlIGZ1dHVyZS4NCg0K
QnV0IGlmIHdlIGRvIHJlYWxseSBzdGlsbCB3YW50IHRvIGtlZXAgYSBzaW5nbGUgcmV0dXJuLCB0
aGVuIGEgImdvdG8NCmRvbmUiIHdvdWxkIGJlIGFjY2VwdGFibGUgaGVyZSBhbmQgc3RpbGwgYmV0
dGVyIHRoYW4gdGhlIGlmL2Vsc2UuDQoNCj4+IGNhbWxfYWxsb2Nfc29tZSgpIGlzIHBlcmhhcHMg
bGVzcyBpbnRlcmVzdGluZyBhcyBpdCBvbmx5IGFwcGVhcmVkIGluDQo+PiBPY2FtbCA0LjEyIEFG
QUlDVCwgYnV0IHdlIGNvdWxkIGFsc28gaGF2ZSBzb21lIGlmZGVmYXJ5IGZvciB0aGF0IGF0IHRo
ZQ0KPj4gdG9wIG9mIHRoZSBmaWxlLg0KPj4NCj4+IEkgZG9uJ3Qga25vdyB3aGV0aGVyIHdlIGhh
dmUgb3BlbmNvZGVkIG9wdGlvbnMgZWxzZXdoZXJlIGluIHRoZQ0KPj4gYmluZGluZ3MsIGJ1dCBp
dCBjZXJ0YWlubHkgd291bGQgYmUgcmVkdWNlIHRoZSBhbW91bnQgb3BlbmNvZGluZyB0aGF0DQo+
PiBleGlzdHMgZm9yIHN0YW5kYXJkIHBhdHRlcm5zLg0KPg0KPiBwZXJoYXBzIHdlIGNhbiBsb29r
IGludG8gZG9pbmcgdGhhdCBjbGVhbnVwIGFzIGEgc2VwYXJhdGUgcGF0Y2guDQoNClByb2JhYmx5
IGJlc3QsIHllcy4NCg0KfkFuZHJldw0K

