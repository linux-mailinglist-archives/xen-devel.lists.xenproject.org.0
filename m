Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7544A678BD1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 00:09:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483331.749442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5wI-00054i-L5; Mon, 23 Jan 2023 23:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483331.749442; Mon, 23 Jan 2023 23:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5wI-000522-Hb; Mon, 23 Jan 2023 23:09:22 +0000
Received: by outflank-mailman (input) for mailman id 483331;
 Mon, 23 Jan 2023 23:09:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTo8=5U=citrix.com=prvs=380e0b34c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pK5wH-00051w-M6
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 23:09:21 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5c6513b-9b72-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 00:09:18 +0100 (CET)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2023 18:09:15 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5288.namprd03.prod.outlook.com (2603:10b6:610:9b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 23:09:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 23:09:13 +0000
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
X-Inumbo-ID: f5c6513b-9b72-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674515358;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MS2c150mQ60+qHYVrs8WlxwdtITVkNalm9pR6FWHaBQ=;
  b=G/xyv2XavWQo1X+284oua8o34HFw0juf79K/SvBbcs/5MW2X+xEXPur8
   mFPvg7+Hlan29SW+m/hx4tuM4uz4lY5twy/lq/CK0EXfX99MG1GLv+R3R
   QWHURDEvbzkprKygcAxePZnPUTd+NXu1aXjZo8ywCH387kIEKagnyywwI
   I=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 93936651
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4eOPNKz/1b19hBNKuWB6t+e0xyrEfRIJ4+MujC+fZmUNrF6WrkUAz
 GQcWTuAaPyPZGGmL9B1bdvi90IEsZ+AmtIwGQtsqCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRnP6sT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KT8X7
 sMBbzQUVRqCqv2t7pW8SLQvne12eaEHPKtH0p1h5RfwKK98BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVIguFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqA9NJSuPlr5aGhnXC7Ug1Kz4QcGC2/9uZhG6YCutaC
 Rctr39GQa8asRbDosPGdxe/qnSVswUcX9dVGusS5wSEy66S6AGcbkADSjNCc90n8swrXzsh1
 lyOt9zsDD1r9raSTBq1/7OVti+7ODJTI3ULYyQFViMa79Klq4Y25jrfQ9AmHKOrg9ndHTDr3
 yvMvCU4n68Uj8MAy+O851+vqym3upHDQwox5wPWdmGo9AV0YMiifYPAwVfa5PBEMY2QZkOAo
 n8fms6VqusJCPmweDelRewMGPSj4aaDOTiF21p3RcB/pnKq5mKpep1W7HdmPkB1P80YeDjvJ
 kjOpQdW45wVN3yvBUNqX7+M5w0R5fCIPbzYujr8N7KivrAZmNe7wRxT
IronPort-HdrOrdr: A9a23:xsmkB6n+oAu5fwYl4kktZ/y5SWbpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-IronPort-AV: E=Sophos;i="5.97,240,1669093200"; 
   d="scan'208";a="93936651"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHQ4BuL/CTm9DdfWN5XHInUfLsdatFeEs2Xp0mLpox6BVUIi370wTnis3eK4KR/AfkQgRm1zjxBM5XIQcY0BfyoEX5Q/Y/kxL6zvQ1oAKsI59wcZFzUGEYRrZHqzG0PA44z1t4O/7bUbu36bxEdeY+HqEtVWiZOsP434ojiOKM4XcFun/6idm9YeY2P11ycsGnA3TH1VEUGDIy/1ngZRHjx1AUUc1/VfVsx7JGisITS9r1hQEVrsKn0XUyq9F4sH7EqDXVKqYJUqEiPi43R+dS/6kJuWd0PAvRpINUP26zX/6tMar4P96N/7yuV77yIaxP6llvSCBgTA6ysCkJEfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MS2c150mQ60+qHYVrs8WlxwdtITVkNalm9pR6FWHaBQ=;
 b=hL4+yYPdWsOS1Rd8K7i8sUiBjwe94m5pvoetmE98JY8cx78jbB7uDjkZKaBi4Gye8AlMbifOBYES6vPl1yFyBO2n2Sc1htwrGhbF1qgy9Yge+yaI+NCgZEek1OYAqiCZ+pooGFHzpHnLUeLiDzqYix/19RFJk+XLUsVnfP64cIDHP1o9yz/KiakNqkOI5OrACTv2i6ZbCLt8psczpExP1A+e89zd+4oo2gU/FvkeV5XYy0Ws9VrGqh/n7KY2sBsSultDsdJ23wE5P606aAE6qiF9pCZ+yPlJ0yBUn9aJYpMUtcPOzS0tHQbyATDB93Jw6D/2uo6bpEPH0vyA24ZmHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MS2c150mQ60+qHYVrs8WlxwdtITVkNalm9pR6FWHaBQ=;
 b=PnezOMziIqeInhldw7pPh9oy+/szRqODlIKBGVnKB1qe4rbytjT56iUC3OMvBDgo1D+zvXm9nCW9BmPgQpo0J6ZlCsuq1uUPXtfKcTVnTGB12cBSOsaZ8ci4aRDLXa5L4xQbtqbsi51vMxL2F7IIcAJcGNPdRWH4O5MXkyPwKVk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>, Oleksii
	<oleksii.kurochko@gmail.com>
CC: Alistair Francis <alistair.francis@wdc.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>
Subject: Re: [RISC-V] Switch to H-mode
Thread-Topic: [RISC-V] Switch to H-mode
Thread-Index: AQHZL3+1jFKdxw/fjUKAFDmhXbPnOg==
Date: Mon, 23 Jan 2023 23:09:13 +0000
Message-ID: <d5be3bcd-8835-5a2f-12b0-2b2aaa98b9b4@citrix.com>
References: <18aa47afaebce70b00c3b5866a4809605240e619.camel@gmail.com>
 <Y8lABYJoQ5Qt4DAt@bullseye>
In-Reply-To: <Y8lABYJoQ5Qt4DAt@bullseye>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH2PR03MB5288:EE_
x-ms-office365-filtering-correlation-id: 4c800549-5e21-4881-3cea-08dafd96d7a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 03oGcIpdQBteGgvkMzMJHGV4Xw85yhfH1BHPXPwIxzOhrT+UucwlNS5HleXT9gHPZ2uzyQfCaJOs/yMg/ALWzG1DqO9NtZtL9LDwHnb3yXm6t1nfVTBWPqrUZtIr67/7t2H27DOvJvp1nQRbvgdr2r+wzcRnAeNW5rdnOLMKWE+HHyeaiVbmyjL31ZpM3Fb5QaduTkw6QmKZQi2mllDdm3OeZSbZjn6QOiknF1FnO3RPq5Ho7hg3OLDBe7GRjmpTzjiVOIRv2TCD5/UQBudChMwKgGBbjg1CpiJxfFKunCZkgziKOy+pmDlURashrlaHK3+FKzK9IBmLDYEy+RzY3vJeE+K3Ut+6NyTRgKpXbz0umztPWpQ7P4mRKfXzOqaXtIqxbYrYOD7gsmlLQTlZg365105nTn77HScAFZH6q9ZNbFz74+ySrL5TtSdxKPDh0KrS7PqEUIYErvQ8tYcZzvfEtu0ZyuFuHUGHdAxpZ+IaeVYgeeZN/6rioUqB3DEnuQWv1a5xc/p1a70QSoZ9p6SBvGYWYHZ6rizuYMCozL17Tc4blAkqy6xHoP3/24LPxoDEpZWurJ05EdB33lZOMTpNxZEqninHrcQ0NWqYqIH3KbEAJsp5xkkD5P4dMUTxqSVTzz46gvmnD3NU4TFIqWHbaYSDxE736qu1AdWjIk2BxZlKTL9EtXp0WZkpaGVdO6acO2KfWman7x5gDrJ8b0y0y7n+W1P5xEn3cs/bf4mPMJZ2eOdT5G58A4wNlDQE8yJi5pO1g7aCwCqgwa82THi0QV1bS4RolSsTO+0KpY7lxBF2BPxHEfE4dpkoAS/UbSULoOLtUGsFkq7k6f1rvA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199015)(36756003)(38070700005)(2906002)(5660300002)(38100700002)(82960400001)(8936002)(4326008)(41300700001)(122000001)(86362001)(31696002)(66446008)(71200400001)(966005)(6486002)(91956017)(478600001)(31686004)(66476007)(110136005)(53546011)(186003)(6506007)(26005)(8676002)(6512007)(316002)(66946007)(54906003)(76116006)(64756008)(2616005)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3ZXcVpDM2RKVktpYVJRNDUrdVBucEx6em5Db1hXeFo4L1h2RjJsd2xKM3k2?=
 =?utf-8?B?dkQ3MFRyY0x5NjJLWkdza3pxMVh3bmFlL0U3NTJQY0dwaTREZzd2ZTVoRjJ2?=
 =?utf-8?B?SURHMjA4RU1ZdDNBWk9qWmIrMzVaTXViSzVQcFNJZTVhaXBOUW9pT1JVRlZm?=
 =?utf-8?B?SmZBeGh2RWxyeGNuVWpGZVMyVnZmZW51VXRpSVFDZGFKWnpBeFEyM1dkM1dz?=
 =?utf-8?B?UHh4ZCtOVnVvdllQUHhmWjFFaHhJQUhWeHVvK0NsSCtBNnBDOUlaQ0hwYTlE?=
 =?utf-8?B?WmVUWnpBbUU3dVVrQXdOTTF1cGxEMk51bGtQSWtKYVlPeHhWY3VoZWNFWWhX?=
 =?utf-8?B?amxHMDJyWERHRm9US1VrMGc5Z0NwZWVyQ3dJOEJ2WDUrcmN5Zk50TEF4b29l?=
 =?utf-8?B?cDY1cWsyNTJhSUV2a2xhSjVTVHJUNkppRXhSek9tSkFBa0ZienpWaDN3T2RF?=
 =?utf-8?B?MVdyTVBTNy92emprcUJOcmxYelFXU1c0RnljYk4yaXFZakJ2eEo4cWxLTEVF?=
 =?utf-8?B?RWp4ckZjdjdVcHpmSlA3NC9uOU5PK2dwQ2V6ckFYL0VWN25iWjE2dHRGUGxR?=
 =?utf-8?B?NnBPaXZVenZWNWthV2psNkE2Tk1WNFg5L0xzZ3o0TnFIUy9jbWM4T2dicmps?=
 =?utf-8?B?cjROVHFLZDVnUjVkMFYrTElQNFpWSmJZQWprWGRYclY2ZlFUSittc3hVaGlr?=
 =?utf-8?B?Rnp5MW5pcXJ3NHhENmRYd2lWZGNncVVjd083ZXVEaThUdGhrYndqUlJwdE5W?=
 =?utf-8?B?RDZ3a00zemZGZXlCeDdLMFE0cFpLN2l3T1BsdGlCRWxHNzJReUdSYzdUZEoy?=
 =?utf-8?B?TENWRFJ1bGlpQjArWmowOGUxa1FEdWFybTFjRFVBYTdDSWpHTFRReG5WbXpH?=
 =?utf-8?B?L3JHZkRwRzBYSmNKWjlPdUpxaXhIRUNCSG12Mk1MdnJaYXE1TExnREdqamly?=
 =?utf-8?B?SjA3K2ZmRldtOTI5K3BhWW51TzFpalpPVWNCUytWM2czZGlYZ0drekg4eVlR?=
 =?utf-8?B?YTgyZzdIZm5Pa2h3WDhPeWpLSmhFcWtDUytLSHZhNTFsbHVkUk9iZjBNMThz?=
 =?utf-8?B?RzF1ZkhyZ1VFNVJtaTFLYjlkMlV5UGJEc20xeUNndGkwMXNKYjE0NStVaEQy?=
 =?utf-8?B?N3ROakdTKzZuMlhNb2c0K01MekZQSmlJcFFmRUxPZ1p2UitubFZzaW9GUUNo?=
 =?utf-8?B?RXBsd3hkcGRlMEZxb3NPOXdYVEQ0dXJOczJJcWN1ZnNHUW9tS1gyNy9tRFJF?=
 =?utf-8?B?TldMUE5raGxuZmJLU2V0YVU4NVBrUkUvS1ZQdEJPbmZQOFZzR1hVbXFCTm5Q?=
 =?utf-8?B?NHFSc0lOVWdZZzN2WS8vdmgzdVN4eWxGVDl3UTVBUUpBYkJ6ZExMTktGRDZG?=
 =?utf-8?B?bHpzbjYybFVDc2tKVnZtYzRneTM4ZldrOEpoN3ZzQUxsblk2bjNJR2JoRThT?=
 =?utf-8?B?b3M5SmpNdjREaXBGM2h6blI0Q1ZMelBqNDNJZVhNR3FKalpzL05pcEFzNWlT?=
 =?utf-8?B?bHpXekFUdWN6WkFoeWVRKzhaZUU1dzBNby9IYThETTlFeXE3Q2V0NkRuVkpF?=
 =?utf-8?B?ZGxieTFMSlZGZWxPQVU2ak95YmlZYlVPOHNGam5Cb2JMNnR5U25UcEMrY3Fh?=
 =?utf-8?B?L1dTakFKdDUrd1NUb3QwdlA1THlrck1WSDRuR0Z6MlhwZ0NFSDF3WGFINnpU?=
 =?utf-8?B?ano3SkJ0ZUwyYXdvdWtXNldQbXJpaHluSHFoK2krbi9GS0dJSlluUVFVQ1Zn?=
 =?utf-8?B?RjVsMk1JNzVuZ3g3N3V3ZkNxSmJITnlvM2tGNnFKMHQ3eWNTM2dxWWNmMWJn?=
 =?utf-8?B?bzlKM1NncklyMFdtd0JKNFlRQ3V4M3RWRXVNWU5QYWtqdmFRVWMyWmVoa29R?=
 =?utf-8?B?T3BJTHhXT0ttWk8xNFliTlU2QVdtajlsbmxNZFFYTW9QVWk3QmpnUCtWbjZC?=
 =?utf-8?B?U3VMZEFZeGtQZXMvVFFWMFpBZ3VZbmJaMXMvN2N3NFpnVDRFUXVUa2I4dnFx?=
 =?utf-8?B?bm5RSFAzeVExT1Jsb1F6OS9wRk1TUVg2SE03b2Mvcm9PaVRZOThvaEdGSWJC?=
 =?utf-8?B?ZXRzdVZqTjhlbnQvYXhqUkN5QkVzNVphYW0xUHhveFlzZUZTMlZBcVVQVUpD?=
 =?utf-8?Q?v6fmqRHvvZQu6wPMsmXpJlseu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DB5F6E353DA9C48A7411F014E077F19@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yPCuYYzs9m7Y6YpB4dkYaBrje2Ddz9J72TUZr2ouooPbH9YEbDDTbj0FP2Rk3YfQ//xGpdNgkoUcRm/MjeAUmOcm4bkxGrdHbz1LcgUAEuCBXCvF1AA4u/IGzDubtu9EIj5czTXJzeyug4UXMPHyGpSgJkcLyhuHWX4/GoiXVWOM7KMw9RtygPJ2kZsW7zr7Cq/0b6yi71fBUkoEpTf5hKz8zg03Q3hcz1X36GDJGdBMQDFw4RrtTtrpnCt6kwFM14bMqQJ8GJJmhvkmuYdzqVTYtZUMiNJk//H7qGZRTW/kfM8hSTyuFaGT9qUhe/soWzTpk5JHj4Zs4pyd2h9H2AHa3B3LC8a5rVSCxEtK5sgBsheGlNwkYSJBT5cE0wQhiiUWNiufr6jtj0kQMUf/B2QqXLkPykDrupv7iOivgJRgvjlyVs4kMbAxvNpOCX+81zrK2O0Q8i02F7fVxNBo3bhrE81DN5KjRCguzkbc5BqYPDhz3ecwIypOzE4pwnYSs7mljgRh0tVO2+tjk39Zed/8Ly5hgoClui2BdE7uUCZ0Pwn7iIs1Xj2MO7UJ55h4crsUl/pjMUCOSgKKyknqXWCSiMz0HyEDR4cpFY3ZE6WMMJxR52EqoN53L04rpf76xpVSSlvVSorQ/wUW1sIJqDc4qF6XL5O/b+jiwCQJnwFmdr1QQOYae9WlPWKZdRNeaV1zzL2KE5iZmxjrBXr9esJpUguAoqa5IOlDxIV0QPzZ+pDo6sf7+bOcrebxsU4VyvDgVx/aBB1q9dFl/0//fmdXqFWNFKjGwSc3t5SNnbITrEZ8OCuNPnMYulieR7bF8lJWgMuk4s8vRZllhBvzuqomVnVAr0CJD7DA6epyzV5V4Fwzgf0928QiL/gtlDYaCO8oWwZRp8rtQmSSzzNGtw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c800549-5e21-4881-3cea-08dafd96d7a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 23:09:13.0886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oyEdTFVrfTc0etpiPQJ6uZJvieJeZEulCjGod1qZVXIj+/6HhQunF/8UW3PPpEPYiQud6n6S0Qy9VEVD3KbSO3T689H8XHcfb94V+zHRiiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5288

