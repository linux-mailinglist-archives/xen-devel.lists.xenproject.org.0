Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D31550A701
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 19:24:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310374.527187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhaWg-00035R-8d; Thu, 21 Apr 2022 17:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310374.527187; Thu, 21 Apr 2022 17:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhaWg-00033X-56; Thu, 21 Apr 2022 17:23:30 +0000
Received: by outflank-mailman (input) for mailman id 310374;
 Thu, 21 Apr 2022 17:23:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5Hx=U7=citrix.com=prvs=10361b9f4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhaWe-00033B-5h
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 17:23:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bea3ca4b-c197-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 19:23:26 +0200 (CEST)
Received: from mail-bn1nam07lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 13:23:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BYAPR03MB4789.namprd03.prod.outlook.com (2603:10b6:a03:12d::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 17:23:16 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 17:23:16 +0000
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
X-Inumbo-ID: bea3ca4b-c197-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650561805;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Tl1ED7Ej7WCZr84wo1pq0ZwpBz7um8FadlQl+zoIHYo=;
  b=gvoFH98HZKpXTLNimxYbow/racxmsVmo/WZoyF7zV8WiWfif3mJdpmeg
   P7j0uxMcilLbaQdYR3qRszOzuoT2BchN0cZvLPhS7HNTl7PmBwJSyPCZz
   mHMfoRmPsdegQMhyIOMrHFQ2gIubz4jK2ptcY39N5/AXA9JLXKtLpJQGm
   k=;
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 72072777
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ImBUr66ZYjbJgTsivxn6igxRtDLGchMFZxGqfqrLsTDasY5as4F+v
 mMdUG+Fbv3cN2egKtF3bIqz9B4D65/VmNRkHQtrqylhHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTjWlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSvWxgZDqP3xt0QVgRXPAV0AOpl/7LudC3XXcy7lyUqclPK6tA2VgQcG9Rd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiTo4MHtNszrpkm8fL2T
 swVczdwKj/HZAVCIAw/A5Mihua4wHL4dlW0rXrK//JouTeMk2Sd1pDxKtX4R8GIHv4OtUyit
 2nMz030WCgVYYn3JT2ttyjEavX0tSHxVZ8WFba43uV3m1DVzWsWYDUcUlGxsL+0kU66VtdWL
 WQb/yMvqe4580nDZsb5dw21pjiDpBF0c8pdFag25R+AzoLQ4h2FHS4UQzhZctskucQqAzsw2
 Te0c8jBADVutPifTyub/7LM8jeqY3BJcikFeDMOShYD75/7uoYvgxnTT9FlVqmoktnyHjK2y
 DePxMQju4guYQcw//3T1Tj6b/iE/PAlkiZdCt3rY1+Y
IronPort-HdrOrdr: A9a23:1M69iaOvf0W1RcBcT5j255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKRyXcH2/hqAV7EZniohILIFvAu0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrjVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUySw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yfT9aw+cyDpAVr4RH4FqjwpF591HL2xa1u
 Ukli1QevibLUmhJ11d7yGdgzUImwxelkMKgWXo/UcL5/aJBQ7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KYuZlFkIP0jgYVq3MUiFYJuYeU9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonJrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUB/aPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTOYNSRP5uw+zvngehTMYd228LAu23FQgMyOeJP7dSueVVspj8ys5/0CH8yzYY
 fHBK5r
X-IronPort-AV: E=Sophos;i="5.90,279,1643691600"; 
   d="scan'208";a="72072777"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O87t7QhzHJ0BFLX6i+Q53OubkXjRIpZjz6nSgSHzkTOm823kpySEpyOxsy7mIEyq6+aqkZiabxhQ5ap4I7kTzTAaeTQfCX6R783DfNILUMXeiBuydEEAguzKZ6Qckqv1zlSCfwoZHsS5F6poeVaTZohadxJzi6DGG29tZnz0VShPOWWpvgUOCbJV5Mny0mFfU/Jrh0wqs8eHqB5vNksW7WgHB0/KEp8chcmzH7cGrxwyr+zBQvQQDD/WsLy+DX/J+6xlH12USZQSUvJhPH++bvZin1qaXxfOvRHCU6z6ugsWfeaFuWaII5jt1PE/m5MYvEtc3QPAFn0AuIYEBcbfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tl1ED7Ej7WCZr84wo1pq0ZwpBz7um8FadlQl+zoIHYo=;
 b=iCDkWV8JDOchhPPxNgCFXqqMeHdj03z7HsU5t5xoWD6Obeoe28WR2OQECZf216ae0B/optqbJpPG/uDAGxgoJ0LlfA79ZHD4fuDDOTm9L/tdlYZJlHnO5CzhzLqlLRCocj+y+E6ca5eaDRNKipuKYvZvGf3mahrWDkHyqytHWTbpPdvJEK1KGhLj7cNCDMyPHMH4g6NV71B+AtrnldPADt8eCtofAGGZ8DnOdIgi0YfTDuGQXbMbS6WbUZHg7DiWARHDVDO45RQ11jzhUUH1kd9mSOHQQl+/FQcve9yPOGZDi01DvU3OLBlu1qIbOGLLhlZXl0RX+451SVKJVg4dcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl1ED7Ej7WCZr84wo1pq0ZwpBz7um8FadlQl+zoIHYo=;
 b=mXrJD9y22GHMQ2r8PqlJIKERfbih2xMATwSuUcd6VYVPNDaZrqQxJehJpb61+4hboRtswn3nmA2bXEgIfqtrVR/sd5W0orHwHavSGeN8vdBQex7uvwWWeH1fCtnt5MI9ADJnYEPqlj1BOII920+U2dN04IUM3TKI/Z1YbjZMBfs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bobby Eshleman <bobby.eshleman@gmail.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 1/6] x86/debugger: Remove debugger_trap_entry()
