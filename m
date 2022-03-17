Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F904DCD5B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 19:15:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291716.495347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUueB-0000yS-6c; Thu, 17 Mar 2022 18:14:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291716.495347; Thu, 17 Mar 2022 18:14:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUueB-0000vj-1s; Thu, 17 Mar 2022 18:14:51 +0000
Received: by outflank-mailman (input) for mailman id 291716;
 Thu, 17 Mar 2022 18:14:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hAZZ=T4=citrix.com=prvs=068f51ced=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nUue9-0000vd-6E
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 18:14:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f51b075-a61e-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 19:14:47 +0100 (CET)
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
X-Inumbo-ID: 1f51b075-a61e-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647540887;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=dVE8PLr6JI/Nd2ykEKLVHl0Y75xEmROfphuKRhYshvA=;
  b=CevtrmDHecdLC28IwGTtHlsONBWIxoIs2qSaixuMZze9YyIVfpzXYdge
   +C6PXCXIcJu+VM57o+C25sUuyGxmrOSekmPdbt6Kj8sma5pPVnZHAkUKQ
   v5I4WiXPW6nwAEKhOrkR+1iG3yq3f2azSLfBjBNWBi9J5lhNc59WmGsLd
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65997246
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xYcWpahCr+Z7fKY3Om3Px9xnX161aRAKZh0ujC45NGQN5FlHY01je
 htvXm3QbvyPZmujedEjbN/n9ElV7JCEzN83QAFvrShmFXwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFrS4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQtzY/PVvM0yagJROgFjAaF4yYXrGEHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xN2c+PUuaP0Mn1lE/LqMUvOuQmVrESjhnrGqNhYkezTjo9VkkuFTqGIWMIYHbLSlPpW6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxjhlGJ13EQIBITXFq/5/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsskRBBcN0OsID8wik6rfo7zioPEQ9d2sUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZow7eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4hDGJGT9bxgbQ+0RqmBNzFJrVml
 CJY8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9Id8MvW4nfhkxbZtsldrVj
 Kn74185CHh7ZifCUEOKS9jpV5RCIVbISLwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyikEwODrehPnGJreb+7zkidBAGOHw/kOQOHsarKQt6AmAxTfjXxLIqYYt+mKpJ0OzP+
 xmAtoVwkjITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:j1wniau96nS7FLw1139RWgrq7skCwYMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H7BEEZKUmsuaKdkrNhQItKOzOW91dATbsSoLcKpgePJ8SQzJ866U
 4NSdkcNDS0NykAsS+Y2nj3Lz9D+qj/zEnAv463pB0NLT2CKZsQlzuRYjzrSnGeLzM2YKbRYa
 Dsgfav0ADQHUj/AP7LZEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZizU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUgZ1TChkF3nAic0idurD
 D+mWZlAy210QKXQoiBm2qu5+An6kdp15at8y7AvZKpm72EeNtzMbs/uWseSGqD16NohqAM7E
 oAtVjpyaZ/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh5bD30XklZqvoJhiKobzP0d
 Meef309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv1Eso5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHq4kd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MRKAtPTWu7VjDrRCy87BreDQQF2+oXgV4rmdn8k=
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="65997246"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gv/Ck6Z+WigWEcGnzn4H17CRlObCqqV2e19mYu59ZI1ESlfoWWvfFxSZovyuaJb8wd2b1cM3G+AAayJ9J1kdD4bGMa8/aep3igQWSXOhzNTtx2XEGDISme5lTOcjEbjUcU6OLTOWVGlUjAHWVfYMJQxbajBwOcXGQRY+ImFAkfbyYuRXohZmrVlWSwjM13HtED6ciI7pljzseUamH+SmAQWNbmCSyrUAosmNW6KVF5efsgslAkeeglR9+dn8RNHwsZBkIFQwaW57VE1m6ytVFJL85U3v4MtgfebxALbK1IB4ESdbNmvcFZaeOe1Lntil9Z7jNii1f0jZTaMhcc9h1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVE8PLr6JI/Nd2ykEKLVHl0Y75xEmROfphuKRhYshvA=;
 b=QdWzTm2EbKZdpYy93GXue4EppGSQqEZsRbboVX6pAFDehLyaHCBdWshLltkf8zn52+8oTdTJy/KKWm3Wr93jW7mb89RS8U1AMl+mnbFUD9qm+1Bhwdo4mxhm6R9REW9zH1lxFO/2Pk2rhqEd8gv+8Q5mslRzlRVWP3Q+ZUOVtfAv/hn1r3aAqvf5yLmoh17Qt+8HERbIp4hHEFDVh4oRk4tNY+gvLuDhXVvuD0iI1Gnf6ZPzefkj1v/6SFHUPXNvX3MEoBtb1IT5EidYpOa4rY/BLkCCYFFD83mgXjqXWn8WLhYqQ6pOPZ96uJs0d9Kw9b9j/M90IC5t+D/AW/ESQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVE8PLr6JI/Nd2ykEKLVHl0Y75xEmROfphuKRhYshvA=;
 b=A9qxayUtR+OLwH9g88Y3+LDIPgZYGawgpv03EOae9iCXtEizTuDxWRQOI4WPOY6xCqd1g5kaE+tCKdjmK0U7nbTEpw/T2WVcZ48HJ2/JLBy5tOmR/5sTZ8M4Mo/8YbcGIwZrfnf693kGokY8jQVZI7LfxYf+SRaoXn/pDXJjzgc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: Nonsensical XSM Flask denial