T24gMTkvMDEvMjAyMyAxOjA1IHBtLCBCb2JieSBFc2hsZW1hbiB3cm90ZToNCj4gT24gTW9uLCBK
YW4gMjMsIDIwMjMgYXQgMDY6NTY6MTlQTSArMDIwMCwgT2xla3NpaSB3cm90ZToNCj4+IEhpIEFs
aXN0YWlyIGFuZCBjb21tdW5pdHksDQo+Pg0KPj4gSSBhbSB3b3JraW5nIG9uIFJJU0MtViBzdXBw
b3J0IHVwc3RyZWFtIGZvciBYZW4gYmFzZWQgb24geW91ciBhbmQgQm9iYnkNCj4+IHBhdGNoZXMu
DQo+Pg0KPj4gQWRkaW5nIHRoZSBSSVNDLVYgc3VwcG9ydCBJIHJlYWxpemVkIHRoYXQgWGVuIGlz
IHJhbiBpbiBTLW1vZGUuIE91dHB1dA0KPj4gb2YgT3BlblNCSToNCj4+ICAgICAuLi4NCj4+ICAg
ICBEb21haW4wIE5leHQgTW9kZSAgICAgICAgIDogUy1tb2RlDQo+PiAgICAgLi4uDQo+PiBTbyB0
aGUgZmlyc3QgbXkgcXVlc3Rpb24gaXMgc2hvdWxkbid0IGl0IGJlIGluIEgtbW9kZT8NCj4+DQo+
PiBJZiBJIGFtIHJpZ2h0IHRoYW4gaXQgbG9va3MgbGlrZSB3ZSBoYXZlIHRvIGRvIGEgcGF0Y2gg
dG8gT3BlblNCSSB0bw0KPj4gYWRkIHN1cHBvcnQgb2YgSC1tb2RlIGFzIGl0IGlzIG5vdCBzdXBw
b3J0ZWQgbm93Og0KPj4gWzFdDQo+PiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytc29mdHdhcmUt
c3JjL29wZW5zYmkvYmxvYi9tYXN0ZXIvbGliL3NiaS9zYmlfZG9tYWluLmMjTDM4MA0KPj4gWzJd
DQo+PiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytc29mdHdhcmUtc3JjL29wZW5zYmkvYmxvYi9t
YXN0ZXIvaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaCNMMTEwDQo+PiBQbGVhc2UgY29ycmVj
dCBtZSBpZiBJIGFtIHdyb25nLg0KPj4NCj4+IFRoZSBvdGhlciBvcHRpb24gSSBzZWUgaXMgdG8g
c3dpdGNoIHRvIEgtbW9kZSBpbiBVLWJvb3QgYXMgSSB1bmRlcnN0YW5kDQo+PiB0aGUgY2xhc3Np
Y2FsIGJvb3QgZmxvdyBpczoNCj4+ICAgICBPcGVuU0JJIC0+IFUtYm9vdCAtPiBYZW4gLT4gRG9t
YWluezAsLi4ufQ0KPj4gSWYgaXQgaXMgYXQgYWxsIHBvc3NpYmxlIHNpbmNlIFUtYm9vdCB3aWxs
IGJlIGluIFMgbW9kZSBhZnRlciBPcGVuU0JJLg0KPj4NCj4+IFRoYW5rcyBpbiBhZHZhbmNlLg0K
Pj4NCj4+IH4gT2xla3NpaQ0KPj4NCj4gQWgsIHdoYXQgeW91IGFyZSBzZWVpbmcgdGhlcmUgaXMg
dGhhdCB0aGUgb3BlblNCSSdzIE5leHQgTW9kZSBleGNsdWRlcw0KPiB0aGUgdmlydHVhbGl6YXRp
b24gbW9kZSAoaXQgdHJlYXRzIEhTIGFuZCBTIHN5bm9ueW1vdXNseSkgYW5kIGl0IGlzIG9ubHkN
Cj4gdXNlZCBmb3Igc2V0dGluZyB0aGUgbXN0YXR1cyBNUFAuIFRoZSBjb2RlIGFsc28gaGFzIG5l
eHRfdmlydCBmb3INCj4gc2V0dGluZyB0aGUgTVBWIGJ1dCBJIGRvbid0IHRoaW5rIHRoYXQgaXMg
ZXhwb3NlZCB2aWEgdGhlIGRldmljZSB0cmVlDQo+IHlldC4gRm9yIFhlbiwgeW91J2Qgd2FudCBu
ZXh0X21vZGUgPSBQUklWX1MgYW5kIG5leHRfdmlydCA9IDAgKEhTIG1vZGUsDQo+IG5vdCBWUyBt
b2RlKS4gVGhlIHJlbGV2YW50IHNldHVwIHByaW9yIHRvIG1yZXQgaXMgaGVyZSBmb3IgaW50ZXJl
c3RlZA0KPiByZWFkZXJzOg0KPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytc29mdHdhcmUtc3Jj
L29wZW5zYmkvYmxvYi8wMDExMDZkMTliMjFjZDY0NDNhZTdmN2Y2ZDRkMDQ4ZDgwZTllY2FjL2xp
Yi9zYmkvc2JpX2hhcnQuYyNMNzU5DQo+DQo+IEFzIGxvbmcgYXMgdGhlIG5leHRfbW9kZSBhbmQg
bmV4dF92aXJ0IGFyZSBzZXQgY29ycmVjdGx5LCB0aGVuIFhlbg0KPiBzaG91bGQgYmUgbGF1bmNo
aW5nIGluIEhTIG1vZGUuIEkgZG8gYmVsaWV2ZSB0aGlzIHNob3VsZCBiZSBkZWZhdWx0IGZvcg0K
PiB0aGUgc3RvY2sgYnVpbGQgdG9vIGZvciBEb21haW4wLCB1bmxlc3Mgc29tZXRoaW5nIGhhcyBj
aGFuZ2VkLg0KDQpPaywgc28gZXZlcnl0aGluZyBvdWdodCB0byBiZSBkb2luZyB0aGUgcmlnaHQg
dGhpbmcsIGV2ZW4gaWYgaXQgZG9lc24ndA0Kc2hvdyB1cCBjbGVhcmx5IGluIHRoZSBsb2dnaW5n
Lg0KDQpBdCBzb21lIHBvaW50LCBYZW4gaXMgZ29pbmcgdG8gbmVlZCBhIGBpZiAoICFocy1tb2Rl
ICkgcGFuaWMoKTtgLA0KYmVjYXVzZSB3ZSBjYW4ndCBvcGVyYXRlIGRvbTAgcHJvcGVybHkgaWYg
WGVuIGlzIGluIHBsYW4gUy1tb2RlLg0KDQpJIHN1Z2dlc3RlZCB0aGF0IHdlIHRyeSBhbmQgbWFr
ZSBjc3JfcmVhZF9zYWZlKCkgd29yaywgdGhlbiB0cnkgYW5kIHJlYWQNCmBoc3RhdHVzYCB0byBw
cm9iZSBpZiB0aGUgSCBleHRlbnNpb24gaXMgYWN0aXZlLg0KDQpEb2VzIHRoaXMgc291bmQgcmVh
c29uYWJsZSwgb3IgaXMgdGhlcmUgYSBiZXR0ZXIgb3B0aW9uPw0KDQp+QW5kcmV3DQo=

