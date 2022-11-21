Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A656326A8
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 15:47:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446677.702392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox850-00006e-Vd; Mon, 21 Nov 2022 14:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446677.702392; Mon, 21 Nov 2022 14:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox850-0008VZ-Si; Mon, 21 Nov 2022 14:47:26 +0000
Received: by outflank-mailman (input) for mailman id 446677;
 Mon, 21 Nov 2022 14:47:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5PF=3V=citrix.com=prvs=31798088b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ox84z-0008VT-Eh
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 14:47:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67f4ee67-69ab-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 15:47:24 +0100 (CET)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Nov 2022 09:47:15 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by SJ0PR03MB5886.namprd03.prod.outlook.com (2603:10b6:a03:2dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 14:47:13 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::5c96:fc3a:9d36:4a2e%4]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 14:47:13 +0000
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
X-Inumbo-ID: 67f4ee67-69ab-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669042043;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yXx8/D21ie/hTcCChUKVy4Q00hWiNLKaJ6gn9AWZOEA=;
  b=D2wp8EHX7RHrCT6IWJQ7yrh1JJOJXoSY3g1bIrjK42uG2FvG6tA/HoMO
   zQvjYoIknjBh/RYHKUE+bypzB56E6GP1J9XjqBH6Ql/62Xp7rU87yWaOL
   dGlcqu9Ci4+TIUsAL7DtIcAXbogzlU46ESN70ZVkCGaNOliJ83d55xr3W
   s=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 84835141
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zeqvFa7mVOHEB5hm5v5T/gxRtAjGchMFZxGqfqrLsTDasY5as4F+v
 jYXWG7XOv2MZzDyL9wlOYzgoR4Fv57RxtZkTVM9qi9hHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkR5QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 PhHcg4VUxu5qvux4riFFNN+ict6M5y+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUooj+eF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJOROblr6Iz6LGV7jQJOAI4WByBmuOwlmPgd/tOA
 EI69SV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq17r6JqRuiNC5TKnUNDQcbSSMV7t+lp5s85i8jVf5mGa+xy9HwRzf5x
 mnQqDBk3upMy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:cRIY2KotBsdqLP65isxa5MIaV5sDLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXbsibNhcItKLzOWwldAS7sSobcKogeQUREWk9Qw6U
 4OSdkYNDSdNzlHZIPBkXGF+rUbsZa6GcKT9IHjJh5WJGkEBZ2IrT0JczpzeXcGJjWucKBJcK
 Z0kfA3wgZIF052Uu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyR+49bLgFBCc/xEGFxdC260r/2
 TpmxHwovzLiYD79jbsk0voq7hGktrozdVOQOSKl8guMz3pziq4eYh7XLWGnTYt5MWi8kwjnt
 Xgqwope+5z93TSVGeopgaF4Xiv7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twriGknqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYdU99WPBmcUa+d
 tVfYbhDcVtABWnhrfizzBSKemXLzAO99G9MxA/U4KuomNrdTtCvjYlLYQk7ws9HdQGOtl5Dq
 3/Q9pVfPsldL5oUYttQOgGWse5EWrLXFbFN3+TO03uEOUdN2vKsIOf2sR92AiGQu1+8HIJou
 W2bHpI8WopP07+A8yH25NGthjLXWWmRDzojsVT/YJwtLHwTKfidXTrciFkr+Kw5/EERsHLUf
 e6P5xbR/flMGv1AI5MmwnzQYNbJ3USWNAc/tw7R1WNqMTWLZCCjJ2STN/DYL72VTo0UGL2BX
 UOGDD1OcVb90iuHmT1hRDAMkmdDnAXPagAZZQy09Jju7TlbLc8wzT9oW7Jlv2jOHlFrrE8el
 d4Lffujr67zFPGj1r10w==