Thread-Topic: Nonsensical XSM Flask denial
Thread-Index: AQHYOifTdUK/S2+tpU+tNQxc6h7KEazD4WoA
Date: Thu, 17 Mar 2022 18:14:39 +0000
Message-ID: <ab5a7aea-cab1-f9d9-e3cc-58636c234a4e@citrix.com>
References: <CAKf6xpvk1zX3ZtzSOWBCasZOuS607-W_iqHbC=ZgTBQqo+btjA@mail.gmail.com>
In-Reply-To: <CAKf6xpvk1zX3ZtzSOWBCasZOuS607-W_iqHbC=ZgTBQqo+btjA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 636999c7-5e29-4d50-e3b5-08da08420049
x-ms-traffictypediagnostic: BL1PR03MB5976:EE_
x-microsoft-antispam-prvs: <BL1PR03MB5976E147930C029D5A2368C2BA129@BL1PR03MB5976.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YfVLOB3oc9yxP62qekuWB/T8pagHt3KmPoLaF38w/PZ/jAlLD5PqoiAh531a9c0Zf2MsNY/hMkAPr8XGOTFbqYW/PZDqqTmMFQSTc2LsE1ck2BUAeeLqO+p+pjvtDP0PpkIXKRzZKMnDxaWwwAK80TOta80KEk7FDOFyI4WUbrYUbEdNEDjUVtcCK6Ig/bS3zQ4VIv7SdiIsS3Ji7tRG72ejjoD/NsKaDp+Lhlwc+ifeksYLTNQWQOK5Q9FMwD1VPqouwH4lkmYxH1drTuRk90sz1xtbd20fdxqTU2Sx8JXQhHWkTGORGQGdp9pnK+29Zf9NCegIYuWSyyT+VVrXqf5fyyk8W3YbrRw0kudL7y0Clh4IdHUFAqbKaHu6XlhJ9kYTr8esqaF2kfz2OoFEZXaGiW6dbyRCFxHN/i5g8Llv2zUtqXogSDpqaCc2/GeepFlw8abSVdG6p9erRveNmjfVXK4QF6enUpOZ/6JuKr7Ip7/gF73lf7z4bKvpj5n141W6zYo9/w1SW6apEBtmLczSnrBpwxjV3KUGy3bRfEymd+jRmHdxRAo3kDJtKlNIUrOPp/VXvctSdhrdQZXjxUA0zNdDjrA6acNZ9/8YGRuC4oOMyG67dn+piHfrgtalis2KUZiP17lz/W7a9e7w8uMuILGoeiDdqug5mN6LYzrl8jejMpstW+Z38LYG63h88ND6zxFiO6Ow1pJjB5i67lIBUX+rT86CzPZn3neDws3vOamUxJv496Kae57sm2TVEFQ+lYkbBpWpSB7tF9uTow==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(2906002)(508600001)(8676002)(64756008)(66446008)(66476007)(66556008)(6486002)(71200400001)(31696002)(66946007)(31686004)(36756003)(86362001)(110136005)(6512007)(2616005)(53546011)(6506007)(316002)(91956017)(26005)(186003)(122000001)(38100700002)(82960400001)(38070700005)(3480700007)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWdIRHNMNEt2ZndsOVFMQ3lQWmxROXZ6SnQzQmpyZlpZVVROdE0zbU5IYjBv?=
 =?utf-8?B?UEt6UGRKSDBHUVlSam4yVi92VTBpYnp5UUw5b1h5RVlHSytSVWI5TFYxZFph?=
 =?utf-8?B?OUNTQjdPLzZuZUpFcXo0MVJ0QnlrRlI3U1BobmRoT1UzenZWS3N4VURlWUw1?=
 =?utf-8?B?VEc0NGxqYnhJUXRxNnJiTEtpRW5yK2xndXNXMjlLSjB0TW82NlBCTDFjaXN3?=
 =?utf-8?B?cXNvd3FhQkd4OUllZTFIUDZGQmVZbHdINVNLdGE0aytYVDdPRGFVWWkwRFI5?=
 =?utf-8?B?cDRzV0lvdEZRUDhMMXdkeVZWZUV6TE9XNm8rbm44RWdrQyttZzdQeHVBY252?=
 =?utf-8?B?OHZUanpoZnBycGhwQ3pSSWEvZEREUlB0SjlkWlFGODBnMjBkVzJhVGkzUXAr?=
 =?utf-8?B?dHZFRnFKWnVINmk4dlV1aGFIb29MWCtvbTgxaVhiWmhCTlRKZ05RREtYUCti?=
 =?utf-8?B?SnBtU24wcDVjMTlMUktIY1JYSE11bTJlUCtJVnZ2azlKOGJPZEsvWnVNU1FP?=
 =?utf-8?B?K29yeWQ5VytkME5vK0xQd01aakREUDhHQjFpRjc5WU1zc0QrS0dIOGhLOGVp?=
 =?utf-8?B?MjhsOC9BUThyQmREUERRV1RWRUpsOTFmQU1lOS9zSG51TUJIUHdtYk9LQkVn?=
 =?utf-8?B?ZVRDUmdhTVAzdjUzY21ybWozNTNVKzJtbnJIWjVHREhoMEw2Vy9tSWhzRVFU?=
 =?utf-8?B?czFWWkZBekNBdHEzUHM5cEpnTENKTjBLRmVWUTc3aGp2c1RnQUl4SldxejIr?=
 =?utf-8?B?QUFRLzJJeVhHN3NiUExjWVhEbVIwSGJsMlJQaFJaMzQyRkJ1Yy9kRXZVL252?=
 =?utf-8?B?SGpPUUM4OU1xcDFORDdXWGVnRWRVV0NHSTZITkJZcDVpeTZxTkRJK2pIcDNU?=
 =?utf-8?B?Y25LYVpEU3g3bkRqa0ZWNzN1b0xuR0JDQkJRNUdoSFJ1aXRQZEd2RXl2ZVJr?=
 =?utf-8?B?T0JGQ3E5QVg0M0JmaUs1emk0L2l2d0RCR3l4d1RkLzhGenVoR0dKTHpienBn?=
 =?utf-8?B?NjdLWVgreitaNjA1M1p6SXZDL3NJOVpMOWxReDZoYS93OXRBUCtJK09GSzF3?=
 =?utf-8?B?aXFSU2dWYnRzMmVISlNhZkJnN0lxUHNqalJ4YzVtc0lJY3FuTWRDTXcxd2lk?=
 =?utf-8?B?cCtkbTNubENERGswa3pRcHV4eFNMdkZiMkp5dUhsL3JUK25EeXRkdXpjSU1y?=
 =?utf-8?B?b0hTZ2c4d3drSnAvUU41MHdZNEMxd2dOOVczQlUrZHF3SjdvbEVPWEkyTmE1?=
 =?utf-8?B?UGVxMUZiQzFPaDVMcEI5TTU2VG5CYWFodGhjL1lYa3Y0bTVxV05mQW1wZHdy?=
 =?utf-8?B?WE54cXJPTlBrTUY1K2o3di9yVjFSZ1R4SnlTRHFuSmdVM2cvSmF6R3JSNjRV?=
 =?utf-8?B?eW0xbXBaUkQrRVZxdFFmU1NNUE9pSU9SSHJuMDBPRHJ6Sk5xT3daZXdWek5E?=
 =?utf-8?B?UFRaUEc0QklaNzlwVzdUVGhWdENqd0pRak1qbkprQXJud3ZQMU9TbExXNStn?=
 =?utf-8?B?cTgzeWpIMTRyRExYN0plUU5nZC9KMjBFSWFabjR4ZWRwL2Y5WkpmS3A2OWd4?=
 =?utf-8?B?Um5FQnlOa3RjK3I1a3ZhcVJTeXp0UnMxdnZZMzRiSXlRU3BiYWRLNjBwVUZq?=
 =?utf-8?B?L1lDT2F4WnlueGpFRWxCVS9rQlhObjRFUWdRNnlCTm9DZW9tM2xUS2NaNWo1?=
 =?utf-8?B?WjhZckZSak1jbkhhYUx2Mm9MVWxYWHU3N243TDJFaTRYbW9ENFhlZWdkL1pH?=
 =?utf-8?B?ZUhPNVh0aGpPNURBeXYxZ0FJUnVmazRFenBJVUgvaU1QVHZXaDV6WUMwdE5h?=
 =?utf-8?B?NWxMVjR2YjJ3ZUZqNUZqYTVSdGIxQlFMR2pWRjdLWHgrUXJrMUhPbllGL2ZM?=
 =?utf-8?B?K0RjY3ROTzNGbDdMT2tyejFMYjRuYXplcVVBd2FaRjYybnE1aExOS3ZwbkJq?=
 =?utf-8?Q?Sft0WaMhj6Yp6UUEnfibSZoSCVrI1joe?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D2F03226EDED24AA4F1B2AE1B620BC3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636999c7-5e29-4d50-e3b5-08da08420049
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 18:14:39.1427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 48O9SHfQwynkSJ1Rn6zjnUWUWaiOngjTjk9a1TIS5NrCnBnb1iAv0HXKTRkQusmrXCE6dIHe0VXcR3E8+qktxdHHjyTOFM0baQMmqOTfAzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5976
X-OriginatorOrg: citrix.com

