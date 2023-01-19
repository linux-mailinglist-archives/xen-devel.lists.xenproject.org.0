Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E36FE6736C6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 12:28:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480960.745609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIT4y-0001FF-St; Thu, 19 Jan 2023 11:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480960.745609; Thu, 19 Jan 2023 11:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIT4y-0001DD-Q2; Thu, 19 Jan 2023 11:27:36 +0000
Received: by outflank-mailman (input) for mailman id 480960;
 Thu, 19 Jan 2023 11:27:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YmS1=5Q=citrix.com=prvs=376161a5e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIT4x-0001D7-DS
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 11:27:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 431ec1ae-97ec-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 12:27:33 +0100 (CET)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 06:27:20 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6084.namprd03.prod.outlook.com (2603:10b6:610:bb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 11:27:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 11:27:17 +0000
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
X-Inumbo-ID: 431ec1ae-97ec-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674127653;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NM5XKlfSWDVHdKp0gC68POdu2jjOPixbZWn1PSs/o1Q=;
  b=Ispev0seQb1EackCP0+YL+IKLLL0FBt1dm2FMBB9/0B5I4VQSkxeOfh3
   KKlzMSIXDpct95sAXyqJehDgL+HFva9r2W1KDEnAsQN6ZoLBMs6uBo62E
   i6LMZzf3VU7Xhm1MaagS6qiZZfVu9oqhXpvWNzBIsIRAtRXGl0F+BC5LP
   Y=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 93296473
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DK38X6hvnOX/lSpv2ILsspobX161tREKZh0ujC45NGQN5FlHY01je
 htvD2yAbPffZzb3LdglPNizoUkF6p7Smt8xSAQ6/3tkEC0b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5QaPzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQRGh0sSBW4ot6O+/Gfaep9t555DZf0adZ3VnFIlVk1DN4AaLWaG+Dv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluG1bLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6Rebip6A23wb7Kmo7MzorUl+B/9aAhEOZYPFCC
 x0N2AUoov1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+WsDezNC49PWIEIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 FiisywWl7gVy8kR2M2GEUvvhjutot3MUVQz7wCOBma9tFohOMiiepCi7kXd4bBYNoGFQ1Kdv
 X8C3c+D8OQJCpLLnyuIKAkQIIyUCz++GGW0qTZS81MJrG3FF6KLFWyI3AxDGQ==
IronPort-HdrOrdr: A9a23:CYx6MKH0LwEFYah2pLqFxpLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNJICPoqTM2ftW7dySSVxeBZnMbfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj3Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oK+RSDljSh7Z/9Cly90g0FWz1C7L8++S
 yd+jaJppmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjow4OyjhkQGhYaVmQvmnsCouqO+ixV42mJ
 3nogsmPe5093TNF1vF4CfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqA/7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1bwKoVKuZFIMvJ0vFgLA
 BcNrCE2B+QSyLDU5nthBgp/DVrZAVpIv7JeDlZhiXf6UkqoJkw9Tpl+CVYpAZCyHt1ceg72w
 yPWJ4Y641mX4sYa7lwC/wGRtbyAmvRQQjUOGbXOlj/ErobUki946IfT49Flt1CVaZ4uqfaoq
 6xGW9wpCo3YQbjGMeO1JpE/lTER3i8Ry3kzoVb64JisrPxSbL3OWnbIWpe2feIsrEaGInWSv
 yzMJVZD7vqKnbvA59A20n7V4NJIXcTXcUJspIwWk6IoMjMNor239arO8r7Nf7oC3IpS2n/Cn
 wMUHz6I9hB9FmiXjvijB3YSxrWCzvCFFJLYdznFsQoufsw39d3w3koYHyCl7G2ACwHtLAqd0
 1jJ76imr+npACNjBP101k=
X-IronPort-AV: E=Sophos;i="5.97,229,1669093200"; 
   d="scan'208";a="93296473"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTlnj/PwYhYh5VVwLD/1MXXgeCBA2kpJBM8cH7etT0mGg7N2cE4OXf+okKrvm3UdVos478yYnWPBDpGPJymp0JWYLnZ3L8iBulN3KkFvZoMKigHIiZhuZQTs5/hSW6fI0unB5wQ/OmUxLH3SkFt/VIZD66DjQE0dIKMGPH1LZTlVMwYJXZ7a6VmtbdHU1jFZmOzafV1AzC0tYEZtSW/V3tu+JP0p8kPKi17bCxb0QMZ2sPrCYmx+CHaQPiyx7mXPL0Dzal1FC9BiBf+zg2UIWARaw4BvQDfSxH1AJ04/3TqfcCnJQYPhfVxemE+m2Tffb3SSroLfUw/hURAOgd1GJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NM5XKlfSWDVHdKp0gC68POdu2jjOPixbZWn1PSs/o1Q=;
 b=P4rT0uP0cxDb1FcoPpjhHmkpGBjkbg1PPl1xoRXJWwlU0a8m3TtD4VG4sT+uStdqorqElYrA+SWo3z6uLHNDgGy2LcSrZkpjmNn1nw4BHdo8dTVExOsbGf8sVXIlynnxEu8UVcC0WyFj03JT8xP5gBP9hutU/npLl+0tlgfbOayM02McVLbBrR6iWzLBQZO/VJNpJMGxeqJBet3v8JTnAxjsdstj20Ine7i9ixz+Ufr7QzOanJIwHAgbstXNhpNC0Det7QDIPZUPuKYq0Mwl+DOTjdrul0XAq5ReytbOY4WjAwHmq4RY8m+U5ZBNFztNqp7uAD/FUrj1z+kZHb4pgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NM5XKlfSWDVHdKp0gC68POdu2jjOPixbZWn1PSs/o1Q=;
 b=m89nULk2TaZFZ63IvEtNbgwESQDUNa2mEjY0GpHNYp10rtA5eoQcSpdepmFdeY5KszVKE+MP7bislPHHbjJYGKZgqTNiNcUPrZ4UIONnz/1rFgm3AWbThAwoG6W3lie1irrd+zTO0PFKQJFXjO4uMmCGuAiNUlznVKqAAWtyQtc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Anthony Perard
	<anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3 1/1] build: replace get-fields.sh by a python
 script