Thread-Topic: [PATCH v5 1/6] x86/debugger: Remove debugger_trap_entry()
Thread-Index: AQHYVMDX0pnJlQhLrUiicQUgBCrtjqz6VpcAgABI4AA=
Date: Thu, 21 Apr 2022 17:23:16 +0000
Message-ID: <b32d8ab5-dcca-971c-39ed-032aba0dcea2@citrix.com>
References: <20220420141307.24153-1-andrew.cooper3@citrix.com>
 <20220420141307.24153-2-andrew.cooper3@citrix.com>
 <57858c7b-019a-2888-42ae-7ce9a7c88cc0@suse.com>
In-Reply-To: <57858c7b-019a-2888-42ae-7ce9a7c88cc0@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40ef017f-761a-4a9a-bf00-08da23bb9f78
x-ms-traffictypediagnostic: BYAPR03MB4789:EE_
x-microsoft-antispam-prvs:
 <BYAPR03MB478934A394153F305F2C11D9BAF49@BYAPR03MB4789.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /btrih27nrwTr2wnLfPUZMFpKh5bSXtim65ilqO5pswOxMPD8nVGr9iag+qQy4kbFNuVuP+342wr9IaXqIH+25yQZguwypUCLWtFw4DzqCMmyOacE5C0/XuzpDRdEx4OD8j5OQoCDcpX7EReG6fqazcOwe4VsAXwOLAP6Xzso7TmPfknnxw7FxtDg4lrHn6n6DTqGacbcy3ADJU2rTAvKlW6EWN2wnJNC+NnB4A0x+PLBD7sPJBNDRs4X9WBv2CXaoHBwraFiBG/q+6vFnNg4TmisNQFMDjUoGo1niaFLBy2ijBRGRETYJqpY20x3399ZPPUQQU8O+f8nJ69f7ZMsDBL0LNAttYolfqAt4/0M2cqvXHdGHrCGhXzwrxlyUWnWOBHTeensOhPyysL1+I50ouS9IkQQbMjKuX/GsJTO/U5BGjCiec7Ajt6GiNA/6TXKXWAKhP8kLQ9eL+YSfYBmUZEj+mksO07tuHzW+ix5HrTgMEn0CTIsNkEImNjgaAF6kbVQPei+wlg4x14wGeOXCR8JhYVihMFSMN88jGt+fT1qH//QCUHN6CfWbVf/cMZ2aLqpsEq/OqXb1Klfq0Os7Jox3gG78I7TcsWbPA4ip+7qQKtZ2IP/Kf9vRSaI9jnyXUpN9MuNtxfQWUqS8vBpuBEYe1PhClammn0VN8u9oHRDAj54TiErfijZCwIHL5ChpmAXVeBL0Evch1DUaOFh5bL7AjXoITHggZrQvX3dTEfue+DVzdJk5EOh9fsCGsdEZ80w6UgZ4j6nSR5nKNEYg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(8936002)(5660300002)(4326008)(91956017)(508600001)(66446008)(2906002)(76116006)(8676002)(122000001)(36756003)(31696002)(64756008)(66946007)(66476007)(66556008)(31686004)(6512007)(53546011)(26005)(6486002)(186003)(6506007)(38100700002)(2616005)(83380400001)(54906003)(316002)(82960400001)(71200400001)(6916009)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZlRUSG5jaXN6UTFzVlV4dXd3UmtTYzBiZGRBYXR6Mk9hT0JjZWRSM21YZXdO?=
 =?utf-8?B?amdqN2pua3hrNy9NaE12UEFGRGh2TVhQOXJscmtoSElxd2UzRVFpK1VnU2Ru?=
 =?utf-8?B?UmlvelZjQzd3eFIrS1A1WTNGOUZaYmZLREhiNndNVE5iVkxrYUJLc3FTK3VM?=
 =?utf-8?B?UzFqK0I4dlpOWW8rRytNTHpqT0lwYTlDOWhpcVRpTGRHekgxeStTUHpEWkV5?=
 =?utf-8?B?eTE0ZVZzZGZLNnRDNXdYUFZva2xGY24vSDNrUGNPcXhnamc2MnhNYXlsQkhB?=
 =?utf-8?B?ZVJCaDhYbW1ZSVNaZHpnb0xzbEpuS0RrQU5NS3kwUFRBU25OdnFEM1dRQzJK?=
 =?utf-8?B?akk2T0QrVzRmb252TTNtcEZ6akV1OGJhZEhqNWFzMk96bC9pT0o5NTVOK3pt?=
 =?utf-8?B?MDkxS1VhK2orUnZycXcyZDBZcDlsTjRFc2VoSi9YejIrVWNiYWJOcTl1a2Ju?=
 =?utf-8?B?dmswVUltUlpLVDhxYW13c05YRm4wcng5QTJtRC9adnhDblJQem9wZDBLNE13?=
 =?utf-8?B?QlMzaEtRQ1Vlb2ZzVHc0NWdHODh0TTBGMnRrOUJJQXJtUzBna3o3UnZLUTdl?=
 =?utf-8?B?TVZLb3F1L2RMVVVwazJtYVFRYUplM0hZc3lUcFAybWR1NVpreUM4OVFtcWtV?=
 =?utf-8?B?SitvdHhvR1owT08rOEJ0QStEak5VVS9QM05xMkR3djRDRC9MYUxwaUtZK1Fk?=
 =?utf-8?B?TTlUVUFUUHduNksvdUpXc0hUSFhKendxT0FPS2FKc3lFWkowRjZqS2xETlNv?=
 =?utf-8?B?ZnhQRXY0dUR6M3gzTjNEWGVPNThlNHZZTEdneWpBOWcyQXcwaWlCa3JlTmM0?=
 =?utf-8?B?TUIrMHFTc1FFOEpZbnF2YzJmVHZPbFgzaCtZeDlWWG43SFFhbGxtZ2hTMDc0?=
 =?utf-8?B?OE1zWDFGRTZpYlMvOE44YVpMUmdERS96WHUxRnhnanFtUzBXZDFTdWI2Wko5?=
 =?utf-8?B?Mm5mNFhaSWZvcDAvTVFWcTV1MFRFazdTaUVDbVE3bElIWGd5U1pBRmRsTzRk?=
 =?utf-8?B?dzNVQ242ZHhsbCt6TGRBNTlWVTlTSi9OWXQ0dWtwOHJiRm5jTlBnQS9mb2NH?=
 =?utf-8?B?cUFJR3JPNWdQOThNS0JCWDZCZm1mS0wxOVdpSitCdy9NTGtNeGJHcjkxTEF3?=
 =?utf-8?B?LzBuRTBiMXNNMHFaTUo0VndGQ01YWDRKTWVwSm1nVmlmSExySEpSZzdFNkh4?=
 =?utf-8?B?QTVDb0loNWtpbXRxODVFRXZ6VDZZa0VNdXdUaEJqVHdaV2gyNEpIeloxVW54?=
 =?utf-8?B?YVhSWHRyanlLSlhwNEtBL2FzMU9Rbk0yUVhaSXc0R1cyeDVHRmZ6cjhjOThp?=
 =?utf-8?B?cWQra3lDZkhBeENIeS9pYUl5SFF2RFNiNkIrKzkyaDh3dVFLZDZsTmdmWk5Y?=
 =?utf-8?B?OHZUU3k3RTQ1WXg4T1V3Z1hacWgyWG5qRjJ2QTdCUlNpQ1lCcVpMQTV1d2Rm?=
 =?utf-8?B?MnVuOXhhVk9Pc0VRODJkYTVQWS8vN1VjdStYSko0VTBDbXpFc3MyTmcwdlIv?=
 =?utf-8?B?bFFXeEZWU0o5NWFXOUVFczhaVjRwdm4vSFFqQ0wvTEVxNjI3bEV2Nko4RFVT?=
 =?utf-8?B?b2VobHVabk5aaTlzNmFBOC9DQUxFUnpxeW93a3EwUlN5Sy90QlNHbW1NQWh3?=
 =?utf-8?B?Y20zYlVyN0xDTi90WGxuaEVXUjRRRmovK1NMTDVwcDBKVEZIeiswOVVJZ25N?=
 =?utf-8?B?MmlPT3VSckE5Z0pDUGRzY2IzbmtYaW1KQ1ZpbW9KZmdFWm1IdXR3dTUveWRK?=
 =?utf-8?B?TDRqRGM4dDFpZnc0WUJFMHF3WUUxZXJrVnp2YUJBUkc5a0daWVZUM080a0Fx?=
 =?utf-8?B?L1ErTmJMWVl2aUVkRjBmek9DQ3NtYW5WR1JVMWdQVjJ1cEs4TWZYZkMwNDEy?=
 =?utf-8?B?NkdHQnVwR3lTbVN6enJFdWUySFZMR055Ni9Pa0tYTEZTeVBtL2FZTzZ6MlVs?=
 =?utf-8?B?bFp5TkhXOWJha2V3UXRMcVU0TUJDSXU4YW9oQ0dVSDJHaEdKMmppNjdmRjhH?=
 =?utf-8?B?akhLOHV3VXlWTkp1d2wrNFBIMkl5cUc4ZFd2MEN6ZTNjWEZGenlvRzNMVVZt?=
 =?utf-8?B?bDUrOUFhRjZjRldKSysrcXE4cmErZ3huMHc4Z3NXWkVncFZrYkFPNkhJaldi?=
 =?utf-8?B?Y21kVVVBNGtHUDVxbGZqdm9nTjZMRjM5K3JKUC9jMnRFSUt5VVJGekNPbXor?=
 =?utf-8?B?MG9NR05TRlRmT2lZcE5EVWtaM3p1N25TVFdXazh4bXRWekUrMncrVlYzSEl1?=
 =?utf-8?B?RUwyWW9rS0UrNXp4NWhYTlFVYldFalovTDlxT2llZGlwb0s1YnhsajhGRzFB?=
 =?utf-8?B?Snh1aVpMZzRjT3hkYzZ6cGtIejBiR1o5WVdsdUFZVlNmY1MxRGs4QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5C26B2FE914E34FACAC12A86B993C5E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ef017f-761a-4a9a-bf00-08da23bb9f78
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 17:23:16.7068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ULqIUfABTgz+uqRNkIZtwIzzB/eakTvbnkb+8D90QEO8CrvDluXmAjCFp2IIeMR/qPuXZwAqY/Njq6o1d5Ij87fn9/Rfs6OyyoZhIY4lWv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4789