X-IronPort-AV: E=Sophos;i="5.96,181,1665460800"; 
   d="scan'208";a="84835141"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niw8r5LMfZhTidkGRY5v9nDilQl5qXbMmMssmi4DHVHqk3mEDsm3NiRKHYAzxZ/iVGlymiMNIuooAVQtw6w+HG6xUBePi+VFG0zhcyl/dX3IC/cPP0LFQR0cyZ1nBbU0eE9aXz1Z1cxrQ8/FBk5yR59lJ00H2+ZW1nVFnshKqnS+GTsmPO/HvQBrjxBl3uIApyd7HWqRmpCYgPDub8+g3xJyMCWcWPBsnxJwTXWfGZJ9qiXrXr4LHMv/MFhTbc656k9ajMN66jyCR++grJ1BQx+HAiFjuUqjafU0WHFhF1cHcYAJkhz5BBwZq6/2wCk73HGtVc+YhTlToLF05s8wxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXx8/D21ie/hTcCChUKVy4Q00hWiNLKaJ6gn9AWZOEA=;
 b=aBYKa2+t5+/w8nA2KdvdTIYXAx2vrq2S3oGlenp3uLFFvjxBeAqwyP/HNfY6ve2Z08VqAqjy9AZrCAo3gag1QupHDHCFdxGHMumBmShbnKD5K14iIHZnbO88ylxHDQs+YmSpqZuVgA1kaRKK+h136FlIWbeQ+w0F7y1DgsNJ5B80OXJOFGDRhY385AErwRiP1kA2QMKFztyLkwfJHG8VcXHCXAWbmvFG71nRXL/6IuX9gOeffGiXCmUydRf0k+BerQlKUooxHw58iYSAITTY1OGE/a0Z8MRfVyVcTh2vpugQPOY8lUir4uNlWjfnP5lbXPqftcGsOIk3jOF1O5xwvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXx8/D21ie/hTcCChUKVy4Q00hWiNLKaJ6gn9AWZOEA=;
 b=bQlZ7BEZCOhL6BsrV9WivYlIcFK2b28YEmCRscXFCVnelKEIQZduGI0/GH2ybAsCjlVQYkawzkVPAWYDb3NuOZWLV1sb+fMbr7jBDxq6pMADMd/lpzuA1Xsr9ZwZ/VLq+3RkKuRXBkZAa4W4vBh0l6TBUhJSmIkH6Ad8SQe/FaU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH] x86/Viridian: don't mark IRQ vectors as pending when
 vLAPIC is disabled
Thread-Topic: [PATCH] x86/Viridian: don't mark IRQ vectors as pending when
 vLAPIC is disabled