Thread-Topic: [XEN PATCH v3 1/1] build: replace get-fields.sh by a python
 script
Thread-Index: AQHZKdXmSfLi4OljAEm5WNlNB2w+ZK6i3JyAgAGjEYCAARRgAIAACj+A
Date: Thu, 19 Jan 2023 11:27:17 +0000
Message-ID: <30ab5861-c134-42fd-0c3b-035dda2f8be2@citrix.com>
References: <20230116181048.30704-1-anthony.perard@citrix.com>
 <20230116181048.30704-2-anthony.perard@citrix.com>
 <1ab3bc93-326a-172d-4f0f-f6c2ddc84105@citrix.com>
 <Y8g4pSOHvrkqmbTU@perard.uk.xensource.com>
 <6665ebac-6489-2d6a-0b9d-30342c1661d9@suse.com>
In-Reply-To: <6665ebac-6489-2d6a-0b9d-30342c1661d9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH0PR03MB6084:EE_
x-ms-office365-filtering-correlation-id: d0dbbf1e-33f6-4072-767a-08dafa101f3d
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jPjWMCIxLxKOVZ081Oo+/yYRuCfMquIy1V8bv0/lq8aXV8/3N55Iy0cXDFlhovarGqR9W8qsUU5wmtkZcI8MoKZ4r0FJg/3+rWhcM1E2UEyAQJQZ0wJtu5es98lBx5XIr/nqmJ+Ve5WfnxVOq41UkM+gTKFVG8SjK4GHqrrb+9G9KATb7/gUQScjJx8Uz6+R/36SiHB1zcuwFW+rfzO7x+cYRMm+Lsp6+L3/bD50a0lgOVlDj+nz366niWQlJiuicWur4K9clUEBIS61QMVam4ewU1av2ODGgH7LWe3gZd4vYEsDhaeoO4SglegDkrKVf0Swr5195l4/OT6GfNOV8wEDyqKd186waROuQ3Ms4SZuC6KxB+x8jngU4RWnvWwxY97rV9iqLCqxZOjQSbsST+Eqk9/I8pYYYpdAdxKw3bGYwIccfVt/gYeo0YEOD68V4XJugL0BNkVaBtC9rMvnkIiF4tAdUWsDxAcnFFHtdHxHvSd5AJ2TovsUq8+qAA7D+yPH4Cjd+a+qya9AlUdGbdc3wkpJWdC7vYplDM/GM77JcMnLJqfP6mm9sNO1E+43S8iLHJ9knalPURfaZ/w5xzYQ5SMPz79Xm3KDXYPVmMptRacMP8fUb9mG1vG3+Nq/EMvJfvSYcBoKqi3s0K3deOJtaNRno1R8KdETfABDP7ZAviRqmTw1x4jP7dB/SfR0c+dlQeReue1A41h2fbbz26YVTRE6m9snBtepvoIEk8z4GNMZvtB0ECE45BBU4sWYtKyTHJBU2Or34eUi9jUg6g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199015)(82960400001)(66946007)(64756008)(316002)(31696002)(122000001)(38100700002)(86362001)(5660300002)(8936002)(66476007)(2906002)(76116006)(66556008)(91956017)(66446008)(41300700001)(8676002)(2616005)(26005)(6512007)(186003)(53546011)(54906003)(71200400001)(110136005)(6636002)(4326008)(36756003)(478600001)(6486002)(6506007)(38070700005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TXhZU1FxQ0poR2xCQXlGZ1RuQTdyc2V3UHFKZG95NXdmMXMybnhSR3RtVk9U?=
 =?utf-8?B?QnUzcDJ2WE1Na1g1WFcwMXNBTFJDd1Z4MzBVN2FOQnBJMVJVb1ZsWWpYV3o2?=
 =?utf-8?B?L0dBZkNQQlR4c2lkV0JQYVorVEZNRUY2Q0xoNm5KUEZFd2FqbHNwSEdZR1Bl?=
 =?utf-8?B?THJ2Y0JDeDE0QUV6eEpNRGt3L240NGtpNjVIVHZtZXJJSWsvMXRXQUVCaFRJ?=
 =?utf-8?B?NG5URDBvRlZ4RzRmZmFxcWRFRXZLcERoS0xTYlp3SmxBaDU1Ni9MWXg2UXNw?=
 =?utf-8?B?WTJvRjhwWmdrV0VrY2dEYVVpU2N6SGZjdnN2SUpnMHovQ2JXT2pxL1RLd0Vy?=
 =?utf-8?B?Wng2ZVROeHlJMy9JaDV3OXJIOVpCY2hSTFNieUFRZ3o0MFV2a29hcUhpSGNB?=
 =?utf-8?B?S1llSUNaY2U4K09MTlpIWEU5amFoQlVjRDhXZmlkdTJHY0RQa1JibTdUemZW?=
 =?utf-8?B?dXdtRXBTYlY0OHk2ZFRXMCtsTHdqZkVMaktyZmM0bWF2ekFVOEZNZGd6LzMw?=
 =?utf-8?B?SStRZXM5QUQxeU1hbEF5ZWVnanRYV05MdUhORlZtcldKeVUwK1V2Mm1TMWIz?=
 =?utf-8?B?UmlwbXNkV0N6NldKcjM2bU45Sk5NblJoemFGcFo0NDhGYzlCeE01aS9kRkwz?=
 =?utf-8?B?R1o1QnpVTnJibE9qNkVDWTNObU1KVW90dlluRW1GVXlvTU1mTmJGYmNJRGxk?=
 =?utf-8?B?akt5YTZhcXVzSlR1aldlWnhtdDZKekYyOS9oMEppbXBxeVRvekFSa0txUXV6?=
 =?utf-8?B?Wk04UmI4YkxTUVBIcXlUUTJqbXBTWGVNZTVYVWFkNHkwamplVlRoMnYwT1hM?=
 =?utf-8?B?TUxxWTE1NnRkYkp6MFhvOEhyZE1RT251a2p1THpacU1sS0tDVTZESkVEZkdY?=
 =?utf-8?B?WW1XNXp3L2xjV3BGeWQvOThOZ1NDbC9LVW5qQVdSK3l6anNXZm1PN1N1ZEZS?=
 =?utf-8?B?QXZ4OExDb0dCdktVanlleUdDV0NuUXZSNnpHOHpNL1pOaHVsK0s5bDNudU5V?=
 =?utf-8?B?RGtMV3F4ZnNmTzJ1MXVRVVorRUNRNEt0SWFTVXZjd2lnc0lIREVCY0h3L0dt?=
 =?utf-8?B?cnhKUXlXeTJDS1U5elhpQ3hPQXRjN1B4ajJhRll5Y2c4MUxyV1VYTmQ5QmZ1?=
 =?utf-8?B?V010REcvZzFHY0I5TFIxRTFKVDRwMTVBalhYckUzL2VvaGpnQTZkNkpzSVRT?=
 =?utf-8?B?eEczZUdQQmFnYk1hb2Z5Mk9DUEtxUjNzNzFyRXVMU3AwUFdCL0NIVytTYzJw?=
 =?utf-8?B?RVdqYnJsNnhjNDRQNVo3b3RaRXhXRDU3MHNYSEVON3UrZVViTnQ4RzlLR0dn?=
 =?utf-8?B?dGY1NTBkZjRYOFRSTXd4aEtBU0MwbXNhMDJCeHJ0Nk52YmJ4TnhWcDJHOTdi?=
 =?utf-8?B?VTlER0VCN3QrbzVrNStvLzd1M2FLQmduM1drOGtMZDlwTGRUTUNGK1hISEw1?=
 =?utf-8?B?VUZEaWN2cUh2NmlMZXFEdmpzUVZiYnhOTXJucXpVYThjMWFsZU1IZWxwN1Jz?=
 =?utf-8?B?dHNDOFFkVGhaSFdvVFhOY1JpOGVvWFY2dksyUzY1Ry9FSXMwM3ZWTWc1UHZI?=
 =?utf-8?B?ODZmUmZKaFNMQWlOcGhxRlR6V0pYaEpsNGRNdWN5aUVYM3lvL2RieFJ1ajkr?=
 =?utf-8?B?c25lR01yZmU5bEorU0Y1UHR2dEpNU2FSOWN3SEVwSmR4L3JSUE00L1V6MFMy?=
 =?utf-8?B?S1BtOVplN3ZSaVExNS81aC95VlJFOHlNWU0vL3VxNitUYVJPOTAxd2tqdUQy?=
 =?utf-8?B?bnY5T01oTXA0cXA1VWlqVVBmdWYzOVpvdXlzWWsvUFVrZURIbjR2R1lmT1VF?=
 =?utf-8?B?UVVGWVIrdXFtVHNzSnh2WEN4ekc3QnJCdmUzVGFCVmdEaVMrTUxvYVpMcUtV?=
 =?utf-8?B?U1pPOWd1dkZ0ZnpqamM1L1FXM1ZaNHZ0WlVzTmlDalM2ZlZHVDgwZ3JEeWMx?=
 =?utf-8?B?U05PdWRSUW9LTlFUbVV3Nm5PemVrcnIrbzFTZWdTMDhyWXlPdk1SUEg3cFh0?=
 =?utf-8?B?MWU0Qkp6TGYybitKcVhzYkNBN3BxRWlsUzBiWDMwaVI5QmZVK0lvZ2pKeGxD?=
 =?utf-8?B?d3JVajlnNDJzeVN2MlFwTWNnRjB6WU8vcHd6QVhxb0tvS25ydzFRNlJpcHov?=
 =?utf-8?Q?9zwfaI4olVNZbMvCairrTwUOY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CC73485B12DEF47AF0991FF51C5FC5C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	g+TVwDuAIPLHTfl6G+oycRkieBwIW3mLwdYHQGN5FMT02u7p12S6ZyfStjr56qUxq6f9+aYqF5JI+lJvIu25MtjnqKUSnYfaB+i2gFIIqq6H2Yt/1aLO5eHeLQHk6Uacyu0nyCA1bi8HrvJwK0TZdMF4QNOzxUA3lZ9EDKNBBSfe/ljpx35WpDAYxDwXy/ZtImSW+r1KvDn504FzMo0nTE4Z24/Zs/3UL0Z2cyXPzSejkalOMkMzdIAL6MEJs16JzLYywP5oeTpBeg0FkEVWyA6KSBrTwJwiKZIUKIn/OB0Gojp+4LI1zO4DMR7UksHtwpF9liVb6hvQOsK/UluyyBZZVXUVVkPwIUuAd9W1V10xzv5mxCnIAbYzdcaX0aTsZa4jWrMrGvvSLej7Yrffk5DgBWdl6z2hOnF82fQd1N4QsmcE3Tc35Cxt3Tz+tC+4a4tmAYaYUEHdIJtYaZG0R08iAGXk9iGnbOqF8DXY9hQONvQtFL9PU8+gh1g9EkBWTpDRRLdgcJWWxKsCVvMTc8Jt+QVCPFoOFcYYzNi7yi9pxoeAhb10TQudOtkOgh6UaSiw/ioCbLWJhQ5iEPHXNsNfHDAiTmnWpjzoQcMsTGILmCqTC9A+Eazvt90OZyuEYfFZq3n++fs/htO1m0a+NJv8lVvWW2NBriM0etV3kj0D+TPlHUipkPkaii64Bt6wHWHlX4SCfBjzRncde5Kk2vd54qyWwB+bh+kwRMq9eP916DBh0/IgZ3ebiOHIjyaQ8uH4Mf2f61ZTmk828PfZiEvAuEBIzNWSZ3Q2TJ4zi15renHNKmK0r8w1uRoLgqx3Y2GmneXqQAs9kpMRQH7TtNrUjQQ2Is8f8SHxRSpi4Hs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0dbbf1e-33f6-4072-767a-08dafa101f3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 11:27:17.6420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D7R7Yb5hdZ3aFUdYjKZMlGQJ7c9SXZLGVirTj+JyXlXAlqbHt763kK74DLX8J2oHkf28zfzc5ArguQKQQLwbk4cm+Vd4La/MPgOEKnXrMgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6084

T24gMTkvMDEvMjAyMyAxMDo1MCBhbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE4LjAxLjIw
MjMgMTk6MjEsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPj4gT24gVHVlLCBKYW4gMTcsIDIwMjMg
YXQgMDU6MjE6MzJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+PiBPbiAxNi8wMS8y
MDIzIDY6MTAgcG0sIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPj4+PiArZGVmIGdldF90eXBlZGVm
cyh0b2tlbnMpOg0KPj4+PiArICAgIGxldmVsID0gMQ0KPj4+PiArICAgIHN0YXRlID0gMA0KPj4+
PiArICAgIHR5cGVkZWZzID0gW10NCj4+PiBJJ20gcHJldHR5IHN1cmUgdHlwZWRlZnMgYWN0dWFs
bHkgd2FudHMgdG8gYmUgYSBkaWN0IHJhdGhlciB0aGFuIGEgbGlzdA0KPj4+ICh3aWxsIGhhdmUg
YmV0dGVyICJpZCBpbiB0eXBlZGVmcyIgcGVyZm9ybWFuY2UgbG93ZXIgZG93biksIGJ1dCB0aGF0
DQo+Pj4gd2FudHMgbWF0Y2hpbmcgd2l0aCBjb2RlIGNoYW5nZXMgZWxzZXdoZXJlLCBhbmQgcHJv
YmFibHkgd2FudHMgZG9pbmcNCj4+PiBzZXBhcmF0ZWx5Lg0KPj4gSSdtIG5vdCBzdXJlIHRoYXQg
Z29pbmcgdG8gbWFrZSBhIGRpZmZlcmVuY2UgdG8gaGF2ZSAiaWQgaW4gKCkiIGluc3RlYWQNCj4+
IG9mICJpZCBpbiBbXSIuIEkganVzdCBmb3VuZCBvdXQgdGhhdCBgdHlwZWRlZnNgIGlzIGFsd2F5
cyBlbXB0eS4uLg0KPj4NCj4+IEkgZG9uJ3Qga25vdyB3aGF0IGdldF90eXBlZGVmcygpIGlzIHN1
cHBvc2VkIHRvIGRvLCBvciBhdCBsZWFzdCBpZiBpdA0KPj4gd29ya3MgYXMgZXhwZWN0ZWQsIGJl
Y2F1c2UgaXQgYWx3YXlzIHJldHVybnMgIiIgb3IgYW4gZW1wdHkgbGlzdC4gKGV2ZW4NCj4+IHRo
ZSBzaGVsbCB2ZXJzaW9uKQ0KPj4NCj4+IFNvLCBpdCB3b3VsZCBhY3R1YWxseSBiZSBhIGJpdCBm
YXN0ZXIgdG8gbm90IGNhbGwgZ2V0X3R5cGVkZWZzKCksIGJ1dCBJDQo+PiBkb24ndCBrbm93IGlm
IHRoYXQncyBzYWZlLg0KPiBUaGVyZSdzIGV4YWN0bHkgb25lIGluc3RhbmNlIHRoYXQgdGhpcyB3
b3VsZCB0YWtlIGNhcmUgb2Y6DQo+DQo+IHR5cGVkZWYgWEVOX0dVRVNUX0hBTkRMRShjaGFyKSB0
bWVtX2NsaV92YV90Ow0KPg0KPiBCdXQgdG1lbS5oIGlzbid0IGJlaW5nIHByb2Nlc3NlZCBhbnlt
b3JlLCBhbmQgaGVuY2UgcmlnaHQgbm93IHRoZSBsaXN0DQo+IHdvdWxkIGFsd2F5cyBiZSBlbXB0
eS4gQXJlIHdlIGdvaW5nIHRvIGJlIGFibGUgdG8gZ3VhcmFudGVlIHRoYXQgZ29pbmcNCj4gZm9y
d2FyZD8NCg0KSU1PIHRoYXQncyBhIGNvZGUgcGF0dGVybiB3ZSB3b3VsZG4ndCB3YW50IHRvIHJl
cGVhdCBtb3ZpbmcgZm9yd2FyZC4NCg0KVGhlcmUncyBhbHJlYWR5IHRvbyBtdWNoIG1hZ2ljIGlu
IGEgZ3Vlc3QgaGFuZGxlLCB3aXRob3V0IGhpZGluZyBpdA0KYmVoaW5kIGEgdHlwZWRlZiB0b28u
DQoNCn5BbmRyZXcNCg==

