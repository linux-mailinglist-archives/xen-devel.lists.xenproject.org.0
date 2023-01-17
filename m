Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1118766E518
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 18:41:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479649.743625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHpwF-0007Jw-Ps; Tue, 17 Jan 2023 17:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479649.743625; Tue, 17 Jan 2023 17:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHpwF-0007IB-Lv; Tue, 17 Jan 2023 17:39:59 +0000
Received: by outflank-mailman (input) for mailman id 479649;
 Tue, 17 Jan 2023 17:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kjsf=5O=citrix.com=prvs=374a1453b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHpwE-0007I5-HN
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 17:39:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3934d27-968d-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 18:39:55 +0100 (CET)
Received: from mail-mw2nam04lp2171.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jan 2023 12:39:47 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5078.namprd03.prod.outlook.com (2603:10b6:a03:1e5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 17:39:44 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 17:39:44 +0000
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
X-Inumbo-ID: f3934d27-968d-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673977195;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sfxrSXwUC/Cos2GlMWRMpJO2QKp7dFdBTczRZEQ43S8=;
  b=aHJfjlFZ4ceTCVYsCiQmGvDio1eXEGMFSnQoSJiMCG1FuX77+hV+Ws02
   noe3xlel+ucXFbprZ4Gpk7nhltV9Ihh8RQQSDWCroq7G970VaUqLDxCLl
   P3DDZpwk8qX/hs5g5XullfmvqUy0LqjzpCHJKkO6885ZxMHJK3WeXtWfn
   Q=;
X-IronPort-RemoteIP: 104.47.73.171
X-IronPort-MID: 92486242
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TaeSfaKxeoTolQY4FE+RTJQlxSXFcZb7ZxGr2PjKsXjdYENS3jNUx
 zcaUWiHafyMMTD1eowga4q3pBwC7ZPWmIJmSAJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5wVhPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5HPWJi9
 aI8Fwwpbw++3r6X6ruDdbhj05FLwMnDZOvzu1lG5BSBUbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VspTGMlWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHmnCNxISOfQGvhCjwGJ7U8oGkUscVK9qNe0m0q0UehEN
 BlBksYphe1onKCxdfH/Vhu0um+ZvTYTXtNRF6sx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9a1iQ67OVpjOaIjUOICkJYipsZRAe/9DprYU3jxTOZtVuCqi4ipvyAz6Y6
 y+OhDgzgfMUl8Fj/6em+VHKhRq8q56PSRQ6ji3bUW6o4RlwTJK0bIyvr17A5LBPK5jxZlWZp
 30Fh8i25fgDF42QjzeKRPgRHbav/LCONzi0vLJ0N5wo9jDo/mH5e4lVuG16PB0wbZ9CfiL1a
 kjOvw8X/IVUIHahca5wZcS2Ftguyq/jU9/iU5g4c+ZzX3S4TyfflAkGWKJa9zmFfJQE+U3nB
 aqmTA==
IronPort-HdrOrdr: A9a23:cP4zVaCVqggjygrlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="92486242"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbQXjBvVTlfEaWi2PmDyS/G1vlhRCm2lUz98z5QZBwpsR9sHxIqgkcd3nk7d2zxu3lxKM4V2dp6wnbvoZvsBYVY//tijReXzi3gChlsKNeMTzSPnV9O8lHGKUBCm2nar5kejKVc8djb/ooRB8iW4HzRZgWjxvEKNlDUOxRrsaoLd7XjDW32uh4EPIjCbLQPIv1WAChobSV3pT9cTnpNKMEh6ygDE6XTWRrYrsIS9wKjZ3pfJTA3KYKh8PSK43c8h6jZrDX0pyHrHxiTa2vslGn7QCiv5kTDMBbENiarZytco+lvd6so9fPCkueoXDMcBAzc2rQrSz8WZ31lJddWTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfxrSXwUC/Cos2GlMWRMpJO2QKp7dFdBTczRZEQ43S8=;
 b=RV9LaoKh4AGlnDO+ELyc6+qQz4X+wlnzY4tJmzSJaSmFNX1St9zqqfmEkOesjdLs9P7DiAU0KhGp9VGMFYkHYLCVbD+wX9omKAmQLkHgdVO8hAMex3bKI0mPzXvqOBhFLrj9xeXSU+2ls6HE36U/OwsYehJBKxqJVb5NKRN/7e4VkNdlmmjv4anMqSA5xGnbIn6OUTfvnK6B2qhL/RGgJ9pSwQxefXU2NrY1RPhAAQ7VdUI29ovtOddIO8AKDxYg/mbFzJLmeL6qqhA+3ifuZu8Kp15lo0ZdObad9CHMTLMRNZk/6DxIH4mNOpIvU38+JiFzJDI1+YEHTgL8B/Om8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfxrSXwUC/Cos2GlMWRMpJO2QKp7dFdBTczRZEQ43S8=;
 b=fL5Jng7H8CxUlo9NDNvrByZAwwD2ANev5SdYOjHlHoXLnMCyO6RuoJfA4/xYSeNo39/2glm86/UOi9fznWgQfMgyQKA4XBALDxlF8wAO064KbusCi5S4/KHNEqTz6xoJOe79aNq2EigJS24+fgHV0pBZMkvyp6R4y6ZvftA7tq4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Daniel Smith
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 3/5] xen/version: Introduce non-truncating XENVER_*
 subops