Thread-Index: AQHY/aLC8acXtzuGekaGc6l+6XhP265JdQKA
Date: Mon, 21 Nov 2022 14:47:13 +0000
Message-ID: <5ac3bb24-1b2e-4ccf-5282-51e8b03921fd@citrix.com>
References: <a098e0ac-72f7-20d3-df5d-05e50e75ea51@suse.com>
In-Reply-To: <a098e0ac-72f7-20d3-df5d-05e50e75ea51@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|SJ0PR03MB5886:EE_
x-ms-office365-filtering-correlation-id: ff0daafc-02a7-4ae0-5998-08dacbcf4706
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oAvZmnGgfzcO0vXp7G+J7OvuAC3Y9uAVI1yc9w3aUh5BjoczFFQCl4fhOkzUgSd54GEJR+hwLnX/y3MShVYEMjLgWriXij1F1+Mbr65eiGoUiyqY34Vg0GjaqODnFAs5nQpI91q09sHHXi/DNeYKWCaUVhsKXOTkpMG+3J/G6lQf/dnDVPx/DosjsssmYbN9apjK86QRXXL/iPXlBWmJ34ZGqzhpnwgmTRxtu7e2dPWuU6SmXUYdG5KQFPwPa5rlKldE0oXV528f8zPiRYpgfus7gWIBN1EczKRa47gP/qGS50xPL0o/huLhbi8C+AvO6Jm9xDhydf4/hdFU5mEMgAxsygmkOVQ1FTPKiDxpgM1p/cgewU0A7WmrgCKGkIcrWVIHtRCEI546JM77OUzDrjjO7kEhRE++LaQHziNttN8T2Gjprl8W4BPwaez5ilMS0vuyCkjmmVJIiWY57hiJWXisDiDexgMXY7p0nhtgYFs/LPsf5Z7GHCWX90WmPeL9GWOdubTiZha2+JPlIaGqFU7aqFSeMkw2+2a9ysFepRez6Qb7+jGwEriJ10m4KOHq28gRxEMRfmycL/IVBNfu0lDIVpPWX4iGGtj8CiKannmSCofREdVJEBs51jzzTg4PQD8X5WzLX6F3CBd0lMau+O6lS7JcTNfIpV26wpJREqQhtxZ8kPRvHkR5MOM6FKQWPxmjZaUG/oKHmasqc1swLU23cDyaSWMpaZZj70+qpkkcMIL3bBMoNFnf6n/hGl5a07To0ZGeHvo684dqLapeQQi22tSSJbnJby7js59K1lJEgKbVR/Bi2nSW7A5N69yh
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199015)(82960400001)(122000001)(38100700002)(26005)(38070700005)(31696002)(86362001)(6506007)(478600001)(6486002)(71200400001)(53546011)(5660300002)(8936002)(107886003)(4326008)(66556008)(8676002)(76116006)(91956017)(64756008)(66946007)(66476007)(41300700001)(316002)(66446008)(186003)(110136005)(4744005)(2616005)(2906002)(54906003)(6512007)(83380400001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?blhoNGtSL1N5R3RHMEZHWjZMVlArNGlHejFib05Ec0lnTlpYNHBOQmFqS0pT?=
 =?utf-8?B?SUtkRWZSSTQ1K2V0ZHhaMWd4c083OW5JeXVXNTdOUGdzZzNrdFFqbnlmUTBT?=
 =?utf-8?B?SndhS09Da0hVdDZGM1lOb2xLM0cyeUg3eSt2L2hxalpzdlduckhOa3BXZkJZ?=
 =?utf-8?B?OFJuMU96YnJEQmE0QUJSRHM5ei9heTJRRnRjQUNValkrWG9TS1JxeU1QQytl?=
 =?utf-8?B?ZWN5L0xrWVhtMGtOMEYza05JQk82a3NZNzlhL1R0TnZZV1NFa3BCcVZSYi9U?=
 =?utf-8?B?Snl1cEFscEkzUHV4YnpMMW1CMnBuQXpwMmd2a1paNThQd2haWFVZa3RUMzEz?=
 =?utf-8?B?MlY4QUhudS83UTllbkY5RHVhNU4wRTE2MDM3MklCMFVQOW8ya1BiOVRPM1Zm?=
 =?utf-8?B?dTBuT2doMXlPTHpULzBlVXFzM2FlQVloU1FhU0lLRWFYZFkyclczMnZGWVJK?=
 =?utf-8?B?NmRiMFFGUFNmRmM2Zm1BVER4K1NjWU42TmxRQ2RmUERGbHR0ejF2Nms1SGs4?=
 =?utf-8?B?RDg5UVVVZFhCQzE1M1k5M3M2Ky9LT04zTUJVd3M5blNHSXh1bHRQa0tGKzd1?=
 =?utf-8?B?UG56ZW45UUUwVDdiN21YYUtCY1dZNDgrQWJwcmREajN4SmpYd3RCRG5xY1h2?=
 =?utf-8?B?NFNVWU5MZjA1U1phWXBQb2lYYnVuYmVFTHk1c0F1RThzZ2JTd05ROEVHeWs0?=
 =?utf-8?B?NFRTeFgrVHl2N1I1SUYxbkdtOElUZ2g0WlNPRjFsc0pZZXdLZ3psSTcvTXNF?=
 =?utf-8?B?NWhTL2VFOGo4R0dZaklBRXNPeHh4S0ZpRHBqMHFlemFMSHVKQjBKZnQvMHcz?=
 =?utf-8?B?UWMzREdmWThNMVFBUS94RXZZOTQvNzVJTk9OVDBFRWpmSVEybG92WnkzZWJI?=
 =?utf-8?B?aXlXU1NKbWFEY0hKdVgrTFFIVWFOYVBPblM5b01kUG56L3VMUEtDN2xCVHJj?=
 =?utf-8?B?NmVlOHZqUkFmZjc2UWdDSUxFK0M0bndIdUJ5WCtLNjdEUXA0bFNiWDNHbkV5?=
 =?utf-8?B?eUFNU2lzQWc4cm9CZUZ2Y29OOXdRUnpwclJZdmFtQXFNd3gwOTE2b0ljaEhh?=
 =?utf-8?B?VkJNamg2RTRyckxvS1p3amQvT0o5L3A4SEMvaDJOcnNwd1FkeTBmR1NLZm03?=
 =?utf-8?B?WEpMUzFKd1RXTU80cFNKcFhjZmowaVdSK210NUxLV21iVVNHSnN3MkV6Yk5M?=
 =?utf-8?B?WEVmQWlMTVBrbDRxYVJkTDlZQTlDNGF3ZnNYWGhJUDVuRVhyOXdsdHMrWlUx?=
 =?utf-8?B?SENRVzdmNFhid0h3SHM1b0htOTBJdWd4elFneEZRT3NpZjRneEVuVnFjc2xF?=
 =?utf-8?B?WEk3OHRRMnVQTFZQNVF0RnR4SThUY2psd1RZbi9pcXgyYWVEMlI0VHlEUUtu?=
 =?utf-8?B?MmdGYlJFTDFsTG1wVWxpTXc1eWpoZE55WDRoeVg3NzRZYmV6YzdVMlcwRjRY?=
 =?utf-8?B?TzdOY1B4NnBldncxRFYxSm9BZ3F5OXQyRVNhVmx6Rlh6b05mRHYzZ2lTRWVX?=
 =?utf-8?B?MHNuUEtXbVp3MzFPR0IrUGpqK0RxVk5yV1lnU05FNzhkRVE2LzBoMUZyWmd3?=
 =?utf-8?B?V1hhazFESmdqL3dlRWdYSEx2ckZEZGdzczVGSjVmL1owZklwSmJLdlFibk9w?=
 =?utf-8?B?NHltQk5RbEM4ZzU0N2JQViszYlVBV1hxS0l1OUFseEVWOTlCekZ2VkNaOGJJ?=
 =?utf-8?B?QnJIOXRSZ1ZoSmxaYVlTZ1c0UmpJQnEzekxNempxTUhPQTdUVllwaTFJZVNK?=
 =?utf-8?B?TmVzQmhTdXJJby9hWFFRdzY0cVg5SStIT3ViSDFITHdFbEhLODRKbzlpaFds?=
 =?utf-8?B?L3g1c0tKbUtLUXhGZXNLMlFSWCtqbVU1cGI2L1FQS043dkcrUGozb0tzN0px?=
 =?utf-8?B?V3MzbThXS2N3dEdFbkpSb1BVWGtZN2VtdTgvVkhFa3ZBQlphZUhSMFV0NWlx?=
 =?utf-8?B?VjBIeWVrdDhheHFrZFRPWUhKaDVYQlJ6Z1BDdjJvaXdOK3F4d1NvRHJQOUtx?=
 =?utf-8?B?QkJGaGJnQ2Y5cC9DU2xqNTE4Yy83L1RmcGZKckpMMTFqYXh3TXR3cTgyTkxV?=
 =?utf-8?B?TytKemZBTSttajFtSEVsOWVyZzZGcXN5bUwyVTdIWEdRMHdsMjMzSFRzcnM1?=
 =?utf-8?Q?ecv6PedxGIq2QaC3l8IOYWq3A?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6224057CBFA6A9418DFAF7B4FAA59AF7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NFKNQl8VI22t2LPxt1PMk6hZ6xpm4Ad4Za41zljbdlVBY+erLaKs70P1h50LdMKIDk8afyEnZSutt4Yv5cc5dNKUlHkIFe09w2c0UdWTHtAh/p7GZbqJ5cdikKmZNoRkhy8kjc+TYZi4L8CHZB/czpf0mfFpf9G2yCWvkXOKVmq6aVLOjyW+J3HP8us5pT0anMM4KdNAMHmJbyDSEVj1N/RhB0A46hrtLxFouzhx++4fxhxVh/2HgasmzNeDUetiD3MSJN4YCLHHVg+eEKTp24nxBv9Mn6syKKcVz7s7DbJpydDJJtc38x+ZQ9+YsgJjdjYH5t1xYu+5bS2wpqckpbYeDNLXn4GpLEcSs5POr/0Euq+PtDBbCZYYLOfl1PAhOlkplaC7qSzWInk4Y7qOApec3R9kKAAeGFTqe/FBJRW6D2MoRwZOf9D1h1XvubwvAQJA4QhJLM3baDhcTGI+HXjYjKa+JAEa/c/Zjti9cz27MnI/eSpgQmReRRlqc8Ch+Fhlow1n5BhbxQJ86L8eGGtP6TC2Jp6CMjzR6Zxz6JGdC+ZAHyvHIhSR0bjbz5Ik5p0fpMupdQnit1r66HIOfb8TutQRWXXbui0mAQso2xi5CE82PNb/okkKfhvYVVmGqsLzuRjncRhMB7ZQ+fNDx/ZkgrgeJ8EmPNKejJOyhAZnDg6c6WdXfgbZJ2UAq4HLVxNsi02b2h9BFpe3fUIcNW8E8CksAQwQ862rGBUd58AN8WBHM+THptfuFfbCIc9/r3PYgCCDoXZ2uPnQFTDJMqHur+ERRHaCLYDC+Aztar1zoLoO88F51wuneVNAHP2sNdlo9va8Wvbkm4JztmZIUrq2z8R5VmVcoC81dw/4bpg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0daafc-02a7-4ae0-5998-08dacbcf4706
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 14:47:13.6301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WkqLvLvKz5jWEfMrMYzxpyCCXJawmr39+gqSqXAWOGeALXP+y3wmEoz6R3vXePxyePtC2VKkI5r5yoDW6xcecXAl+8s30ZcHmqgVVhiX/Yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5886

T24gMjEvMTEvMjAyMiAxMjoxMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEluIHNvZnR3YXJlLWRp
c2FibGVkIHN0YXRlIGFuIExBUElDIGRvZXMgbm90IGFjY2VwdCBhbnkgaW50ZXJydXB0DQo+IHJl
cXVlc3RzIGFuZCBoZW5jZSBubyBJUlIgYml0IHdvdWxkIG5ld2x5IGJlY29tZSBzZXQgd2hpbGUg
aW4gdGhpcw0KPiBzdGF0ZS4gQXMgYSByZXN1bHQgaXQgaXMgYWxzbyB3cm9uZyBmb3IgdXMgdG8g
bWFyayBWaXJpZGlhbiBJUEkgb3IgdGltZXINCj4gdmVjdG9ycyBhcyBoYXZpbmcgYSBwZW5kaW5n
IHJlcXVlc3Qgd2hlbiB0aGUgdkxBUElDIGlzIGluIHRoaXMgc3RhdGUuDQo+IFN1Y2ggaW50ZXJy
dXB0cyBhcmUgc2ltcGx5IGxvc3QuDQo+DQo+IEludHJvZHVjZSBhIGxvY2FsIHZhcmlhYmxlIGlu
IHNlbmRfaXBpKCkgdG8gaGVscCByZWFkYWJpbGl0eS4NCj4NCj4gRml4ZXM6IGZkYTk2YjczODJl
YSAoInZpcmlkaWFuOiBhZGQgaW1wbGVtZW50YXRpb24gb2YgdGhlIEh2U2VuZFN5bnRoZXRpY0Ns
dXN0ZXJJcGkgaHlwZXJjYWxsIikNCj4gRml4ZXM6IDI2ZmJhM2M4NTU3MSAoInZpcmlkaWFuOiBh
ZGQgaW1wbGVtZW50YXRpb24gb2Ygc3ludGhldGljIHRpbWVycyIpDQo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KQWNrZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

