Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3C134E4E6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 11:57:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103369.197241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRB6y-0000Kp-7v; Tue, 30 Mar 2021 09:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103369.197241; Tue, 30 Mar 2021 09:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRB6y-0000KQ-4Z; Tue, 30 Mar 2021 09:56:36 +0000
Received: by outflank-mailman (input) for mailman id 103369;
 Tue, 30 Mar 2021 09:56:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WORZ=I4=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRB6x-0000KL-5Z
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 09:56:35 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3690e601-9868-46e5-beae-7c83b0c77012;
 Tue, 30 Mar 2021 09:56:33 +0000 (UTC)
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
X-Inumbo-ID: 3690e601-9868-46e5-beae-7c83b0c77012
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617098193;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hnTQfbeHg9DlXTMhtf1bN2bhCY5ExhlaxHfBfwMaJH8=;
  b=UObq7MP6exa9v0Ht66sWqO7tjmEy10tHqO0MJbg27rnJGQJnQMt31GmF
   2heGXnGa2VTBEcwuq4gRP3F9+aya7gEibWzg083RFm3OyT1c3Q9uFnhe3
   jgPqRoRH2IvRbLOv1F0CYpz30SDTRXSjuVg5z4oML1OtGFzBq35Evi8fA
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1tif6AZsf7cOzvaQR71sxL7vL8h5TXylpMPdhdLyZ+kPNsVOoOXeXW57R1PU3FKfvfmMP4Not0
 +O2GmwGPyWRQ16ktGzbXgZWb/ZSyKum4kPuff745XpVr9Bfhv+v/wdn6/Hvp3eHKIULyN0JDBF
 AQlsdGc495NrIss/uF+q7WsGnjOAGvrgDl+AZNDd6xKE/eIR03ZvURGzuOZGVXZqm3jEoelUWI
 7FZZwAETbs5ShIvZ8uty4nJMIoCOw7Pe4+bSEaUtcpEIjx9GsDvPcAzbrtevqbytW7/y5Vzrog
 WEw=
X-SBRS: 5.2
X-MesageID: 40433689
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Pv4vIqliAN3VsUDVBHj0/E83GpfpDfP+imdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKMaVI3DYCDNvmy0IIZ+qbbz2jGIIVybysdx94
 dFN5J/Btr5EERgga/BijWQPt48zLC8n5yAqvzZyx5WIz1CT4FFw0NHBh2AEktwLTM2YKYRMJ
 aH/MJIq36BVB0sH6eGL0IIVeTCuNHH/aiOCXI7LiUq9RWUineQ4KP6eiLy4j4lTzhNzb0+mF
 K18TDR26PLiZCG4y6Z7UD/xdB8mNztytxMbfb89/Q9G3HXpSuDIKhkU72GljgprO+o80ZCqq
 ixnz4Qe/5dxlmUUmapoQb8+wSI6kdQ11bSjWW2rFGmgcvlSCk0A8BM7LgpDCfx2g4bk/xXlI
 dotljp0KZ/PFf7swnWo+XsbVVMkHG5pHIz+NRj9EB3YM8lR5J66bAE8Fg9KuZnIAvKrLoJPc
 NJF8/m6PNfYTqhHgrkl1gq+tCqU3gpdy32O3Qqi4iQ2zhSqnhz01EV8swZhmsB75IwUfB/lp
 z5Dpg=