T24gMjEvMDQvMjAyMiAxNDowMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIwLjA0LjIwMjIg
MTY6MTMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBGcm9tOiBCb2JieSBFc2hsZW1hbiA8Ym9i
YnkuZXNobGVtYW5AZ21haWwuY29tPg0KPj4NCj4+IGRlYnVnZ2VyX3RyYXBfZW50cnkoKSBpcyB1
bnJlbGF0ZWQgdG8gdGhlIG90aGVyIGNvbnRlbnRzIG9mIGRlYnVnZ2VyLmguICBJdCBpcw0KPj4g
YSBuby1vcCBmb3IgZXZlcnl0aGluZyBvdGhlciB0aGFuICNEQi8jQlAsIGFuZCBmb3IgdGhvc2Ug
aXQgaW52b2tlcyBndWVzdA0KPj4gZGVidWdnaW5nIChDT05GSUdfR0RCU1gpIG5vdCBob3N0IGRl
YnVnZ2luZyAoQ09ORklHX0NSQVNIX0RFQlVHKS4NCj4+DQo+PiBGdXJ0aGVybW9yZSwgdGhlIGRl
c2NyaXB0aW9uIG9mIGhvdyB0byB1c2UgZGVidWdnZXJfdHJhcF9lbnRyeSgpIGlzIGF0IGJlc3Qs
DQo+PiBzdGFsZS4gIEl0IGlzIG5vdCBjYWxsZWQgZnJvbSBhbGwgZXhjZXB0aW9uIHBhdGhzLA0K
PiBCdXQgb24gYWxtb3N0IGFsbCAoYmVmb3JlIHRoaXMgY2hhbmdlKSAtIHRoZSBleGNlcHRpb24g
bG9va3MgdG8gYmUNCj4gI05NLg0KPg0KPj4gYW5kIGJlY2F1c2UgdGhlIGRldmVsb3Blcg0KPj4g
aXMgZm9yY2VkIHRvIG1vZGlmeSBYZW4gdG8gcGVyZm9ybSBkZWJ1Z2dpbmcsIGVkaXRpbmcgZGVi
dWdnZXJfdHJhcF9lbnRyeSgpIGlzDQo+PiBub3QgdGhlIHdheSBvbmUgd291bGQgZWZmaWNpZW50
bHkgZ28gYWJvdXQgZGlhZ25vc2luZyB0aGUgcHJvYmxlbS4NCj4gU2hvdWxkbid0IGl0IGJlIHRo
ZSByZW1vdGUgZW5kIHRvIHJlcXVlc3Qgd2hpY2ggZXhjZXB0aW9ucyBpdCB3YW50cw0KPiB0byBi
ZSBub3RpZmllZCBvZj8gSWYgc28sIHJlbW92aW5nIHRoZSBob29rIGludm9jYXRpb24gaXNuJ3Qg
dmVyeQ0KPiBoZWxwZnVsLg0KDQpUaGF0J3Mgbm90IHBhcnQgb2YgdGhlIGdkYiByZW1vdGUgcHJv
dG9jb2wuDQoNCkluIG5vcm1hbCBjb25kaXRpb25zLCBnZGIgZ2V0cyB0byBzZWUgc2VlIGFueXRo
aW5nIHdoaWNoIG1hbmlmZXN0cyBhcyBhDQpzaWduYWwuwqAgSXQgZG9lcyBub3QgZ2V0IHRvIHNl
ZSBhbnl0aGluZyB3aGljaCBpcyByZXNvbHZlZCBieSB0aGUga2VybmVsDQpiZWhpbmQgdGhlIHNj
ZW5lcy7CoCAjTk0geW91J3ZlIGFscmVhZHkgaWRlbnRpZmllZCwgYW5kIG1vc3QgI1BGJ3Mgd291
bGQNCmNvdW50IHRvby7CoCBCYWNrIGluIHRoZSAzMmJpdCBkYXlzLCBYZW4taW5kdWNlZCAjR1Av
I1NTJ3MgZm9yIG5vbi00Rw0Kc2VnbWVudHMgd291bGQgY291bnQgdG9vLg0KDQpCdXQgaW4gYWRk
aXRpb24gdG8gZmlsdGVyaW5nIFhlbidzIGlkZWEgb2YgImZpeGluZyB1cCBiZWhpbmQgdGhlDQpz
Y2VuZXMiLCB5b3UgYWxzbyBuZWVkIHRvIFhlbiB0byB1bmRlcnN0YW5kIHdoZW4gdG8gc2tpcCBu
b3RpZmljYXRpb25zDQpiYXNlZCBvbiB3aGF0IGEgUFYgZ3Vlc3Qga2VybmVsIGNhbiBmaXggdXAs
IGFuZCB0aGlzIGlzIGdldHRpbmcgZXZlbg0KZnVydGhlciBvdXQgb2YgZ2RiJ3MgY29tZm9ydCB6
b25lLg0KDQpkZWJ1Z2dlcl90cmFwX2VudHJ5KCkgaXMgZW1wdHkgKFdSVCBnZGJzdHViKSBzcGVj
aWZpY2FsbHkgYmVjYXVzZSBpdCdzDQpkZXNjcmlwdGlvbiBpcyBub25zZW5zZSBpbiBhbnkgcHJh
Y3RpY2FsIGRlYnVnZ2luZyBzY2VuYXJpby7CoCBBbmQgbGV0cw0Kbm90IHN0YXJ0IG9uIHRoZSBm
YWN0IHRoYXQgdGhlIGxhY2sgb2YgYWJpbGl0eSB0byBpbnZva2UNCnB2X2V2ZW50X2luamVjdCgp
IG1lYW5zIHRoYXQgYW55IGZhdWx0IGZyb20gdXNlcnNwYWNlIHdpbGwgbGl2ZWxvY2sNCnVuZGVy
IGRlYnVnZ2luZy4NCg0KRGVsZXRpbmcgaXQgaXMgYWJzb2x1dGVseSB0aGUgcmlnaHQgd2F5IGZv
cndhcmQsIGJlY2F1c2UgYSB0aGVvcmV0aWNhbA0KZnV0dXJlIHdpdGggc29tZW9uZSB3aXJpbmcg
dGhpcyB1cCB3b3VsZCBoYXZlIHRvIHN0YXJ0IGFnYWluIGZyb20gc2NyYXRjaC4NCg0KTm90IHRo
YXQgcXVhbGlmaWVzIGFzIGEgZ29vZCByZWFzb24gaW4gaXNvbGF0aW9uLCBkb190cmFwKCkgY29u
dGFpbnMNCnVucmVhY2hhYmxlIGxvZ2ljIGJlY2F1c2UgdGhlIGNvbXBpbGVyIGNhbid0IGZpZ3Vy
ZSBvdXQgdGhhdCAjREIvI0JQIGFyZQ0KaGFuZGxlZCB2aWEgYWx0ZXJuYXRpdmUgcGF0aHMsIGFu
ZCB0aGUgZ2Ric3ggbG9naWMgaXMgZGVhZC4NCg0KfkFuZHJldw0K

