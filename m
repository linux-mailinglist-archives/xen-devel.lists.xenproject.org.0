Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3BE6B7A0A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 15:13:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509309.784835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbivg-0006ak-TR; Mon, 13 Mar 2023 14:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509309.784835; Mon, 13 Mar 2023 14:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbivg-0006Ye-Py; Mon, 13 Mar 2023 14:13:36 +0000
Received: by outflank-mailman (input) for mailman id 509309;
 Mon, 13 Mar 2023 14:13:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=koCJ=7F=citrix.com=prvs=42903c55b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pbivf-0006YY-Gm
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 14:13:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b59623f-c1a9-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 15:13:33 +0100 (CET)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 10:13:27 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6494.namprd03.prod.outlook.com (2603:10b6:510:bb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 14:13:25 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 14:13:24 +0000
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
X-Inumbo-ID: 3b59623f-c1a9-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678716813;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3RgdrLpcHF7fOOmzueusI4sWVNVmW+IU6nGJoZBqnrM=;
  b=W/6QqlEeztl4GPf8eHi8iBz62kpx8Qs3dDjFMhvZZmGlGnWmKNODmplY
   IzFDKNT59Vw7jxjmzrXpCKVT+BdrU2/38qSMfKCHOVIgwj8ciQNFmr29b
   WqRBSCaTTqomJE1BCcaO0wNQXdTpl8rDXEqB6caruXgre6/YeDnV0l9Bj
   w=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 100522285
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bwDg1qp67zpTzBDTvAj0u+aft39eBmLNZBIvgKrLsJaIsI4StFCzt
 garIBnSaPiMM2rwKYtya9ix908Gv8OGmtBmGldkqCs3EHkb85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFziJNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAG4kZ0+bwMic+YLhW7lgu/V6LOPFPrpK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYWIEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqY32gfJljF75Bs+ckuYuf21kBKHXJF4A
 WILxBAShLY5zRn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRuwJCwUIGkqdSICCwwf7LHLu5ovhxjCStJiFq+djdDvHzz0h
 TeQo0AWmLE7ncMNkaKh8jj6bymEo5HISks541vRV2f8tAdhPtf6Osqv9ETR6utGIMCBVF6ds
 XMYms+YqucTEZWKky/LS+IIdF2028u43PTnqQYHN/EcG/6FoBZPoag4DOlCGXpU
IronPort-HdrOrdr: A9a23:r4ZmtqEeIUZj96F0pLqFe5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdoZJhSo6H6BEDgewKUyXcR2+Us1NiZLW/bUQeTTb2KzLGSpwEIeBeOvtK1t5
 0QCpSWYeeYZTcVsS+Q2njaLz9U+qjjzEnev5a9854Cd2FXQpAlyz08JheQE0VwSgUDL4E+Do
 Cg6s1OoCflUWgLb+ygb0N1FdTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P+7E/6m
 LI+jaJq5lL8svLhiM05VWjoai+q+GRi+erw/b8yvT9Hw+cxTpAor4RGIFq8gpF4t1Ho2xa6u
 Uk6y1QQvibrUmhNV1d2iGdvDUImQxel0PK2BuWh2Durtf+Qy9/A81dhZhBeh+c8EY4uspguZ
 g7q15xmqAnfy8oph6NkuTgRlVvjA65sHAimekcgzhWVpYfcqZYqcga8FlOGJkNESrm4MR/ed
 Meev309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw8TxdAZnH0H6JUhIqM0kN
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbWPGebMT3cZdI60rL22u7KCZkOlZCXkcYzveQPcb
 z6IS1liVI=
X-IronPort-AV: E=Sophos;i="5.98,257,1673931600"; 
   d="scan'208";a="100522285"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPhJ5+pWvn/6wJR0Q2aepL0tu8nRVNeVBGLRMgZ4brRaRWrzpe4WWHk1EwrN13Va05Y/TKh8HjrB+5b8xJZsqjcTJwDXPu5Lmj9O8OR5da0LgMGB5RkYVJ3H1TlhC2ymcbejJhcvsd0nsljV9c7mq54FxCScwzj7hJyVnfxsTPANlK8+78o6L3WwLiDWJMijDn1v54RcVpTjoXhQoZHT6gVjz7L5yUlW4XLgfJOvMSCxpIWg8b7g/nWtp+kq1AtZ1x6e+fp6Fgv843318UAYz9b9c9E2PYai5ZmWm9sx3LlynjrG9xL2hTdWTytStY9zcSR73GxHCQtDlO6DU5vHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RgdrLpcHF7fOOmzueusI4sWVNVmW+IU6nGJoZBqnrM=;
 b=nHt0TgKZVgmlL60Upr+W+1ic6FTSLDQ+WOSNfd7Jc+iWauayO+lJc4dNvQQGlMmtk9NfZ6qcGnjkZbpuzLELHwMSBVfLoUQy6ea7IY/rOqu5ht+9fDQiGjysdN4REj0tK5mRIP3T2UzL2Gj56I04golBQGIaiWl3Vh/tPfbZlpfrp0SY0MsJuZScLHGU+4uWTb/YoT/6Nr+WotwXZHn2pFi+48Obmf9myzbQIBF0MIKjtsblz4pcmK0GVPg4Wt16mTUjiCQqMdgtdXqXJ2FHVdkvwpjHH/yN+zBDeTFLzhJlaTcZxps7kGO2LJZHg0jm5ijuqSIdKb3l45NHgXw34A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RgdrLpcHF7fOOmzueusI4sWVNVmW+IU6nGJoZBqnrM=;
 b=uZU7d6/h4qIq8u6FuaV6OZyHqo2WrxLP2xjL/tKWUdCnrhhw+FO3TX7rgcwFSn8SIz0UEOv+vz4qoK36RWyHx/KzmSy1nB1T86/3v8uiyGSNjHT5rxHoGKGoOxvSdeAyPadZIs/y56Cr7NwDdWPbgRqnoMjcHvVECmx5GgFtC9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c278a871-5100-ca92-e329-b38955ef9eb7@citrix.com>
Date: Mon, 13 Mar 2023 14:13:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] bunzip: work around gcc13 warning
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <eecec806-1728-2efb-ad69-862fcca5ba75@suse.com>
In-Reply-To: <eecec806-1728-2efb-ad69-862fcca5ba75@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0246.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8d5720-f240-4b80-8380-08db23cd1afb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4X3MMAnPM4CKhTujI4p/iNT3RMQY1Tg+pQdWy2hAf0GOx+Awi4NH9QrQCE7PtYSqmG4zfTBDJ9YjFW5Txm3aVQ3fj0qKMxbNKynFSHjyACOfhPOQkxj84DTJkEwp3YtaDSKzgh4prBS6upuKlByahJMjsXxENOXOjKK1CorZq168xY1KhlKii978P7G9p3VYeBB6Tt5KrFen+XfHqPN6q5HPXb0O+hfL//vPlSJgttUiBO0Dc3rjds4AElh6d9FSJhUorgScJnx4Rv9750G9BGf8+C7O3fyPXL8xKyS/2StTWptbOvPN/VBDkVORRrQEvb9NVfBDDFVmlH+dPUtRReYy9n0W206mDd14Y6ke+ftRjMfM2L48TLrfXiEcp0kRPyQySWi2jhL7hxvBhzAVZRiS+n/nszIo6nVlES+Ru6EwbbL+Os46hHtnLyfaNFhlxWfWerQrVP3gof13sM7Eb0MwM9GVJqYfPipHbph/qcKRqG6SrEdYSyXbdWe2cX0mE+al5aLfQRkHwder6xEunmQyj1DoMWt06rrMmMU99uVBayqP3NyxyTRmfkRyCENTGVnt0ZAZa9ho3eqPu7DNfvP6EG9r6as57YFWjqYsBNjMBPxO720yYrAW8D5y83QJNP17zZ94TM5CA7A6pGn0jQ2U5zD7MobFv77iOI1xZ4fKYsRoXf6hvexZR5bR14AaKsf6n+Wu026C6DkNaikqmXc2Il9suTYkpfhz3wLjdoA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199018)(36756003)(86362001)(31696002)(186003)(41300700001)(26005)(6506007)(53546011)(6512007)(5660300002)(4326008)(2616005)(8936002)(316002)(54906003)(478600001)(110136005)(966005)(8676002)(66476007)(6666004)(66556008)(66946007)(6486002)(82960400001)(38100700002)(2906002)(4744005)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk9JM0JFUHh1WStUL2YyMG9lK2RkK1h1Sk5KaGdFMjhiZHpFTDNMdEtoT0F5?=
 =?utf-8?B?SURiUkp3ekY4WmMyNGdiUjQ5cDFHOEV4c0VHUzZRbHMrQjBIZnh2ejB4QWF4?=
 =?utf-8?B?eHJTOUNZOC8vNTRhSjJ1UHo5VkxBUkwrNUJnV2xoUkEzeHk4NDY2Tm9Md21t?=
 =?utf-8?B?UWxxaXArdExhSUxadUpiT2F2WmJIaHRwK3lIVUdaYitBcVF4cjg2SFYyaHVq?=
 =?utf-8?B?WFR4WDFrNU5wS2pUTXBDMk5iZEtsemsreGxCY05TKzNWd3FLR1dsTkRSN25N?=
 =?utf-8?B?RllqNEJwZ1I3czBLUDIrNXhpOSttZG5pUFBOYlp4dVNFQWlPdnRDNXM2dENF?=
 =?utf-8?B?YXgwWGZ2V1Y2ZkJjcWFiU29ydzFsU21Oenc0K3RZZ1BXZVBJRGh2cWpMc245?=
 =?utf-8?B?SVg2Ym1YNzFsUysrMU9TdUdwazI5QjZGaTRMdjRIcytZRTdTWitSTjhTQmNX?=
 =?utf-8?B?R0JNQmpKRXVlc25KMUI2VVgzQjRrM1hzZThtYmwxL0dudHBVSnJMZE93NW1r?=
 =?utf-8?B?eGtQK003NXpjV3BkeXRVRE5VSUh2MEM5K3lLb3IxNTZPbUo2T2RyZmdsTG02?=
 =?utf-8?B?MUUya2dUeWlWcEd1clFlYkFsQ0ladFJmRTJkTDNqaVFMNUNCS1Qxa01IcUZI?=
 =?utf-8?B?VTIrZ0JxcUpqN3g3S3JONjNlaExZdVMxUzFoQnZHejNMMytSNXdXSUV1U2V1?=
 =?utf-8?B?cFRNa0tRMjRSRm5pR0MrZjg0d0hWcTAyYU1VWHdIaUdEUFk3bmI0bDVsNnVu?=
 =?utf-8?B?VGhPRmwvMHZLOC9NUHQ1b2pUeGQ2YXc4aG1kOFFIdG5iSlp1MG1pMFBuMTBM?=
 =?utf-8?B?cXBRbmVRNEJjOVE5OXZrQWVnSTZ0YnlqeCtkV1BqbGlBUkl0Q0ozMFlRSXFx?=
 =?utf-8?B?TVljMWxGOE1rZzJDSkFnSGc2V1J6RUZaTExONVRVN2xvOGFjMlJXWHlieW9V?=
 =?utf-8?B?aTBUZGZMSjJTZXJnUFJDM1EyTDg1OUVOWS9mRVhoTFlkR1lMUmVDU3ZJajR1?=
 =?utf-8?B?ZGE4VThlWmcycUp0ZmdEcWJkc2p5QWtxQW1kT3ZVcUJsZWFyajFyNDhuSVZy?=
 =?utf-8?B?UmRUQTVoajZsdzJYWnFhUytuNWMvbzVyUFJyelloZDNMUVVvUW4xUHZ2VFVH?=
 =?utf-8?B?aHovUGRrVnZ4OEdNb3VnRmFXT0svZFRsUEQvdUtLODdnN2l4Z0s3TWthRVd0?=
 =?utf-8?B?REJJRmFzWVZ1OHF2eHBZZmZUWEJ4emYrUExtblR1cDIvbHhJOWcweGpGRDNs?=
 =?utf-8?B?V3NWSmtpVXM0eU94M0ZLVG5mZGhlRTRiNGV4aVQrZzBxWXNKS0M4aWh5R0xR?=
 =?utf-8?B?WUhZLzBNdEo0aUlPb3lqMmw1VWRacjcrcG5jWTBJTmJGdi9hNXhWZjJOaXRL?=
 =?utf-8?B?cTFvaFpkQktLTFlMb0J3R0lhbFpaYWdQWUZGTlJ1WjdPdGo2a204cVpQeUFh?=
 =?utf-8?B?SkhYdG95RW5RV1NJYkZ1Um0xWHgxZWo4Z04vZ2xkVlhHVlVWcXY2a1Z1TUNZ?=
 =?utf-8?B?SWlkajVwWVFVTlJlSktxRE5FOVVuNTRJTk93R0pUSDF3WlFLc1dNWm5ieDFn?=
 =?utf-8?B?QVNyU3ZYODBNd1ROY1h5YThPTlBEdThWNTRTV0ZuTjZYSUZhdWtaNC9lMjNT?=
 =?utf-8?B?YVNvbE9rdFJNT3k3S21PY2JkVU90NlI1NUNGYjlqUnViS003aDVIbjc4Y0ZY?=
 =?utf-8?B?QU4wVEo3TkRFV2FpZXBzNElhSk5Jd3ZLTStGa0lZaFJPOGtET1hYV1Vpczlq?=
 =?utf-8?B?czNoa3VYMTBNTlZNNG1ocFVsWFpUTVVqUm5SRFN4bUJxQ3h5UlQyQi8rYUVN?=
 =?utf-8?B?NU44bmI2QVdydkZlN25HOFZOTjBPQWdkdUJsdTJWRzR4NVVIQ20vN3VXak5z?=
 =?utf-8?B?Z25OU3hRQUF6bENtU1VIS05hdUcvbVNjTDdxU0JDRHVUTU45d2NNak9nS1Ro?=
 =?utf-8?B?SVJaWmJwb0xGeklYQndEWXVZMk1RYUtGWXBETGkzMldJb3lVWVV5a1NxT2RE?=
 =?utf-8?B?SzVzcWdZYTZYa0lCeU5BRGFUQjMraGJwNG51M205aWxsWmp6WGZLeDRxNlhN?=
 =?utf-8?B?OCt1WGp1d0JPOWVTdWJIWWU0Nk9hZE0vY2gzMmR3VDZJWk9JVVFxelFHRTJJ?=
 =?utf-8?B?WXhtUnVkQkRsdHZpRWpiQ0QvMzV6a3RFdkV6WWU3SU5BM20vSllRSWFtWDl6?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	P38HM4WX1ONpH0WZn5Zyu6PCaRMQLp7MSyhsnJJF3gB/w0cR/6RnV0fwdDkeENU4Lp1RSFXilGW0hi8fSK/rj1BGeZ5T0oLtj0nBOYdFCiTdwKAS+M1ZqkAK7EnNXolz8ybHPEh8v5M657JeVhVuaTnOwCcMhvd4i1mCZhPWjWYsAwUJMJ5u8pmjeYeEiO9wXtKj3p2rMPTBo17KqrA9FHFmvxDRRjTMChMC1AfTxU1NKmcvFnGLPRKGSzZZWJT2UzQKo5vEaRRgHOWyghfyBSD2cXeiI/zbSa+fvSALtvZ0Xm4ZBP0BJEMSM8LBz57f74GhWOwX8jJ41AKeM0pDQA+M/JNLGZpmvvBEe3KsqJ+SxstOJt8vVS8xXvV87PN9d+XSENDBO2l86ml+Mlmcai9LQSg1bN3aLvmap62QvHzd4sahY1MG6W3KqrmaeQJp20JQcTnKHaGSLasFuRU1gqtEaM5Y/bxQ+4WudKaoqzMeLyJx55cA9U3oELUm2TBe0MWw3DzZy+shgfMQM75xKczlbtjn3HO+7wPgfqsejtpLC2LsIUfUwQ2XUoOoLdO0xVDaRhI7aES9Gl65vMe+K+v3ej7PDqOkHaZCsOTAXKr4LFoJfOmaDhtH4M8QX7zVXMlrDoMW4nuhtfKiRkzbT5ONhpXZAQ8pVmvXSLfUrb2aCbw/rD7zIJ4fLWz84nEuimnJkoRIMZSRtLtwHSSCN6a7tN3Ju2jqSXSLiX17rEqeFbx4X7Vd8QnJRC7iF/1MX8UnDLfjIxKIUtpNPLN0bKCLIkLOrEnzstng9ew0Co6guDnnb+6X5ovh2GqWPn2zBl3vpZFC/6GCFRtkjmq2LdhBJWf6jP6836+qmuEHj14=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8d5720-f240-4b80-8380-08db23cd1afb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 14:13:24.7264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFpDBhXuZXZykNGJqNJwMetXDOoMKF6wnDttQS8QEddrUDGWRQfTrShhcpySSv2LM8z+PeX3D7kASIu61PwMIyPqWcyG6axtTmuReaVML9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6494

On 13/03/2023 2:10 pm, Jan Beulich wrote:
> While provable that length[0] is always initialized (because symCount
> cannot be zero), upcoming gcc13 fails to recognize this and warns about
> the unconditional use of the value immediately following the loop.
>
> See also https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106511.
>
> Reported-by: Martin Liška <martin.liska@suse.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