X-IronPort-AV: E=Sophos;i="5.81,290,1610427600"; 
   d="scan'208";a="40433689"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7Dz6Z9lfEUh2BvhZaWnrmSC0fi8nCs9gqZEocgaSS4/Iy4zGVzYQ6X+Khe2aGIYT0mK1qLklnO52HciukytRgADgPFpQPCfQvc+lvFOzbUyqxjKCtpNHMM7dZ69TjLj6vWXMueT1BJKcObV8NwqLTwm+a1LPaq5VkLO93n7QuSjB3FAuAW0fqCaAcOmgKTGfBWmnuj0BmBqFgRlfpCC+Imio5vFvI72WQfaZSi/VwTyZavk35gPVH7deIj1GzxAvmhGdB9hMJxCCiXVER84+l2J5WpZXCU5BQ/spc14wTnYTdVAFhvqwbt6dAh5K3m8oTUrCT5bDjuLkfjpYsbhbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnTQfbeHg9DlXTMhtf1bN2bhCY5ExhlaxHfBfwMaJH8=;
 b=NgVohyLJJarnyMKWvdqsSXPt4A6kUlLPwHbo/XG63ES873rYOzT8XD+ChWiCbPcbRop7ft83SNZiKseX2bifY4hy1xseSTgwv/bL94h0B+jVdi+KZhcP2zgJ+zTIdvIYYBSYHwjY96w2CPkzvIs/7/Wj0tEqc1tysTRrp0PeNdnbZl8Oai+t17hxebsbRD/+nF4NAmgYihRx+myM4DYr5nSBY6fS0ajPAq7k0o4ff8bun/g9gF4T8FtSrQqSeNsAQb0IZztwf8yZXSq8lps/v+GhMRBZfT6L8Bi7nOCkpmOPYcSj015XDGU4Bmn6YmWWq1OvmroUJOhIJ0+vi/YRnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnTQfbeHg9DlXTMhtf1bN2bhCY5ExhlaxHfBfwMaJH8=;
 b=kbuNy1QiQPHPdQEGf0imf7Fv5Um8594Gu6J3+gAmYLbLu2yXSXVOhRYctQTmaRHByR+fhju3T/j6+JAuwEhai3tUZFsBr97ic7Zv2QVBFwBnvSZZZX7llzVD4p45KUzjulsCJ3PL5LfzOGI71UBWcZjz55N4mocDunRtPBT99fg=
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>
Subject: Re: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out
 HVM-specific shadow code
Thread-Topic: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out
 HVM-specific shadow code
Thread-Index: AQHXINLTS489UfL61EKD4pjlwXnfbqqUSZCAgAbMCwCAABhsgIAAEbyAgAEUfwA=
Date: Tue, 30 Mar 2021 09:56:29 +0000
Message-ID: <2A1FCD39-D0C0-468D-A977-2FBF7126FDE6@citrix.com>
References: <20210324172608.302316-1-george.dunlap@citrix.com>
 <f41680a0-9415-ea2e-c1e3-db8b0552823c@suse.com>
 <FB9CBC51-5793-41DD-A331-5274E6A82AF4@citrix.com>
 <23461afc-c0e0-eb33-9ed3-52f050b6aef0@suse.com>
 <27ecde00-f0aa-b701-6928-5480ed805064@citrix.com>
