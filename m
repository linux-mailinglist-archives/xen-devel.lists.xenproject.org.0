Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F33F50691A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 12:49:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308016.523489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nglPz-00053q-SD; Tue, 19 Apr 2022 10:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308016.523489; Tue, 19 Apr 2022 10:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nglPz-00050r-OW; Tue, 19 Apr 2022 10:49:11 +0000
Received: by outflank-mailman (input) for mailman id 308016;
 Tue, 19 Apr 2022 10:49:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mThm=U5=citrix.com=prvs=101c57682=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nglPy-00050l-7p
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 10:49:10 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55f58e1f-bfce-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 12:49:08 +0200 (CEST)
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 06:49:06 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6015.namprd03.prod.outlook.com (2603:10b6:5:38a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Tue, 19 Apr
 2022 10:49:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 10:49:03 +0000
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
X-Inumbo-ID: 55f58e1f-bfce-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650365349;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/iJe2aOTMqAbfWIsolVNit0xXp/+UJO3grns/FTuwIU=;
  b=FyVF2eR5fXoc6Q9qr/2p7y5PlHfgEwGkPgpwfPDUbdf1odzz5Km9IoLb
   RYB6zjNWM2KRghJDcWgF5YAMqzOJq7bJqLBdf9VcVKAVG35KH3yehRp9K
   E0kZ8rNwn/FBinODzsmS1kZ0qVbuN06s4NQHdNrFw9wP9gnANGZsnpYr6
   M=;
X-IronPort-RemoteIP: 104.47.57.176
X-IronPort-MID: 69396903
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Z+w91qP5WpFtqzrvrR3YlsFynXyQoLVcMsEvi/4bfWQNrUp0hGAEn
 2sfC2nVbv+CYTDxeo8kbd+x8R4GvJLVn9RkSAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl298w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zl
 fQVqZORUlcVEZbLmMM6S0d+KnxTMvgTkFPHCSDXXc276WTjKiKp79AwSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7HtaaHPuiCdxwhV/cguhnG/rEa
 tVfQj1odBnaODVEO0sNCYJ4l+Ct7pX6W2MJ8wPL9PJsi4TV5C164J2qL/TZRvG1FPUJrGexg
 Vv3w02sV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVRxSlpFaUsxhaXMBfe9DW8ymIw6vQpgqcWG4NS2cYbMR87ZBoAzs3y
 lWOgtXlQyR1t6GYQm6c8bHSqi6uPS8SLikJYipsoRY53uQPabob1nrnJuuP2obs5jEpMVkcG
 wy3kRU=
IronPort-HdrOrdr: A9a23:SKVgcaCEIYzK6tblHej1sseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuaKdkrNhR4tKOzOW91dATbsSoLcKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUeF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/fRkoj9XBIADxk7rCGTkDKB8tfBYlil9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmeHm1sBICKW3+4sow3TX+0SVjbZaKvm/VQMO0aaSAZER4Z
 /xSiIbToFOArXqDziISFXWqlHdOX0VmgLfIBej8AfeSIrCNXMH4oN69PxkmlGy0TtegPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59as5Vza/ppVFZql/1XwKqVKuZzIAvqrIQ8VO
 V+BsDV4/hbNVuccnDCp2FqhNihRG46EBuKSlUL/pX96UkdoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBcG3FmvOSxTRN3/6GyWtKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFEhVsGYjEniefvFmHKc7hiwlbF/NLQgFkPsulqSRkoeMN4bDIGmEVE0kldemrrEWHtDbMs
 zDTa5rPw==
X-IronPort-AV: E=Sophos;i="5.90,272,1643691600"; 
   d="scan'208";a="69396903"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsU0SufeZ9c0hSjsKs78/X85gU4JVM7+dHeFG0JzK/LFUXIDGA50dL+YJwhp3wBUWNZLBtwqHbMFsgY7jI+7cRE1cLUZdAQizRTFBxS+Vh8bkFr52r5+rTxQQnQLBGhw/nhFFZA/fG9W1LjeEBhaTzrxbR0v6gpw1grinqlZEoONFXkLC/VVTGAD22HdKyZ2aCbDoI+LCdhuL50lfhfhAtWm0TpbPwmtZDLBQzTTK37f9Bz+RpttgjE4ZNTLvncfa2YIDZJ/D41MCszb8vPlqrb6UtfDOJ/wl0SB/7Rvc0cBFtd+EsgNQqNqXg7fmkGwJ6/3p8KUo/ocr9lv1NSxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iJe2aOTMqAbfWIsolVNit0xXp/+UJO3grns/FTuwIU=;
 b=ONPNApyyjQxBE5xrR1xxuAQi4Gd/iCevYUfMmO+3NVpmX2vYych/qQjBxyFhR1E8pWqkZ2Wu3/Cdyc0jtbumQp42AJWl0ksYPeBIiZo+4HYmPclx5A8sguixhf3svxA4uAEwCaS4X5OrDXyYpQPNrI0HCRhGZCN8EeahTUXNB6SYv5bYm81x+yhmc+r8Hg5zpM2HQf4M4/AcGHWPtqubNjYtzosntmJTwDwmb8fdBEiy0p/rQ1e2fghmjWr28ryC0XEg53/U7OUNlbGJlbADt2w0ITqkqUEpaYvlergwlc9ayZejNMWfOSPNoXoyb2EXnVPoiSWwKKvXQcim3e8Rhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iJe2aOTMqAbfWIsolVNit0xXp/+UJO3grns/FTuwIU=;
 b=Xd5QYUFt+KjupQBdmizkuqpS4DMPEJys4EEOOtQwkH2Hxms21WUhikuZq0yAIWDzWFYnuN1zSZ0ftvC6selTqgl9dIhDSYfk2m098rzEDRzuo0Awv7DkTaNjY6N1vpvlPuLXhLzkmB4q57GzVZB0MnIDnbhtoTuHOG/AIdjPgg0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] IOMMU: make domctl handler tolerate NULL domain
