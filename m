Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40209506CE9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 14:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308104.523653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngnSC-0002uY-Av; Tue, 19 Apr 2022 12:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308104.523653; Tue, 19 Apr 2022 12:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngnSC-0002sd-7p; Tue, 19 Apr 2022 12:59:36 +0000
Received: by outflank-mailman (input) for mailman id 308104;
 Tue, 19 Apr 2022 12:59:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mThm=U5=citrix.com=prvs=101c57682=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ngnSA-0002YD-M0
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 12:59:35 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d2097cc-bfe0-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 14:59:33 +0200 (CEST)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 08:59:29 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BYAPR03MB4454.namprd03.prod.outlook.com (2603:10b6:a03:d2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 12:59:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 12:59:24 +0000
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
X-Inumbo-ID: 8d2097cc-bfe0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650373173;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5ICpOObHlHH/dvab1Vd/nThqagLI2LtlAVVgs+J/SSA=;
  b=PQIoZKueRIMWYmjhyh2iAFz/W2wPmJZOgzfpZ4X5VwIXkbQ2x+vcU45R
   4Axegb4ePab9qUquW5GoBse1pw2r9pWwDeZHGr2d3POF50+T/pIFUguJZ
   EJidXW3u5uDr4T3O1q5d93CmfnnQiyglnP40QNXJhsQdv3C/CO8ONXDO3
   E=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 68804197
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:mD6VD60/+g9MmlSMQfbD5TNwkn2cJEfYwER7XKvMYLTBsI5bp2dWn
 GIbXGmPaPyKZmL9eNhxYNyzoxsE6pTSydNmGgRspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIx0IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1JvL6zchsEP5frs70XYjtdGHpSI41JreqvzXiX6aR/zmXgWl61m7BLMxtzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82eBfySu7e03x9p7ixKNd/Ya
 9AUdnxEaxPYbgcUElwWFIg/jKGjgXyXnzhw9gLF/fZusje7IApZ17LBMYLoRdGxSupTnmWgg
 D/f8E/oHURPXDCY4X/fmp62vcfNkjn8Q5k6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVUhm1pnfCoxAdXsZLHvMzwAaXw6HQ7kCSAW1sZjxLZcEitcQ2bSc3z
 VLPlNTsbRRwtJWFRHTb8a2bxRuwJCwUIGkqdSICCwwf7LHLu5ovhxjCStJiFq+djdDvHzz0h
 TeQo0AWjLUenMMN0aj94lHDhymEqZ3ATwpz7QLSNl9J9St8bY+hIom3s17S6K8YKJ7DFwHf+
 n8Zh8KZ8eYCS4mXkzCAS/kMG7fv4OuZNDrbghhkGJxJGymRxkNPtLt4uFlWTHqF+O5dEdM1S
 Cc/YT9s2aI=
IronPort-HdrOrdr: A9a23:Jk+8vKueoIbQbaWCCSEYfom97skCL4Aji2hC6mlwRA09TyXGra
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
X-IronPort-AV: E=Sophos;i="5.90,272,1643691600"; 
   d="scan'208";a="68804197"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDzom3zTSTyzANHBVUz6yoTfpDQP1IDOVn3M/7Ji8aduIwBUPK0vkI3eW1TkFittxur1hwBpTcqqLhIS5bVWzZWjznJ8wEidLhSdBQ2WQP5UAATpa5rUBkjCxYdB+TbxYmZj1/QgKHIdPlIpP9Xo4EP9jdjJvByV0qPkiraewupT18pfI/dSTTXq3k8GSBU/4y7SqQEzXJJgeSKYS7TxoySW4I8X30iLjdLBpNpospstwbzIdv24Y9Ckhemiz2jNAaWTbC0pSQnJk+A8KoMVLXvOqZD3+pghBYVch2YspxUDtrZay2z/iPp4A89sVbaCN3HL7dGxrOTJ1rW/PioIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ICpOObHlHH/dvab1Vd/nThqagLI2LtlAVVgs+J/SSA=;
 b=P7L6uFhQ4z1Y5uCyk0QDiiYJ4yp7h/yT9YiCIPHrPRtqu1NhTCqek1Fq+Vpy6FfmGUzxMA6E1t6FjrYbkVpbs2CFPCMqwGCFtUc/nDA8H5jWjJtdWOxqEchRpgYFUbGikQfMBq3JK/fqSXrZU+qQ48vb1YoJiiWacPNaG3tScRMtcuug177o4exRRYIHUnH9nfnCvJBdo2tMV9ZK4W1K1fkUsYdb8377oQNLgASSocIatDmmvXX6a+iHDFV7mlrahibYXPzXFLuNfhdMMVkkKzH5FShbjXPpG5t2X+dztPpiULAuAXB8D+s90Gg06JjTdRkHbKwvT8FBOosCgyet9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ICpOObHlHH/dvab1Vd/nThqagLI2LtlAVVgs+J/SSA=;
 b=tMquilAdM+c1xQw/B9Pw7GTjDnyssTktbdUPB3GcHtcgQivgXDp5SwkRzGja9iShmjeMJwHX6XkWW5ZjwoRCV4pHoYiDoK789vJl0xuMKFs6X9n9r3w0hj2u4WtUbB0UeG3qms8xdEh6g47xJ+s0bOEriDfxqcYGrRhbjgWi/AY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jan Beulich
	<jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Cheyenne Wills
	<cheyenne.wills@gmail.com>
Subject: Re: [PATCH v2] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
Thread-Topic: [PATCH v2] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
Thread-Index: AQHYU9bjmHO326ELbkuQmQOwkh6+0Kz3DCaAgAADBYCAACONAA==
Date: Tue, 19 Apr 2022 12:59:24 +0000
Message-ID: <453b9e26-2a04-5990-bf9b-5dae862e33fa@citrix.com>
References: <20220419101850.3045-1-jgross@suse.com>
 <5c6f75d7-d5d1-856f-c8d0-da1bd823be63@citrix.com>
 <b10ad983-de3e-029c-6fa4-6aa646671fc5@suse.com>
In-Reply-To: <b10ad983-de3e-029c-6fa4-6aa646671fc5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a995f764-e73b-45e6-49af-08da22046e1b
x-ms-traffictypediagnostic: BYAPR03MB4454:EE_
x-microsoft-antispam-prvs:
 <BYAPR03MB4454D5539B38A4F05F685907BAF29@BYAPR03MB4454.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xLr23wtxk07hBWe0oLoghTJlx4JaS16sPFqr6jrHuTt6pflinjAfxKJbC35XF87Yh1rzVyI+T6/XLPKdZCHCQbo/+9PzUGtAicagmk8KoIpNdW7DCpLKfzYbRxqaCgmnPT4R7nLaeISrQRFFJoMw198PaY+KSYmOiwlFLDv1kYYuF4IhlRfYCLmwx6IlmkYHUTw+OZACc6ho7e7PsOsekXerlJy+XRV4+KUrsYBeIqWEx9munlyoUrMlGXsL5SLsGr92Dxp8o6lhU2IboJdG/Ra4jTwmon/Obqib2GAkp8FRZJ03TFHGdGNhc9Ro20mHjOZHsNURHyDQJfpa+qHlpuSh9bFUveibYQiviDb5z59He6aEK+FwiCdKx7IFX/miwZtASlU40hh0bVSFrSsVe8hBONTOKHtz0ostlHa7jQCi3JAkYu25L/dxNg+uSGoEKD3OjjXPjJvAg2KYqvwtz8GMShUu2X5EwlJQXFFx2KmHw5bSRBEGH8DTaCbvYAA96dBzbL+C1doeg9oW2l3lLGHGQypPS3zdv2YBEeeKyd1o4Ybnpu5DEN0ScupvBVDgLc3AbBuEOmxwvwJbi7ejomdopc0acp+6hZHFEjmnhH3CM61f/mnNyK4pcvRV58nbM22j/BuO649uceev7MmABYOmyGzinQxwWRrJbFQoH2ykj5KtrfCRzfo0l5qJd1YMwNPz/wlzK4h3a+AYSUCoIVzXmnG6NwbrSSjy3+CFnXkQwD14CbO6F1puIUbQJh8E07/ESBBQ0+aqSeQRRk1ru3cN/nt7drG7QFSeenUpXG8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(2616005)(186003)(2906002)(91956017)(71200400001)(6486002)(86362001)(31686004)(4326008)(508600001)(83380400001)(6512007)(26005)(6506007)(31696002)(36756003)(8936002)(122000001)(66946007)(66556008)(66476007)(76116006)(5660300002)(316002)(64756008)(8676002)(66446008)(82960400001)(38070700005)(38100700002)(54906003)(110136005)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WTZTTFVqWjBUQWppMDdtT0toSHR6aEJQeUI2K05reGU0Y01JMVpNSW1oUXNN?=
 =?utf-8?B?SUtUd1NoQXgvN0M0aWZXNWJXc0NZZ3RvZVVlYnliVEJLbkp3R0tGdHVNRnRh?=
 =?utf-8?B?S1lMTnEyOVNzalIyMGtsVkk0S085bGgwRUx6VjVJWC9nc0drdFprRnJ1b2Zz?=
 =?utf-8?B?b3pEWnNzL2dreXZMZGxxZ3I5ZjRVb1pZTmNYRUhOZEhiU0lmb1ovMExRLytl?=
 =?utf-8?B?V2hndzVlWXczTEVZSC9VY25zNUNrbTJrTGRqelhuRWczUnRxamV2eXRTSzNt?=
 =?utf-8?B?Mm11QXJUTXJLWC9PZlJNdjZvNng3bFZ4L1RMZEdyMkNHNjJpKzd6b0ZNR0NU?=
 =?utf-8?B?ajRMV0ZYdDBUaTNaN1J5NlVVeVg0d0lSSFJHR0FYQjhIV0lnSmFuRHV3cGQ0?=
 =?utf-8?B?UGVEMzdtcXQ1RmpUYXFDTytKQU9xT2dIREhSRkFRU0pIeXU2bzVIK3hQVUkr?=
 =?utf-8?B?RzV0TXZwZ0YxQSt1RmlGcVZaY3lXV3FsaG1CanR5ekV4ZWcyc0NuMzZHQlhm?=
 =?utf-8?B?UW10eG5LMGhvaWhaMnVyb3R2UElvY3hsSTVPV011emU5YThNWkkyMGtGM3A2?=
 =?utf-8?B?MmN3RTJsRm1DRzI1bk1kclhMcE5UUzFSZ25RbFY2TGdPWTUwU0xYc2lYZS95?=
 =?utf-8?B?cGhnNlZSN1phZkNqV0xZajIyOFBJTGtaSjBxOXpqNHdON3N1TERLY1F6MmZa?=
 =?utf-8?B?ZmlxR2M1WGRROXRsQVpjb3hOVE1aNGh2UDBaY3hTRjZPUGFxNFJjdXNQTGNJ?=
 =?utf-8?B?UUxmTElGLzRmZXk3TE82L0ZXcUhZYzg4SURhZ1RXSGN5RW4xTTNocGU2a0hR?=
 =?utf-8?B?ajBxSU1WenBBNkVVT0xLRW9VYnVWU0VaSzNxQWVvZzFJOTIwd2ZNNUtqNHlE?=
 =?utf-8?B?UnIvUUJiajg1VXJtU2FqQjNCK2R4YXlEajNMVDZXVldXZVJoOTBaREdDbU41?=
 =?utf-8?B?elFNMHJtZDF1a25RcHl2dGNzUjRjKzJSdFlwcFlNeWt4N2E5eFhkczBzcDkr?=
 =?utf-8?B?Z0hmR0F3WHcrSGtwNWhDZk9hcStsVnVFNVN5d085Z1hzRjVTN01HQUd3dzJ5?=
 =?utf-8?B?RStidmtKakpZRjdNN1MxN0VKUFM3eGZKTzFEVThTQWVaUXpvSGs3aWlJWDdQ?=
 =?utf-8?B?ekFHMk85ZGZsbXBzZjNRcTQzWFV5a0J2bDlweWppb0diaUdpQVFqQzBUcEdG?=
 =?utf-8?B?TjhKd05lcUI1dlVrSEFubEJoNkVUQXhNR0ZPbmk3T0s4M0ZkWlhEZkV3RzVz?=
 =?utf-8?B?OE5tQUlBdmYwMGRORkg0azRsUUNJYjc5dWM2NUxmU2FhdDh1UFlMNWFHVTFO?=
 =?utf-8?B?T3ErNVJnWGI1TnRCSUM3blpCTkhtZGJQS0lMNzB3aWFjeEMyTFRsREVPQ09G?=
 =?utf-8?B?bDNTUUZFMmVwVm1xRWJBTTMxeThENU5WMUFIWWVHVDhEeGQ1Nm54YWdhMVJ6?=
 =?utf-8?B?eUVoSWh4SWhydnlNMHJOZjREZUNyajJyVGZrNTkzNVQxYUJnRzQ3R1NOc25X?=
 =?utf-8?B?Q3lManVIaWxUWFdEdDUvUk9WWVljVDhnQm40TlNYYWJDZnE1eWlMSVVta3Zy?=
 =?utf-8?B?eWRlN1hKODNVdXVsVFQ0blY1UTBiMGIrYUFzS1FleHlGaVB6UEdNclRIZmZv?=
 =?utf-8?B?dG9IdjdlMmd6cW9JbXJGMnFGeWV4dkphL3YwSElpcCtZdVZVYXJybmN0MThp?=
 =?utf-8?B?MWt3OGx0YWVjdGZxK1VhWlpPZ2Y2eXB1UzMrdmtvaXV5Ly8ySjA5UzFncWlB?=
 =?utf-8?B?V2NxcnBKWWhmbmF3NzVsdmxOWFdLLzJ5Umd2Tm5tSVhzbjRWRXFJM21IeGVG?=
 =?utf-8?B?Wk1TME9XRVo5eHk2TktVczhDZm5aWUlVWlhULzdjNWREZU5yMlN4UFgwUExI?=
 =?utf-8?B?MmVJQkQyVXZyT05YNkd1WGNTdS9UVlQ2ejN3ZkFjeTc2K0VySGdMZU1JWks4?=
 =?utf-8?B?Q2lZMmNyZ3dFUHcrTlVjZDdUNGRLRnB4Y0I0OTA5dHczUElrdy9UY0dQTzhi?=
 =?utf-8?B?Y0V4d0JURm5DV2w5eDJ6Q2tnYXBERUNVdWJwdDJOc1lCaEpQZnNNMU41WFJT?=
 =?utf-8?B?UE42cnNIY0plTmc3SnE3UnBnYnk5UmVoc1hoVHAvLzV1ZlQ5NU85dlNrbHN1?=
 =?utf-8?B?RldwMm1VaXM5NzZNTUgwZ1dWaHpjbkVxKzRFUjdyUTRObHY1NER0VDdnRm5J?=
 =?utf-8?B?ODFCcFVrZHpwWUNIbWQ3U1pQZW4xV2k3ZzJtc0h6N1kyc3I1TDdUMlgwd0VT?=
 =?utf-8?B?cTFzaWdMMko1SUNmbWhTYXVqNmJDNVlteEM4QjJVWW1Gc2hVZ2EzVU5Jd3Fv?=
 =?utf-8?B?Ti9JN2d0SXlGMS8vb3Z0andNaHBWSEhFeWZrS29UUmdEZGtVUzJQZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8DA544010D5A54791A3E7DBC81A3188@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a995f764-e73b-45e6-49af-08da22046e1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 12:59:24.4623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ONn2jK4vmhFwdlCy1jpV2F4R6jPvVg8aqhlcGYHrhp43G7fvLo5BELRxo1EOljtUnSMPrOX5+SOUIly93gw8ZTSc2Sr8tfCoW/2uMoPIUcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4454

T24gMTkvMDQvMjAyMiAxMTo1MSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMTkuMDQuMjIg
MTI6NDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxOS8wNC8yMDIyIDExOjE4LCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOg0KPj4+IEEgaHlwZXJ2aXNvciBidWlsdCB3aXRob3V0IENPTkZJR19H
REJTWCB3aWxsIGNyYXNoIGluIGNhc2UgdGhlDQo+Pj4gWEVOX0RPTUNUTF9nZGJzeF9ndWVzdG1l
bWlvIGRvbWN0bCBpcyBiZWluZyBjYWxsZWQsIGFzIHRoZSBjYWxsIHdpbGwNCj4+PiBlbmQgdXAg
aW4gaW9tbXVfZG9fZG9tY3RsKCkgd2l0aCBkID09IE5VTEw6DQo+Pj4NCj4+PiAoWEVOKSBDUFU6
wqDCoMKgIDYNCj4+PiAoWEVOKSBSSVA6wqDCoMKgIGUwMDg6WzxmZmZmODJkMDQwMjY5OTg0Pl0g
aW9tbXVfZG9fZG9tY3RsKzB4NC8weDMwDQo+Pj4gKFhFTikgUkZMQUdTOiAwMDAwMDAwMDAwMDEw
MjAywqDCoCBDT05URVhUOiBoeXBlcnZpc29yIChkMHYwKQ0KPj4+IChYRU4pIHJheDogMDAwMDAw
MDAwMDAwMDNlOMKgwqAgcmJ4OiBmZmZmODMwODU2Mjc3ZWY4wqDCoCByY3g6DQo+Pj4gZmZmZjgz
MDg1NjI3N2ZmZg0KPj4+IC4uLg0KPj4+IChYRU4pIFhlbiBjYWxsIHRyYWNlOg0KPj4+IChYRU4p
wqDCoMKgIFs8ZmZmZjgyZDA0MDI2OTk4ND5dIFIgaW9tbXVfZG9fZG9tY3RsKzB4NC8weDMwDQo+
Pj4gKFhFTinCoMKgwqAgWzxmZmZmODJkMDQwMzVjZDVmPl0gUyBhcmNoX2RvX2RvbWN0bCsweDdm
LzB4MjMzMA0KPj4+IChYRU4pwqDCoMKgIFs8ZmZmZjgyZDA0MDIzOWU0Nj5dIFMgZG9fZG9tY3Rs
KzB4ZTU2LzB4MTkzMA0KPj4+IChYRU4pwqDCoMKgIFs8ZmZmZjgyZDA0MDIzOGZmMD5dIFMgZG9f
ZG9tY3RsKzAvMHgxOTMwDQo+Pj4gKFhFTinCoMKgwqAgWzxmZmZmODJkMDQwMmY4YzU5Pl0gUyBw
dl9oeXBlcmNhbGwrMHg5OS8weDExMA0KPj4+IChYRU4pwqDCoMKgIFs8ZmZmZjgyZDA0MDJmNTE2
MT5dIFMNCj4+PiBhcmNoL3g4Ni9wdi9kb21haW4uYyNfdG9nZ2xlX2d1ZXN0X3B0KzB4MTEvMHg5
MA0KPj4+IChYRU4pwqDCoMKgIFs8ZmZmZjgyZDA0MDM2NjI4OD5dIFMgbHN0YXJfZW50ZXIrMHgx
MjgvMHgxMzANCj4+PiAoWEVOKQ0KPj4+IChYRU4pIFBhZ2V0YWJsZSB3YWxrIGZyb20gMDAwMDAw
MDAwMDAwMDE0NDoNCj4+PiAoWEVOKcKgIEw0WzB4MDAwXSA9IDAwMDAwMDAwMDAwMDAwMDAgZmZm
ZmZmZmZmZmZmZmZmZg0KPj4+IChYRU4pDQo+Pj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKg0KPj4+IChYRU4pIFBhbmljIG9uIENQVSA2Og0KPj4+IChYRU4p
IEZBVEFMIFBBR0UgRkFVTFQNCj4+PiAoWEVOKSBbZXJyb3JfY29kZT0wMDAwXQ0KPj4+IChYRU4p
IEZhdWx0aW5nIGxpbmVhciBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMTQ0DQo+Pj4NCj4+PiBGaXgg
dGhpcyBpc3N1ZSBieSBtb2RpZnlpbmcgdGhlIGludGVyZmFjZSBvZiBnZGJzeF9ndWVzdF9tZW1f
aW8oKSB0bw0KPj4+IHRha2UgdGhlIGFscmVhZHkga25vd24gZG9tYWluIHBvaW50ZXIgaW5zdGVh
ZCBvZiB0aGUgZG9taWQuDQo+Pg0KPj4gVGhlcmUgaXMgc29tZSBleHBsYW5hdGlvbiBtaXNzaW5n
IGhlcmUuwqAgVGhlIGFkanVzdG1lbnRzIHlvdSBtYWtlIGFyZQ0KPj4gd2l0aGluIENPTkZJR19H
REJTWCwgd2l0aCB0aGUgZXhjZXB0aW9uIG9mIHRoZSBmaW5hbCBodW5rLg0KPg0KPiBZZWFoLCBh
bmQgdGhpcyBpcyB0aGUgb25lIHJlYWxseSBmaXhpbmcgdGhlIGlzc3VlLCB3aGlsZSB0aGUNCj4g
b3RoZXIgaHVua3MgYXJlIG5lZWRlZCB0byBjb3BlIHdpdGggdGhlIHdheSB0aGUgcHJvYmxlbSBp
cw0KPiBmaXhlZC4NCg0KSW4gd2hpY2ggY2FzZSB0aGUgc2FsaWVudCBwb2ludCBuZWVkZWQgaW4g
dGhlIGNvbW1pdCBtZXNzYWdlIGlzICJyZWplY3QNCnRoZSB1c2Ugb2YgWEVOX0RPTUNUTF9nZGJz
eF9ndWVzdG1lbWlvIHdpdGhvdXQgYSB2YWxpZCBkb21haW4iLg0KDQpJJ2QgZ28gc28gZmFyIGFz
IHRvIHNheSB0aGF0IHRoYXQgb3VnaHQgdG8gYmUgYSBvbmVsaW5lciBmaXgsIHdoaWNoIGFsc28N
CmRpc2N1c3NlcyB3aHkgaXQncyBzYWZlIG5vdyAoaXQgZGlkbid0IHVzZWQgdG8gYmUgSUlSQyks
IGFuZCB0aGUgY2xlYW51cA0KaW4gYSBzZXBhcmF0ZSBwYXRjaC4NCg0KVGhpcyBhbHNvIHJlbWlu
ZHMgbWUgdGhhdCB0aGVyZSdzIGEgcGlsZSBvZiBhbG1vc3QgY29tcGxldGUgc2VyaWVzIG9mDQpk
ZWJ1Z2dlci9nZGJzeC90cmFwcyBjbGVhbnVwIGluIG5lZWQgb2YgcHVzaGluZyBvdmVyIHRoZSBs
aW5lLg0KDQo+DQo+PiBUaGUgYWN0dWFsIGJ1ZyBpcyB0aGF0IG5vbi1JT01NVSBzdWJvcHMgZW5k
IHVwIGluIGlvbW11X2RvX2RvbWN0bCgpLCBzbw0KPj4gd2hpbGUgdGhpcyBpcyBnb29kIGNsZWFu
dXAgdG8gZ2Ric3hfZ3Vlc3RfbWVtX2lvKCkgaXQsIGFsb25nIHdpdGggSmFuJ3MNCj4+IGFkanVz
dG1lbnQgdG8gaW9tbXVfZG9fZG9tY3RsKCksIGFyZSBub3Qgc3VpdGFibGUgZml4ZXMgdG8gdGhl
IGNyYXNoIGFzDQo+PiByZXBvcnRlZC4NCj4NCj4gVGhlIHNhbWUgd2F5IG5vbi1hcmNoIHN1Ym9w
cyBtaWdodCBlbmQgdXAgaW4gYXJjaF9kb19kb21jdGwoKS4NCj4NCj4gV2hhdCB3b3VsZCBiZSB0
aGUgcmlnaHQgd2F5IHRvIGZpeCB0aGF0IGluIHlvdXIgb3Bpbmlvbj8NCj4NCj4gSU1PIGFueSBz
dWJvcCBoYW5kbGVyIGNhbGxlZCB1bmRlciB0aGUgZGVmYXVsdCBsYWJlbCBvZiBhIHN3aXRjaCgp
IHNob3VsZA0KPiBiZSBhYmxlIHRvIGhhbmRsZSB1bmtub3duIHN1Ym9wcy4gVGhpcyBpcyBkb25l
IGZvciBpb21tdV9kb19kb21jdGwoKSBpbg0KPiBKYW4ncyBwYXRjaCBieSBub3QgZGVyZWZlcmVu
Y2luZyBkIHVuY29uZGl0aW9uYWxseS4NCg0KVGhlIHByb2JsZW0gaXNuJ3QgKHNwZWNpZmljYWxs
eSkgaG93IHRoZXkncmUgY2hhaW5lZDsgaXQncyB0aGUgbmFtZS7CoA0KYXJjaF9kb19kb21jdGwo
KSBpcyBjbGVhcmx5IGEgZHVtcGluZyBncm91bmQgZm9yIGFyYml0cmFyeSBzdWJvcHMuwqANCmlv
bW11X2RvX2RvbWN0bCgpIGlzIGNsZWFybHkgbm90Lg0KDQpUaGUgYnVnIHdhcyB1bHRpbWF0ZWx5
IGNoYWluaW5nIGlvbW11X2RvX2RvbWN0bCgpIGluIGEgZGVmYXVsdCwgd2hpY2ggaXMNCndoeSBp
dCAqd2FzKiByZWFzb25hYmxlIGZvciAidXNlIGlzX2lvbW11X2VuYWJsZWQoKSB3aGVyZQ0KYXBw
cm9wcmlhdGUuLi4iIHRvIGFzc3VtZSB0aGF0IG9ubHkgaW9tbXUgc3Vib3BzIHdvdWxkIHJlYWNo
IHRoZSBmdW5jdGlvbi4NCg0KaW9tbXVfZG9fZG9tY3RsKCkgZWl0aGVyIG5lZWRzIHJlLWNoYWlu
aW5nIHVuZGVyIHNldmVyYWwgY2FzZSB4eHg6LCBvcg0KaXQgbmVlZHMgcmVuYW1pbmcgdG8gc29t
ZXRoaW5nIGdlbmVyaWMgbGlrZSBhcmNoX2RvX2RvbWN0bDIoKS4NCg0KTm90aGluZyBlbHNlIGlz
IGdvaW5nIHRvIGxlYXZlIHRoZSBjb2RlIGluIGEgcG9zaXRpb24gd2hlcmUgaXQncyBoYXJkZXIN
CnRvIG1ha2UgbWlzdGFrZXMgbGlrZSB0aGlzLg0KDQp+QW5kcmV3DQo=