In-Reply-To: <27ecde00-f0aa-b701-6928-5480ed805064@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0d61fc6-0862-4c8a-5e58-08d8f362170c
x-ms-traffictypediagnostic: PH0PR03MB5733:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB5733C7F0FDD1E8B84DAE977B997D9@PH0PR03MB5733.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8BNjb+aEUJcd3fcrlq4VIPYawCa0q/ycYG8XboLb31H6kzmA+eEzg+LqGYCGFsTKt4C9LcGtO07OIObvS0RGDDw6VdYIoIvBclz2w23IuuNLCWVvmUDo3/0yQveE7Xz0lxKfjqsgbhxrBxw64/5InsbfBN2nKDWulXP96ADw2j5H5c0qajqgzPz5ixCEIZ9ewH0Eoy+QmybXavk4jFZCef0M0MxfN12rs6ngHQh56Z4/HJuyh+NZuCAjvpoGwn2mz+qWPfWvjdAxAWR/DuGryQpx4retqRkocOY2EfSsCPve7iq9t6xiHEnC5768iex10Qe9AUV0RGZTa7alMFpFuvYtzk3ARDRmoPo2gUZ4fd9PQ3xyixAad1yxhoDO6JbsUG/X+bhc8OEUgp8dz9YHJoMRT8QibtUb6g6RRXL+rxMR0twJ2P/hu5Xm+OwuZolQw3PbA35eVdbLYIsVHgw/ZnL06H89xh/S13pYTxo34cR+JFpLYSCF1obo93WQU9O7lRhiIi+AmzaSa37YApZIYbxLIz4Ruqcz4ELuresoglGOUXmOGT8NvwBJnFf4CcXp7bHAWokBXWK9wsq9i091Sb1AviR7PUAJKNwKfATOppACdsDaJHDQsjGhzH8rL61kxLyJs+sw3BBQq79I/T1w9uAo4JSC4xQ3V4dPr50bn+THbrZnRBFUM41yNT0r/fF/ltWfWJzbQEXwJRHhec+Qf6AgPoOIt0O+k2Uh2m5fgf/B0bStHP8hGs6VDbyI6DJ/k6A0T4kOF3pQpd7KBnec62JkJhg/90G2DNg+mM28Qp13Djc6qgkPbidh2zv0F8G9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(86362001)(38100700001)(2906002)(71200400001)(2616005)(64756008)(91956017)(6862004)(66446008)(33656002)(966005)(4326008)(37006003)(66556008)(8676002)(66476007)(107886003)(6486002)(6512007)(53546011)(6636002)(6506007)(26005)(316002)(5660300002)(66946007)(186003)(76116006)(8936002)(36756003)(54906003)(478600001)(207903002)(219803003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?bDd3b3FEVENZSzY1WjJLU0h3VVlVbE83YjNjQ0RoRHRNUXZNcjBGMGNCdVJ6?=
 =?utf-8?B?b2lZYng5RmFNRWVhaVVUTVVMTDV3YVI3SGVZZzlicGVGVlpPK2xVbkNFOXhz?=
 =?utf-8?B?N1Q0WngvMktLYkdZRTdJdkFXbk9KWHlXWE9OVDFpbS8vcFNndzVJMURzMFFV?=
 =?utf-8?B?V2RlV1ZSUkNoSWozOWF4SkdNSHJVZkFRVEdUQkdqV0QzVURiYmtCcVpjRHdk?=
 =?utf-8?B?YkxuMWQyOTFObTlZUTZhWVlCVXpocXM1RlhBelFVQ1NBYTFjeThmV2ZpRjhn?=
 =?utf-8?B?Q3huVFFXZGlqaG91aDg1akh0S2VWazcwMnB5akJOYjhXR1k2VkZOVXk0Q3RH?=
 =?utf-8?B?bi83SU9HSHhBejJtdGluWlhreEsyREsrR2UzR3hTY3Flc1JyNVZjT0crSnVs?=
 =?utf-8?B?bVliL21kRTJjbUh1UFBjcnB6dU1OQjRDZURObTk2NFBUVWRJc1VPNTYvY3Va?=
 =?utf-8?B?ZUJzdHZMcnhkY3RMZzVrY3dhLzBEZVlvM0FwcFlDdWFCWHJhY3NCcGZMbEpt?=
 =?utf-8?B?MDc2eFRTOUEzOEtSaFZJbVROdmZGdFZqZ29BWU1RQVJacjFTNXNaRk8zMDRE?=
 =?utf-8?B?aVFla01KZVNsSmd6SjUxV1YrcVZCQ1VlZVlFNVQyWEx6TVpyazJaZmVSTE9Q?=
 =?utf-8?B?VnZPem9oNVl4NDkvWDVFckhGcXhoWUtSbEFQZ1VxNHVvQlNENkNxbVRsSEx4?=
 =?utf-8?B?aXo0MS9qeHBSOHJYNDFGWmdRUEY0ZkhmbnRwc09adG5zYngxa29VcUdKejNp?=
 =?utf-8?B?c29PdTM4bVVDUnNEZTJsQzN4RTd0MU80WUZ1SEg0Z2orWmRlcGRFMnQ1bUIv?=
 =?utf-8?B?UUQrMFNHZ0JLK25OYTdWM2ZvYzV4RWlNQ2VzUzhTUlVjMXlsS2dKOVIvUUdE?=
 =?utf-8?B?MlNCWUFNMlNOQjB6SjdmODdscTh1bDFLd1U4eTBKQml0Tlo3Tk9GVnJLeEwv?=
 =?utf-8?B?NzNnMWtmYStmSlFMb3Vpa0lXVXR4ZUw4N3Nxa1ZVaG9QZTNzUGp1UUsyYVZr?=
 =?utf-8?B?aUFzdG9Ycm5BY2VpdmRVbVR4UGVyQlREdjZFbmJGVjM2TTBjbmdNbE42LytK?=
 =?utf-8?B?L0taMDZIc0tjMnZ4MFJ0Y3ljZEZ0QTQrc1dxWSs4cDg2cTZsWkMxZlorcU5U?=
 =?utf-8?B?VGhoWG1HVUFiM0JLeHJ2cndxcXBjd05Sbi9Hcjd3b0Q0MjR3cUZEMGNLS0Uy?=
 =?utf-8?B?UUJiZG5MYmkzd1podlJNZUtINTZwZGw0QlAwaHZFWDBhUEY5VlFxZSttMDV5?=
 =?utf-8?B?bGMxek5jWlVmNnU5aHRGL2NsZGt1bXZzajNQZ2UyejNsSmN1ODJpeTdPL1pS?=
 =?utf-8?B?NlNta3VxNWJjSlFlUjlLRDRUVDU4WUlDUDIrSlRSLzRSNXBYVVMrYm1RNTN0?=
 =?utf-8?B?MjB2UGZHOXJ2WU80Q1ZyeFEzd0FONEVvN2NiRng5bk5iQTF5VjJLbzd2ZStH?=
 =?utf-8?B?M2hkZWl0OFZwbUkzYjUwZGp6eTA1aVR6M0RuZ2JiMEdvZzNvTlRzYlNJVXlm?=
 =?utf-8?B?QmE5aSttWVlVQlkzSStralVZZEgySzY4T09sc09KcG9qcDZVWGhjdGVLejdX?=
 =?utf-8?B?cHZ4aGpXQWdPdHNLR054ZCtjbmgyYmxUS0o5NXFzcndIdjJFbGJKTnNLbDhW?=
 =?utf-8?B?Ny9KSzE5UUNiQXF4dkExQlZHRS9zbHJpdU5MYmI3UWk0ajdzRU1qRjgvYzYx?=
 =?utf-8?B?alZUejZ3MUYwS3VNdDRpL1paR1NMMFZDaU9QSGlrZzdkM1ovd2lraElvZm93?=
 =?utf-8?B?RXYvM00zL2lEd3o0K2NBb25DUVlvRDJIbG55dlVjWTJIbFNic3Q0TDk5cSth?=
 =?utf-8?B?RVpXUmkxWnlYK0d1MVFJdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <671ABE92467790449B0BA7B18E2DAABD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d61fc6-0862-4c8a-5e58-08d8f362170c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 09:56:29.1388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5PpmvtG7+QIG3PLwzZveYE7gl0AO4X0xAugbeiK5NMfiQoVhugyGX9rK9njBOkZiSzZw4o9MQ4wRNY9yj1H4E57kVVZA7I0qSUC1xpwuWT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5733
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWFyIDI5LCAyMDIxLCBhdCA2OjI2IFBNLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDI5LzAzLzIwMjEgMTc6MjMsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMjkuMDMuMjAyMSAxODoxMiwgR2VvcmdlIER1bmxhcCB3
cm90ZToNCj4+Pj4gT24gTWFyIDI1LCAyMDIxLCBhdCA3OjA4IEFNLCBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+PiBPbiAyNC4wMy4yMDIxIDE4OjI2LCBHZW9yZ2Ug
RHVubGFwIHdyb3RlOg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tPg0KPj4+Pj4gLS0tDQo+Pj4+PiBNaXNzZWQgb25lIGZyb20gbXkg
bGlzdCB3aGVuIGNyZWF0aW5nIHRoZSBvdGhlciBzZXJpZXMNCj4+Pj4+IA0KPj4+Pj4gQ0M6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPg0KPj4+Pj4gQ0M6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+Pj4+IENDOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPg0KPj4+Pj4gLS0tDQo+Pj4+PiBDSEFOR0VMT0cubWQgfCAxICsNCj4+Pj4+
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPj4+Pj4gDQo+Pj4+PiBkaWZmIC0tZ2l0
IGEvQ0hBTkdFTE9HLm1kIGIvQ0hBTkdFTE9HLm1kDQo+Pj4+PiBpbmRleCAxNWEyMmQ2YmRlLi40
OTgzMmFlMDE3IDEwMDY0NA0KPj4+Pj4gLS0tIGEvQ0hBTkdFTE9HLm1kDQo+Pj4+PiArKysgYi9D
SEFOR0VMT0cubWQNCj4+Pj4+IEBAIC0xOCw2ICsxOCw3IEBAIFRoZSBmb3JtYXQgaXMgYmFzZWQg
b24gW0tlZXAgYSBDaGFuZ2Vsb2ddKGh0dHBzOi8va2VlcGFjaGFuZ2Vsb2cuY29tL2VuLzEuMC4w
LykNCj4+Pj4+IC0geDg2X2VtdWxhdGU6IEV4cGFuZGVkIHRlc3RpbmcgZm9yIHNldmVyYWwgaW5z
dHJ1Y3Rpb24gY2xhc3Nlcw0KPj4+Pj4gLSBDSSBsb29wOiBBZGQgQWxwaW5lIExpbnV4LCBVYnVu
dHUgRm9jYWwgdGFyZ2V0czsgZHJvcCBDZW50T1MgNg0KPj4+Pj4gLSBDSSBsb29wOiBBZGQgZG9t
MGxlc3MgYWFyY2g2NCBzbW9rZSB0ZXN0DQo+Pj4+PiArIC0gRmFjdG9yZWQgb3V0IEhWTS1zcGVj
aWZpYyBzaGFkb3cgY29kZSwgYWxsb3dpbmcgUFYgc2hpbSB0byBiZSBzbGltbWVyDQo+Pj4+IEJ1
dCBzaGFkb3cgY29kZSBkb2Vzbid0IGdldCBpbmNsdWRlZCBieSBkZWZhdWx0IGluIHNoaW0tZXhj
bHVzaXZlDQo+Pj4+IGJ1aWxkcyAoYW5kIG90aGVycyBhcmUgdW5saWtlbHkgdG8gZGlzYWJsZSBI
Vk0pLg0KPj4+IENhbiB5b3UgcHJvcG9zZSBzb21lIGJldHRlciB0ZXh0IHBsZWFzZT8NCj4+IERv
ZXMgdGhpcyBuZWVkIG1lbnRpb25pbmcgaGVyZSBpbiB0aGUgZmlyc3QgcGxhY2U/DQo+IA0KPiBJ
IHdvdWxkIHJlY29tbWVuZCBub3QuDQo+IA0KPiBXZSd2ZSBiZWVuIGRvaW5nIGluY3JlbWVudGFs
IGltcHJvdmVtZW50cyBmb3IgdGhlIHNoaW0gZm9yIHNldmVyYWwNCj4gcmVsZWFzZXMgbm93LCBh
bmQgaW4gdGhpcyBjYXNlLCB3ZSdyZSBsaXRlcmFsbHkgdGFsa2luZyBhIGZldyBrYiBvZg0KPiBj
b2RlLiAgQXMgd2UgYWxyZWFkeSBhbGlnbiB0byAyTSBib3VuZGFyaWVzIGZvciBzdXBlcnBhZ2Ug
cmVhc29ucywgdGhlcmUNCj4gYWxtb3N0IGNlcnRhaW5seSBpc24ndCBhY3R1YWxseSBhIHJlZHVj
dGlvbiBpbiBydW50aW1lIHNpemUuDQoNCkkgZG9u4oCZdCB1bmRlcnN0YW5kIHdoeSB0aGUgdHdv
IG9mIHlvdSBhcmUgZG93bnBsYXlpbmcgeW91ciB3b3JrIHNvIG11Y2guICBZZXMsIHRoZXNlIGFy
ZSBhbGwgb25seSBpbmNyZW1lbnRhbCBpbXByb3ZlbWVudHM7IGJ1dCB0aGV5IGFyZSBpbXByb3Zl
bWVudHM7IGFuZCB0aGUgY3VtdWxhdGl2ZSBlZmZlY3Qgb2YgbG9hZHMgb2YgaW5jcmVtZW50YWwg
aW1wcm92ZW1lbnRzIGNhbiBiZSBzaWduaWZpY2FudC4gIENvbW11bmljYXRpbmcgdG8gcGVvcGxl
IGp1c3Qgd2hhdCB0aGUgbmF0dXJlIG9mIGFsbCB0aGVzZSBpbmNyZW1lbnRhbCBpbXByb3ZlbWVu
dHMgYXJlIGlzIGltcG9ydGFudC4NCg0KSSBtZWFuLCBsb29rIGF0IHRoZSByZWxlYXNlIG5vdGVz
IGZvciBHbyAxLjE1IFsxXS4gIEl0IGluY2x1ZGVzIHRoaW5ncyBsaWtlIHRoaXM6DQoNCiJKU0Vz
Y2FwZSBub3cgY29uc2lzdGVudGx5IHVzZXMgVW5pY29kZSBlc2NhcGVzIChcdTAwWFgpLCB3aGlj
aCBhcmUgY29tcGF0aWJsZSB3aXRoIEpTT04uIg0KDQoiZ28gdGVzdCAtdiBub3cgZ3JvdXBzIG91
dHB1dCBieSB0ZXN0IG5hbWUsIHJhdGhlciB0aGFuIHByaW50aW5nIHRoZSB0ZXN0IG5hbWUgb24g
ZWFjaCBsaW5lLiINCg0KVGhvc2Ugc291bmQgZmFyIG1vcmUgdHJpdmlhbCB0aGFuIOKAnEV2ZW4g
bW9yZSBzaGFkb3cgY29kZSBoYXMgYmVlbiBtb3ZlZCB0byBhbiBIVk0tc3BlY2lmaWMgZmlsZeKA
nS4NCg0KSWYgdGhlIGFwcHJvYWNoIGlzIGdvaW5nIHRvIGJlIOKAnFNVUEVSIElNUE9SVEFOVCBT
UEVDSUFMIFNUVUZGIE9OTFkiLCBJ4oCZZCByZWNvbW1lbmQgcmVtb3ZpbmcgQ0hBTkdFTE9HLm1k
LiAgSGF2aW5nIGFuIG9mZmljaWFsIGxpc3QgdGhhdCBzYXlzLCDigJxXZWxsLCByZWFsbHksIHdl
IG9ubHkgZGlkIDIgdGhpbmdzIHRoaXMgcmVsZWFzZeKAnSBpcyBnb2luZyB0byBiZSBhY3RpdmVs
eSBoYXJtZnVsLiAgDQoNCiAtR2VvcmdlDQoNClsxXSBodHRwczovL2dvbGFuZy5vcmcvZG9jL2dv
MS4xNQ==