Thread-Topic: [PATCH] IOMMU: make domctl handler tolerate NULL domain
Thread-Index: AQHYU9FUwjuogeCS0EWgGeBVFIanqKz3DoiA
Date: Tue, 19 Apr 2022 10:49:03 +0000
Message-ID: <6732a3c3-fc19-cbdf-7483-9f5946f1935a@citrix.com>
References: <bc61d9cd-5da4-e35c-fb21-eeba5ab6e529@suse.com>
In-Reply-To: <bc61d9cd-5da4-e35c-fb21-eeba5ab6e529@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 819a64f1-f581-4ef0-9376-08da21f2385f
x-ms-traffictypediagnostic: DM4PR03MB6015:EE_
x-microsoft-antispam-prvs:
 <DM4PR03MB6015DE6C1D91AF6AEA855DC5BAF29@DM4PR03MB6015.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 32RlAlx/jZRPnyVGVdMEmez8bXRrZqvUoqiSV8afqgPnUdLtJW92ZezRJIlVh5DhMkDc8fnIYYrKkMzeFIpMQE7nGUMmFo5yE94rDgfVg6PfCjX9yfnvKo/uybC58yUGUQ9j7eivvf1XpgaRbscPJDIEeLvwe95Buj+a8Izt47MhH+4nPwmwtKUdf1ZraNi8b63Qmle4wrUwWs6kTpfbU8KnwHJBqfZZtzgcgZ5FBJcrjXgwnygN+3takhlTBKSXui5AClcr5E0I2qDVbPXL0QtXsjN0r6Wlp88/Mj5s/WShQFff1MYiGSIJONJ0bDJdr+ePs0w8oMka3gvAifZ+1CxbgVAtqbISHnJ4DABwHpXswTjF9FiC3dnn13Ba3yhJ2DFjW7PBlH5nS6+gkDMOA+e50sK2qO/XvMhOzNoeH/cnM3eVACj73h0eiqIaWuYXj0a8eeaNj7WexvrGN82qoU/SYwUIH08tLZWIbQdrTMrqzXOTr1S8mMKmhpKQSLXPv0oEKP/lMwfRIUBuQnjjJklqmveGcG7gzu+h0+IE94AILEuShXwTO6ywlMylqVf4PX4Bt66gg0wBJf4iux+4oo2Kjda8EllHkW5GaTUsS16JFzA0QDLB2W73pcoMXtXbAOREVqkCVUpEAlNnGweDo4FoA5jRocERdeeMf9Zh/n2FTNufUmGEehMwGQ3CWs1+qPYxY2XkzA+REiRr5PBkQ1NxNUEvqiWrLABy8CihXY83JwZXGfrg6ZuREetRxbVJbrIlS2w2NArYe9x+GPONnQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(110136005)(36756003)(8676002)(66476007)(64756008)(76116006)(66946007)(6506007)(2616005)(91956017)(66556008)(4744005)(31686004)(5660300002)(8936002)(316002)(122000001)(38100700002)(38070700005)(186003)(71200400001)(83380400001)(6486002)(31696002)(53546011)(86362001)(4326008)(66446008)(26005)(82960400001)(2906002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZWtRbzNRa0U1Vjh3alBtNGh3bHBaWVBmNWpjZ1R1endMR2dXL2MwQjhENGR6?=
 =?utf-8?B?MXIzNldYK1VoOGtkb3FybFdqQXU4cXJtdi8vRVd1Z0hONU5WcFFFaW9NU09K?=
 =?utf-8?B?K3J3ZExuQ0NTU0hwWHJ0RWRmTGNoWEJVMTJYNVUwZkdlYUlWOUZGaDZ2eTRX?=
 =?utf-8?B?SWlPSkdtampXSUw1N0tsYlFnRS9sV2JhZHZnWk5RZSs5bnNBc0IzcGZxU1Mv?=
 =?utf-8?B?MDJLWnl4aVpkN3RLT3VlRUdQRGZ2NjNQRkdheVhGVHVOQ29LTHIzcTJ5a0Ri?=
 =?utf-8?B?enB3Nk1iV3JWRkpiMkwzUzh5aVJyL3hRbml1RlFmelBCMklXWE5kZmczaUIy?=
 =?utf-8?B?ZDB3ZUxMZ0NjYnQvZTJISzVHQnFYMFhiSDJlQVJ5OWNCczdHMFEydUlQUU9p?=
 =?utf-8?B?aDNvSHNlUzJTTTVHU0J2VzVsTnM2TnJyYXlwYXBUeXZQcGhnbG9BTk5OOW9n?=
 =?utf-8?B?YVl1b3NQb3NDWkp5S2EwNGJDTDVUNHg2OVVuZWtkYXhOa3VjdElGa25Rc1BP?=
 =?utf-8?B?T0ttT0VyWkxKM1ZwMHVyUnQzR2FFc0lSU2RBQ0U1UzdwaDhmMEVDT2NrQllM?=
 =?utf-8?B?MUZwMVZzaWJCNndndklFbENPVFJiaTVTNHFhMzBnOGhtTFBmd2gxcFVGcmxF?=
 =?utf-8?B?MmlQL0phOEMrSUtkOTJHeXE3M2RiVUZaQ2RERTBTT1l0anJDQkh2ZDczSlEv?=
 =?utf-8?B?a1hBZ2t6QW9RNmN6TWVmZ3RIQUFacjNHcUNSSHRIdzdtZGVPSzZQK2xjTXBX?=
 =?utf-8?B?UXdXK3NuaEZ5Wk5ucTBDZWxzWFc1WFhpeXFUSklFR2loVnRUVi93UFdyNkJ0?=
 =?utf-8?B?OG8yYjJDTVlDTEdiZzZQZ3VIMVd3Z0grUFArMjluWGYxRzQvWmhYY1czMFhy?=
 =?utf-8?B?a0RTMkdJRnVoazluVThWTG5WdDlKTUJZSHNDMmZJNHhUN3FSQjdTSEgyZkpt?=
 =?utf-8?B?UDd1YXJDREluaitNalY5N1NrbkZTaXdrKzNPaElPMjhBN21LRE0wTTc5TUNP?=
 =?utf-8?B?Q3ZlS3lIalRDc1VXb05XdlQrNEZFVGFJUWhya2VIVXhoMFFKbU9rSXJDS0xM?=
 =?utf-8?B?Ym93K3Rodk9hanpHMDUvaVF2dUs2RGo0OGQzMnBoR3FVUDJnU2dNWjM4b3Yx?=
 =?utf-8?B?VHNLemVFU2N2LytLUDUyK0UwKzNlOU9HeUd2Tys0RzFPQUhYRzV4alN2MEww?=
 =?utf-8?B?NmsyQnNWNFkyTDZoTEp0SUdMWVRZZndaMUNUZjlPSVgxVXNKUWhJSFVOOTlB?=
 =?utf-8?B?Rk5VVENPYWE1ZkJtWU4xQk9uTjJEZzg1dGd2QTZPOXpzV3pMU0Z0WTRzeVJG?=
 =?utf-8?B?RXVqcFJTK0pWSFZyUW10M0YvV1drQ0krOTlVQzVGVmZtVmhKc2R2czY5eUh1?=
 =?utf-8?B?QkZhcG5KNmVRNUNYbTJ0c0s3MVFNb1VnTnhaM1JLSmpkOHVISnlTWnVCN2FQ?=
 =?utf-8?B?OVI5eTJqVzRYdkQ1UlJXNE4rNWNHdlpLWW1ld1g0UEFRa0dhT05kTUoxeUV3?=
 =?utf-8?B?WTJ3Q1A0MzdXZWlML09nc2dPRzVRcm9jRVNJa0VjTGpkWWg1Y2JtMEdBT0hh?=
 =?utf-8?B?d0FibnFQQVdIN2VoV05lNmUrSFNxbDhVcjNJejcvZEJHT0JPYnBON0JYdGtv?=
 =?utf-8?B?R2tXdWVZRWlaeXFKanZTTE0wN3BxZGhoU2FxMUtHRGg0VUNiQW1GcXpENlhQ?=
 =?utf-8?B?aEVRZXo3Y2o5dTM5MmJtK3JtbHVTM1N0MDBrOGZhY2x6bFlOYXQwTUVYbUVy?=
 =?utf-8?B?T2hpZk5FNnVNU3ZpUXB1WG5oY2UzNlhWZlRBZ2Foeksva1RyOEtQM3ArTFk5?=
 =?utf-8?B?dDNocUt0cU1yQnJPSXRZZTAwSG5IWHduKzNuT2tSL1hSRUhITi8yODJmdUNq?=
 =?utf-8?B?NUtvMUh5SWdvb1ZwdmNWa2cyeks4cnkyTWRDai9vRjh4YzVMcldJb2c5dWdx?=
 =?utf-8?B?ejBBcld4T09EM1hVZlNQQ2lkMUIwMW9BdjZNMGo1dERuVWxYeHNqc2JqVUI1?=
 =?utf-8?B?bDhFb210bmp1RzZxK1hab3ZGa3NEc1RVR2tLZHJnNjJmc0RNMlZ3WHpndWda?=
 =?utf-8?B?Njc3RWYraWphS2VUNVNodWdQQ2FxZ3hROVZuNUtka0FXc1F4WFp1bWk0NXdE?=
 =?utf-8?B?eVNnOHM3UUtCYm4xSlhGQ0xZR2t1VkFQa1AyZDZJMExFaUs1MWdnNk5QL3M5?=
 =?utf-8?B?Yk1seTdaVWp0NENML1VEWXpYSDNyQno4S2pUYVNZRW5lczVwYWExdXpLa0hj?=
 =?utf-8?B?dE9lbGc3SndmWE9uM1RObDMwLzRLQW8wSXIrKy9VU0lZdDdZZldwVTRKQzd5?=
 =?utf-8?B?dytsWndhNjhSOFJjZVpTZ21vajVjZDVrQTFpN3B6MFMwTmtUNHdPUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71317D0892200648B53DBE61F2BFA9A7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 819a64f1-f581-4ef0-9376-08da21f2385f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 10:49:03.6686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tm/Nr6eeFrimz2HrNh1OIyL1JZOGQHhqBwczeprlbop52auk/5BLavVD8dJAFv1fSqfk21OatbZUP4S/8LO8tlDdBp8k2vfh/orAoOv7vkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6015

T24gMTkvMDQvMjAyMiAxMDozOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEJlc2lkZXMgdGhlIHJl
cG9ydGVyJ3MgaXNzdWUgb2YgaGl0dGluZyBhIE5VTEwgZGVyZWYgd2hlbiAhQ09ORklHX0dEQlNY
LA0KPiBYRU5fRE9NQ1RMX3Rlc3RfYXNzaWduX2RldmljZSBjYW4gbGVnaXRpbWF0ZWx5IGVuZCB1
cCBoYXZpbmcgTlVMTCBwYXNzZWQNCj4gaGVyZSwgd2hlbiB0aGUgZG9tY3RsIHdhcyBwYXNzZWQg
RE9NSURfSU5WQUxJRC4NCj4NCj4gRml4ZXM6IDcxZTYxN2E2YjhmNiAoInVzZSBpc19pb21tdV9l
bmFibGVkKCkgd2hlcmUgYXBwcm9wcmlhdGUuLi4iKQ0KPiBSZXBvcnRlZC1ieTogQ2hleWVubmUg
V2lsbHMgPGNoZXllbm5lLndpbGxzQGdtYWlsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpJIGRpc2FncmVlIHdpdGggdGhlIFJlcG9ydGVk
LWJ5IHRhZyBoZXJlLsKgIEF0IGJlc3QsIGl0J3MgImFsc28gbm90aWNlZA0Kd2hpbGUgaW52ZXN0
aWdhdGluZyIuDQoNCkZ1cnRoZXJtb3JlLCB1bmRlciB3aGF0IGNpcmN1bXN0YW5jZXMgaXMgdGVz
dF9hc3NpZ25fZGV2aWNlIGxlZ2l0aW1hdGUNCndoZW4gcGFzc2luZyBET01JRF9JTlZBTElEID/C
oCBUaGlzIGhhcyBiZWVuIGJyb2tlbiBmb3IgMyB5ZWFycyBub3cNCndpdGhvdXQgcmVwb3J0LCBz
byBpdCdzIGNsZWFybHkgYW4gdW51c2VkIGNvZGVwYXRoIHVuZGVyIGJvdGggeGwncyBhbmQNCnhh
cGkncyBpZGVhIG9mIHBhc3N0aHJvdWdoLg0KDQpGaW5hbGx5LCBhcyBJIHNhaWQgaW4gSnVlcmdl
bidzIGVtYWlsLsKgIFRoZSByb290IGNhdXNlIG9mIHRoZSBidWcNCnJlcG9ydGVkIGlzIHRoYXQg
bm9uLUlPTU1NVSBzdWJvcHMgYXJlIGVuZGluZyB1cCBoZXJlLsKgIFRoYXQgbmVlZHMNCmZpeGlu
ZyBhdCB0aGUgY2FsbGVyIHRvIGlvbW11X2RvX2RvbWN0bCgpLCBub3QgaW5zaWRlIGl0Lg0KDQp+
QW5kcmV3DQoNCg0K