T24gMTcvMDMvMjAyMiAxNzo1MiwgSmFzb24gQW5kcnl1ayB3cm90ZToNCj4gSSBzaHV0IGRvd24g
YSBkb21VIChIVk0gZG9tOSB3LyBMaW51eCBzdHViZG9tIGRvbTEwKSB3aXRoIGEgc2luZ2xlIFBD
SQ0KPiBkZXZpY2UgYXNzaWduZWQuICBYZW4gbG9nZ2VkIHRoZSBmb2xsb3dpbmcgRmxhc2sgZGVu
aWFsIGZvciBhIHNlY29uZA0KPiBQVkggZG9tNSAodWl2bSkgd2l0aG91dCBhbnkgUENJIGRldmlj
ZXMgYXNzaWduZWQuICBUaGlzIGlzIFhlbiA0LjE0LjQuDQo+DQo+IChYRU4pIGF2YzogIGRlbmll
ZCAgeyByZW1vdmVfaXJxIH0gZm9yIGRvbWlkPTUgaXJxPTE3DQo+IHNjb250ZXh0PXN5c3RlbV91
OnN5c3RlbV9yOnVpdm1fdA0KPiB0Y29udGV4dD1zeXN0ZW1fdTpvYmplY3RfcjpzaGFyZWRfaXJx
X3QgdGNsYXNzPXJlc291cmNlDQo+DQo+IERvbWFpbiA1IGFzIHVpdm1fdCBhbmQgaXJxIDE3IGFz
IHNoYXJlZF9pcnFfdCBib3RoIGxvb2sgY29ycmVjdC4gIEJ1dA0KPiBpdCBkb2Vzbid0IG1ha2Ug
c2Vuc2UgdGhhdCB1aXZtIHdvdWxkIG1ha2UgYSBoeXBlcmNhbGwgZm9yIGFuIGlycS4NCj4NCj4g
Q291bGQgdGhpcyBiZSBmcm9tIFJDVSBjYWxsaW5nIGNvbXBsZXRlX2RvbWFpbl9kZXN0cm95KCkg
d2hlbiBjdXJyZW50DQo+IGlzIGRvbTUgKHVpdm0pPyAgV2hhdCB3b3VsZCBjdXJyZW50IGJlIHNl
dCB0byB3aGVuIFJDVSBydW5zIGl0cw0KPiBjYWxsYmFja3M/DQoNClJDVSBydW5zIGluIHNvZnRp
cnEgY29udGV4dCwgc28geWVzIC0gKGFsbW9zdCkgYW55IHVzZSBvZiBjdXJyZW50IHdvdWxkDQpi
ZSBib2d1cy4NCg0KQnV0IEkgY2FuJ3Qgc3BvdCBhbnkgb3ZlcmxhcCBiZXR3ZWVuIHRoZSBwaHlz
ZGV2b3BfdW5tYXBfcGlycSBYU00gY2hlY2ssDQphbmQgY29tcGxldGVfZG9tYWluX2Rlc3Ryb3ko
KS4NCg0KQW55IGNoYW5jZSB5b3UgY2FuIHJlcHJvZHVjZSB0aGlzIHdpdGggYSBXQVJOKCkgaW4g
dGhlIEFWQyBkZW5pZWQgcGF0aCwNCnNvIHdlIGNhbiBzZWUgd2hhdCdzIGdvaW5nIG9uIGhlcmU/
DQoNCn5BbmRyZXcNCg==