Thread-Topic: [PATCH v2 3/5] xen/version: Introduce non-truncating XENVER_*
 subops
Thread-Index: AQHZJ6P9s5HCoeqlF020fKh7orvbwa6i0F2AgAAVuQA=
Date: Tue, 17 Jan 2023 17:39:44 +0000
Message-ID: <5e9862b0-2c14-db70-2292-4f31b1653159@citrix.com>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
 <20230113230835.29356-4-andrew.cooper3@citrix.com>
 <CAKf6xpstz88SvrQNxmOrk2FL6x2mRegAGfrui7-6_C3Yg7EsjQ@mail.gmail.com>
In-Reply-To:
 <CAKf6xpstz88SvrQNxmOrk2FL6x2mRegAGfrui7-6_C3Yg7EsjQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BY5PR03MB5078:EE_
x-ms-office365-filtering-correlation-id: 0f335e08-829d-40ed-a180-08daf8b1d25d
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 b5XsTzCPR2y2t8G600WoRPFKGSX+KWysKDYJF0vnRYWQaPShei6EBYKOOX73LHqDk0r4p8h8cLYw9nsr+3uluAuLgGoYzZoPnEaAMNVtb2bYhctHf5jfE5o+EErsSvflM/Bn2HotLxbMjiMuqg/WWBQc26yVpkekB0ry3GMjopW6iCmNQ+npNMK2wZ5uv2gO0Veco+JABiZmufpAiPa5trikBxLfSslr+DnxVIP6JbHCbtgJ0u64iYMjhXjxXvHc0K1Ii5i41GckT43oQULt/xOoYwG2xLoQqNkNZbTpDaFJ2vfMQcpCgD/61+atdW7UVgN1z9NwJX+6LTJrgoj38eiGWuQrIovEN89eZSrSxWTYvk2Pw50djVhXnJC25MU6sDjlBKmFcnIuhplI45mGS/uyLfcQxGLb70ZUEZnUNjoN5FAameHH0eT2p1C7crqiArUctWQEbuSGRqWc+UGdc8kXkR2Ff5bULmA7tu1K0CrDkqQ56ciE6J3A2tQWFUHBxLkiDDvMc+c80E4bR8zvFT7pJgocOjWystEnFKr/aeBQ3hdAM32yR3oHNEkG9u7MOBe0cwIOBQtErmaZfBJeMRtO9NggL3wKLT/RT2cJZ0WM5/VF+OjXQVl88VfhVq4NEeTIEI9Zu4xBWo9FmVw45gmjc0/FftEWQ4FwTPgk8OOyxn6xiDrRVwxeOA5tMEflawJ4ylCm0Z5EBvIsU+jhCFMUkj7BFb+tT4vFDItLUjaCW8sLbdzPPj9Q4rjxxcisuzpmgWYDuzUBZRILqBCNhw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199015)(53546011)(26005)(6512007)(5660300002)(66446008)(41300700001)(8936002)(66556008)(82960400001)(38100700002)(122000001)(71200400001)(8676002)(478600001)(6486002)(66476007)(64756008)(6916009)(54906003)(91956017)(4326008)(38070700005)(76116006)(66946007)(6506007)(36756003)(316002)(31696002)(31686004)(2616005)(2906002)(186003)(86362001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L283RGxKUzV2RnZkQ3FOMk9UVE0wSDM4MTdQRmlELzB4T2llb3JiSG1nVlow?=
 =?utf-8?B?c0VCT0JudWdlMHVkb2kyb0cveVNId1M3VUk3cHhwM0gxR00vNmNObWYwQ2pr?=
 =?utf-8?B?RVZCYzgwSVM0Z2NrdFlkYXg3VUd2dWNKWmtFRjlIajNBKzNOZnZocG1wTTJC?=
 =?utf-8?B?eFVNQk9JOElqYmJ1aEhkb2EvNFBWWlBSd0JnY3J3ZXhkTTAyK0F2Qm0wdTh6?=
 =?utf-8?B?d1ZZMU94NFhLaFFPcjBFdW9OcUtQbDNnNjVZZ0Zxc2xTQWwxamZGYlJNYmsz?=
 =?utf-8?B?S1lKVXErSE4zUFV1L3h1NHBybmdSZzFQTGxUS0prQ3MxR3VzakpUUzl4SWZZ?=
 =?utf-8?B?TGNmZlBIN0F5bGZMTFlzalVzSUVXRm80U0d4dVI1QlhvM3lYZFdjdHVPd3RJ?=
 =?utf-8?B?TGpIL2dPQUR3STV4ZWFsaEhrSHFXbytlSjlLcjd4ME1vL1UvQ0VWTDk0NmpW?=
 =?utf-8?B?WEREa3dhOHl3RXB4MlR3R3dURUZWYzlheWcrWjMyYXFKamlEdGFZT2JvTXA3?=
 =?utf-8?B?S1FEc3pkWnpvUzB3NlhYMDNOR2hvU3FDZjI4Q1Yxa3ViMEtEaTVLdFh0UXBN?=
 =?utf-8?B?TXBQZTA2eUFEZUdHbzZiWFhwdGNCc2xVS040NTQyY3VMblRtbWJVbHYyd0xO?=
 =?utf-8?B?bHFub2hwMEpEYXVIYVV5Nm5wSjZxS1F1SUcyYWloWm9VSUpIbXpYMm9qMGNs?=
 =?utf-8?B?azlBS2NHZ0lQK1FSSDMya2dZN1JGWk55WTdWSzAvTjhMSVRwNkxuTVdJQzlq?=
 =?utf-8?B?bDZLWmdOcThGRHYvaXVsY24xdjcwZTR4emxoTzFXd01vMlhVVzdMR3Fha0kv?=
 =?utf-8?B?bkFOQ1NKbkFXazhva0tqMXdlYmVKRTBVQlVBRG5FVjhSZldKY0Q4VVMzdzU2?=
 =?utf-8?B?bUZlY0dZZHBQMlQyV09CaVdqNWk3aHY4ZVg3cERGTkhEeG5KeHZJSXd5a1Ni?=
 =?utf-8?B?UXhidXRNVHppR1lOQVhUVEtlUU5jdjM4UGg0VmtrWVZLd1NGVkJweEx4d2dZ?=
 =?utf-8?B?dWZFS2YyRjBCQjN3VnJqSzlHRE9PclZURkxFdU1WRVVFL0VHNjhjSXlUT0k5?=
 =?utf-8?B?SFJ1QVhvTG9jR0EzWlFsQjlYYjExZ3NqV1d1SmhzYjRsUHA1Z2JtQlFHM1lX?=
 =?utf-8?B?TGlxYkVackw0dGVLMW1XV0NRYlRuVURRT0FEMWliSnl4TisvbS82WmRpZWNJ?=
 =?utf-8?B?dTNCOW5qVHFnM0xWdVAyTUMyVDNodGdjYy9MNDhhMThNbG9hUHViMTJ0TlN1?=
 =?utf-8?B?a3ppclRRMkZ0cHVyWnZ5d3BVN0xNNmJZRlBscVV3czNFWHAxaHJlS3JWRFZm?=
 =?utf-8?B?MUZHcGx3Vlk3THpSemRuZjRQcTYzRzl5QWVHNEp6NjFwcXVhR2pTclRTRXcy?=
 =?utf-8?B?cWY0WUFidElJVUo5bUhIL041MTBNZDV3bzBYelZmU09PbjNpUGllYzhLZ0ts?=
 =?utf-8?B?MDBaUG9saVk4SlpKUDI4RGtneGU5dUZ4Z0hXWEJDdjFiOWt4ZkZ6V0JWeTdW?=
 =?utf-8?B?NFpGYXZISUM1dEF2Wk5VTllITk1oUWxMQXovVjVQNG1UM0pUZzJqSjBaZENv?=
 =?utf-8?B?UFV1aHdFb3I2SWpEQzdpeFQyMU5TUnRRcFh3K2FsS2w1cnNISWp5S3hxSkJR?=
 =?utf-8?B?MGZpVERXNFFidjBpOXBqMjd2dDRKZXYxODF1Z01zbnJXOWkyRWZ2VitxNXhQ?=
 =?utf-8?B?M25GVHJPTmpVQkFTTEtST01ZR01WNmpMZnlJeHl4MUFqK2RYN2Z4QUw1RE1U?=
 =?utf-8?B?WVJDR1QrUHBGYUo5UjMzNFJOOG5uekdHUnh4QXp6Y1I3b1Vhd2N2cnhwaXRu?=
 =?utf-8?B?blA2bzVSWUlmZHZBUFJObjdnaXFvQ09CQWM1RDBFRUxVU0F3ejZUZXZCQlBB?=
 =?utf-8?B?Y2NUSXVlUzEyRXVQRkJmSEN3VjNCY1pSNW1KWHRwMFoySmVHS1pReVVSc0xD?=
 =?utf-8?B?cSt1S0RqcWZZc2hMVEZRUHVxMTNhVkE1VnllTHBvWTRLQjZUb0p6cVJxK2t5?=
 =?utf-8?B?eUUwdGtBTVIydmVETnkzeGN6VGlKRWFNK0l2UktQSHlOOU1iVVdob3dJUU5E?=
 =?utf-8?B?elY0V1RYNHZqejdPYk1vaFBhdkxqR2JwR2VYWHI0K0FBT2o5V3FEbm5NbkpN?=
 =?utf-8?Q?o9ivnTbO6wwc2FXwYU5VYLjVr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED0B7FDA2FC19E4688399D3AA598C924@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?U0VxMzltVlVMTHlPSW9zY2I1T1pvSlNqMndON0picXIvRXBHbk9ickJ5S25W?=
 =?utf-8?B?aXJGU1JQSnYzZ1hLK01IUmlkajNCMUZOdkdrbGZsVVZKZUNTdjE1M3JaRVJN?=
 =?utf-8?B?Y0VaWE00dmpIR0hoQ1M4aWJiek5OYURpbDVHaDBVZG4rcXhMYlNHcWFDSVN6?=
 =?utf-8?B?UXNnV00wek9hY0llSjZiS2pLSzZ5Tm5lL2NDN1Q0eUR5VWRTVkdDR0dhTkpQ?=
 =?utf-8?B?Q3V4OTI3eWo5RndzZkszeHJVRjJRVXZ5aFZiVEtBSDdJckNJa1MxaDVMaEg5?=
 =?utf-8?B?UnlwYTJiSzBMNzBkMUR0djRsZUs4Tm5KTVNEQmErMXFkVkptSHZQbUNIY0VF?=
 =?utf-8?B?R2FOMGk4TURkT1JwRlFyTXRTZmhzQWhTVkJzakpMWWRRcWNnb2RVaEVkZ3pP?=
 =?utf-8?B?dWwwcVdBNkhZZVJuVVZ5cU56SHRpczNaRjZDTnNiNE9LaUdiSTJ3MFJMaHlz?=
 =?utf-8?B?QXNsT2dhTXNQbkpOWGRCNUdrL2MxdnlVbWROMXYvcEc4cXZwWXI5S281MWlN?=
 =?utf-8?B?YzZOaDRkckpjT0M2a1A2WmwvS3JyVlQ3d1Y1OVBGcDlBTDg2T3JCeTZFRFlt?=
 =?utf-8?B?dzZxd1lJVkllclVrcVpYYTNueDR6NTA3cEdRaWVCS3N3WVNZeGlpODFPeS9U?=
 =?utf-8?B?RHhzSStDRHFHRmd6bENEMnJ5Wmk5NklvU08vR1NCQ2hNeXM1ZklMSjVmNFB5?=
 =?utf-8?B?WjJTU05UM0lqMXFXQ3BMV043dDR1aGtlYWZSR01GV09maHdZWGNYdDhia3hq?=
 =?utf-8?B?N1lEVW9rNTdnckFpazdhZkRFTFpGR1ZDSExhVmptbTNZNEhsSG0wVW1ER0cv?=
 =?utf-8?B?MDdMMGRqMW9oakpyRURSVHpya3BuRDc1YXdZbEpvVVFkNVRDM25IUGdIbHh4?=
 =?utf-8?B?QnJuUDRFWU1LNmRCMVNyOGh3ODZPc1RybXJvWmVTdVgrRFQ1Mlp0NGxJY1Bi?=
 =?utf-8?B?Tm5Beks3OGN4MUxVcUFjYk9jSFlZMkswcnBmT0hWdEdPWGtLS2hyNXl2RVF5?=
 =?utf-8?B?V2E0UVZwVEZ5a2xFa0JaWHJwZ2x1cWh4MkhVeG0xcUx6NkxoaTBrME4xNzJX?=
 =?utf-8?B?bTFOVUxITkEyd1NVN1ZlenFKVUpwckZOVmZaS0xJbER0N1NiVm1BR015RmFx?=
 =?utf-8?B?L2E0TUswMm45c1M0WXQ1SUFyWXE4M0txNjAvV1BwbEtKYUNNcE9ob3NNRUtP?=
 =?utf-8?B?eDRFbnpwR1lLK0lzT1JqZzJVUFNZSWsrVEVPclRWRUxQbHFZWklOVEJuYXA4?=
 =?utf-8?B?dkI3M25pWDlwWmg5NFZiM09Tc3ZNRTRjc1YyUG1iSmc3ajM2UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f335e08-829d-40ed-a180-08daf8b1d25d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 17:39:44.8441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agKXojLT3KOkA4FDF3acblqqpMAKdwY/Ba3snjt0uhoIHVFxYn/vYb4i8rA8Q0aSOcrSrCXIiMZzhMeOyF7aCXu8/rW9OWUE6LyEBzLyJoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5078

T24gMTcvMDEvMjAyMyA0OjIxIHBtLCBKYXNvbiBBbmRyeXVrIHdyb3RlOg0KPiBPbiBGcmksIEph
biAxMywgMjAyMyBhdCA2OjA4IFBNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+IHdyb3RlOg0KPj4gUmVjZW50bHkgaW4gWGVuU2VydmVyLCB3ZSBoYXZlIGVuY291bnRl
cmVkIHByb2JsZW1zIGNhdXNlZCBieSBib3RoDQo+PiBYRU5WRVJfZXh0cmF2ZXJzaW9uIGFuZCBY
RU5WRVJfY29tbWFuZGxpbmUgaGF2aW5nIGZpeGVkIGJvdW5kcy4NCj4+DQo+PiBNb3JlIHRoYW4g
anVzdCB0aGUgaW52YXJpYW50IHNpemUsIHRoZSBBUElzL0FCSXMgYWxzbyBicm9rZW4gYnkgdHlw
ZWRlZi1pbmcgYW4NCj4+IGFycmF5LCBhbmQgdXNpbmcgYW4gdW5xdWFsaWZpZWQgJ2NoYXInIHdo
aWNoIGhhcyBpbXBsZW1lbnRhdGlvbi1zcGVjaWZpYw0KPj4gc2lnbmVkLW5lc3MNCj4+DQo+PiBQ
cm92aWRlIGJyYW5kIG5ldyBvcHMsIHdoaWNoIGFyZSBjYXBhYmxlIG9mIGV4cHJlc3NpbmcgdmFy
aWFibGUgbGVuZ3RoDQo+PiBzdHJpbmdzLCBhbmQgbWFyayB0aGUgb2xkZXIgb3BzIGFzIGJyb2tl
bi4NCj4+DQo+PiBUaGlzIGZpeGVzIGFsbCBpc3N1ZXMgYXJvdW5kIFhFTlZFUl9leHRyYXZlcnNp
b24gYmVpbmcgbG9uZ2VyIHRoYW4gMTUgY2hhcnMuDQo+PiBNb3JlIHdvcmsgaXMgcmVxdWlyZWQg
dG8gcmVtb3ZlIG90aGVyIGFzc3VtcHRpb25zIGFib3V0IFhFTlZFUl9jb21tYW5kbGluZQ0KPj4g
YmVpbmcgMTAyMyBjaGFycyBsb25nLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+PiAtLS0NCj4+IENDOiBHZW9yZ2UgRHVu
bGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+DQo+PiBDQzogSmFuIEJldWxpY2ggPEpC
ZXVsaWNoQHN1c2UuY29tPg0KPj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4NCj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPj4gQ0M6IEp1bGllbiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+PiBDQzogRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5
Y2hvLm5zYS5nb3Y+DQo+PiBDQzogRGFuaWVsIFNtaXRoIDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlv
bnMuY29tPg0KPj4gQ0M6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4NCj4+DQo+
PiB2MjoNCj4+ICAqIFJlbW92ZSB4ZW5fY2FwYWJpbGl0aWVzX2luZm9fdCBmcm9tIHRoZSBzdGFj
ayBub3cgdGhhdCBhcmNoX2dldF94ZW5fY2FwcygpDQo+PiAgICBoYXMgZ29uZS4NCj4+ICAqIFVz
ZSBhbiBhcmJpdHJhcnkgbGltaXQgY2hlY2sgbXVjaCBsb3dlciB0aGFuIElOVF9NQVguDQo+PiAg
KiBVc2UgImJ1ZiIgcmF0aGVyIHRoYW4gInN0cmluZyIgdGVybWlub2xvZ3kuDQo+PiAgKiBFeHBh
bmQgdGhlIEFQSSBjb21tZW50Lg0KPj4NCj4+IFRlc3RlZCBieSBmb3JjaW5nIFhFTlZFUl9leHRy
YXZlcnNpb24gdG8gYmUgMjAgY2hhcnMgbG9uZywgYW5kIGNvbmZpcm1pbmcgdGhhdA0KPj4gYW4g
dW50cnVuY2F0ZWQgdmVyc2lvbiBjYW4gYmUgb2J0YWluZWQuDQo+PiAtLS0NCj4+ICB4ZW4vY29t
bW9uL2tlcm5lbC5jICAgICAgICAgIHwgNjIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPj4gIHhlbi9pbmNsdWRlL3B1YmxpYy92ZXJzaW9uLmggfCA2MyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPj4gIHhlbi9pbmNsdWRl
L3hsYXQubHN0ICAgICAgICAgfCAgMSArDQo+PiAgeGVuL3hzbS9mbGFzay9ob29rcy5jICAgICAg
ICB8ICA0ICsrKw0KPiBUaGUgRmxhc2sgY2hhbmdlIGxvb2tzIGdvb2QsIHNvIHRoYXQgcGFydCBp
czoNCj4gUmV2aWV3ZWQtYnk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4gIyBG
bGFzaw0KDQpUaGFua3MuDQoNCj4NCj4gTG9va2luZyBhdCBpbmNsdWRlL3hzbS9kdW1teS5oLCB0
aGVzZSBuZXcgc3Vib3BzIHdvdWxkIGZhbGwgdW5kZXIgdGhlDQo+IGRlZmF1bHQgY2FzZSBhbmQg
cmVxdWlyZSBYU01fUFJJVi4gIElzIHRoYXQgdGhlIGRlc2lyZWQgcGVybWlzc2lvbiwNCj4gYW5k
IGd1ZXN0cyB3b3VsZCBqdXN0IGhhdmUgdG8gaGFuZGxlIEVQRVJNPw0KDQpJIG5vdGljZWQgdGhh
dCBkdXJpbmcgZnVydGhlciB0ZXN0aW5nLsKgIEkgbWFkZSBhIG1vZGlmaWNhdGlvbiB0byBkdW1t
eQ0KaW4gdGhlIHNhbWUgbWFubmVyIGFzIGZsYXNrLg0KDQpHaXZlbiB0aGF0IGl0J3MgdGhlIHNh
bWUgcGllY2Ugb2YgaW5mb3JtYXRpb24gKGp1c3Qgd2l0aCBhIGxlc3MgYnJva2VuDQpBUEkpLCBw
ZXJtaXNzaW9uIGhhbmRsaW5nIGZvciB0aGUgdHdvIG9wcyBzaG91bGQgYmUgdGhlIHNhbWUuDQoN
Cn5BbmRyZXcNCg==

