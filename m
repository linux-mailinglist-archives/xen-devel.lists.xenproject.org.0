Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE7D4C44B9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 13:41:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279070.476602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNZuM-0001KA-Dj; Fri, 25 Feb 2022 12:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279070.476602; Fri, 25 Feb 2022 12:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNZuM-0001Ha-AD; Fri, 25 Feb 2022 12:41:14 +0000
Received: by outflank-mailman (input) for mailman id 279070;
 Fri, 25 Feb 2022 12:41:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZUh1=TI=citrix.com=prvs=04827bf5e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nNZuK-0001HU-P8
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 12:41:12 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 323a3b82-9638-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 13:41:06 +0100 (CET)
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
X-Inumbo-ID: 323a3b82-9638-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645792865;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=la1fAJ8UP1zhnZR7eEXYw9LSuWccAxsyPyp/KC8csKE=;
  b=ZVZnJP493oyAfhAidZgIH8Q/92KS6ee/bKvJmekKKmy9/807BmjqCbt/
   EZXi6sDLUvKtiwdvQHSiA/b/mD+n41girpPwztAMys590KjYqzOE2nGB6
   IWRPpbEFjAFBaGhG0LR1P5g1BPgF3s+ntHzk2Wv5x3Y/HM07Wh22sDGlq
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67251824
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6FUhLKBC6P+NfRVW//zjw5YqxClBgxIJ4kV8jS/XYbTApD5x0TcBy
 mVJX2DVb/+JZTGjf9sib4619ksB7MKBztYyQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Rj39Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhr9
 +dwkZKKezsJHZPrqv8cThcbKiVXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4RR6uHN
 5BFAdZpRAjLewVBYQ0oM4kBk+P22mCvWTJ/k03A8MLb5ECMlVcsgdABKuH9f9WQQMxPk0Wwp
 2TY/n/4CBUXKNyezzWe9numwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 2QQ/SUpoLIu9E2tQ8Okd0Tm+ziPuRt0c9haHvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAqPHE9lteJBT5M0cYWh05aQU/0eXDg78UvAnOU9ggKaqc24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNocd7BJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVdwBiN2dDB0wWirhRdMPS
 BWC0e+2zMUOVEZGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOgz2yzBFwzPlnY
 c/znSOQ4ZAyU/UPIN2eHbp17FPW7npmmTO7qW7TlXxLLoZylFbKEOxYYTNin8gy7b+eoRW9z
 jqsH5Di9vmra8WnOnO/2ddKdTgidCFnbbir+50/XrPSeWJORTB+Y8I9NJt8IuSJaYwOzbyWl
 px8M2cFoGfCaYrvcl3bOig+M+q0Bf6SbxsTZEQRALph4FB6Ca6H56YDbZonO74h8e1o1/lvS
 PcZPc6HB5xypv7volzxsbGVQFReSSmW
IronPort-HdrOrdr: A9a23:qAHFsayqGs1GEhtc0xpYKrPxguskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9IYgBcpTiBUJPwJE81bfZOkMYs1MSZLXXbUQyTXc9fBOrZsnHd8kjFmNK1up
 0QCpSWZOeAbmSSyPyKmjVQcOxQgeVvkprY/ds2pk0FJWoBCsFdBkVCe32m+yVNNVJ77PECZf
 6hD7981lydkAMsH6OG7xc+Lor+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10zDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/wzd4dvfqmrCou
 O85yvIDP4DrE85uVvF5ycF7jOQlQrGLUWSkGNwz0GT+fARDwhKdPapzbgpDCcxrXBQ5u2UmZ
 g7r15w/fBsfGL9tTW46N7SWx5wkE2o5XIkjO4IlnRaFZATcblLsOUkjQho+bo7bWvHAbocYa
 FT5QDnlYJrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRaxx47hd8AYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiHqAaPHDGrYLx/dwOlauXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO6RzJSHXVZ0Wa9iif3ekPhlTRfsuYDcTYciFcryKJmYRrPvHm
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="67251824"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCtXdOKsKA3/gMsw6cuT3O1kjzkxRMieGojDJi8LYiDj3VNCCXrGYNb5BNcNVbnCUO7UYgX3COT0HVoe/k/rtR6W7PdVk3qCQ8MzhmDO/LmQHXP6eAPHC6j9x9wdcZI93oORTD7yoaX4YabR07xDtZ9koT1xkl5hm1mSuiNkxvCzlEywP/Sfj0rp05jtLg9qZdZiVa0D/pH5CCabfNmLILu/coR/lYUKHAvdbOVwmkOFW6ZzTuNevsC9fOTWYZILzsjU7cP0lEco8mtL/cmd2BKF5krVnzYaG8Rx8loMSFlQThPPs16QXQen7jMncMDX54BOVVOSRFfYhSHUN74egQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=la1fAJ8UP1zhnZR7eEXYw9LSuWccAxsyPyp/KC8csKE=;
 b=a0V8G2cEhzmP4ejU/Vwu8gGKjyiYPDGOAljMgnttsSmi4hMoVMKP1kOKoHYERrt9dPgsyKupOHXcKAYLcr75xXeR9eM8P5KDZPGmFIbwg4R21OQn7RSctg5qM1TIzDRlpJnaY88aQYW0F2IVpBDiYyKsNWA2bfr5pi3gdWNRsulNCFFrrgBD1xZKKcVTib5X3Uh28skVA3nBAGWe265b9AJtGJGoT41p1BhdtQHrNXsCb47rLpyZyQE/GLzF1Awix/D2sYSJRJsloTcJoiqgMwb+H5iFoIIJzS77uov16WsEbvrK+It9yI07WNQiX6c73M60yFpVO/2i8/TqzOiq4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=la1fAJ8UP1zhnZR7eEXYw9LSuWccAxsyPyp/KC8csKE=;
 b=jIzK+NfME5yPw2ThgQOY7Ql+lgUHFSfpq+lcdIVpxuUuPPk8rhBQ92+dKgi13+kIMZh225fE068PnCHPvHVEpKDIb5OR9sYU/esG6cH3BF6+3ocgaS+MtwXJxJrKg7vguP0pohTBbqqylhwYvjJ8ICchEv5h6ZruMWBN3awlisg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Thiner
 Logoer" <logoerthiner1@163.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: x86/CET: Fix S3 resume with shadow stacks active
Thread-Topic: x86/CET: Fix S3 resume with shadow stacks active
Thread-Index: AQHYKbemeqHKT0/FpkqigAUimYUei6yj8pMAgABD3oA=
Date: Fri, 25 Feb 2022 12:41:00 +0000
Message-ID: <ec8e8166-aad6-54b9-a58d-2681e690ce55@citrix.com>
References: <20220224194853.17774-1-andrew.cooper3@citrix.com>
 <20220224194853.17774-2-andrew.cooper3@citrix.com>
 <9b1f517f-eb4d-ddc7-b957-4f0354ee2b9d@suse.com>
In-Reply-To: <9b1f517f-eb4d-ddc7-b957-4f0354ee2b9d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5e7450b-e3c2-451a-26a9-08d9f85c13d8
x-ms-traffictypediagnostic: SN6PR03MB3600:EE_
x-microsoft-antispam-prvs: <SN6PR03MB360060B17249EDE04A127BD6BA3E9@SN6PR03MB3600.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GCht6HCQzAw++C0yYU3z1w08gflU6cN1DB+3vtbD+D3Twjk+J35DYu5tzXNFcZdiYq2Vp/uO3BseeBq2ABjGDZUyDhBKaumfdn9pM3QjZW4Z8xxbf43hNxRWSWYPs1vdgRa/DV0VbXfTwbV+NG18v34UeFQNY5/M8lfZTKaqmzLWap8MKm7h0hftDWDnpBwxMp3gihDbVnNUBziIWS6NqH6p2IV6ZMMbRPRFCuG0J2ypXW5Z5+AXdckBraT76p3/T0a5P2aCqDyVqAtW0EO6kvEoLjIuw1l4qiBc4TrdmsFBVXaC9uyZb9KMX8b/eYJP7DdVSn2oMB8IF2+7L/W45nLnS6i3HCTvRaleAJoqgHW1RRRXzkWyu1MEFsHkUs0Q2yZzpt9nXa5ZPy0tdW3uEkiD3jY1whs29XyNIdUU3esAKxeuDfnpAWyv2Jc42iyMTvBW5nNDbUnRVR+qurlkFJmQ/JqIrDwYCSci0ZAA/G41G4l4Y1vuV7MpnYjrWGWSog5VNtp6AaWh11j/Sxetjl0J2wrvcc2yW2S5yEggbwEBLHRJ8wrxS2/t9DN/9Q0N7BDVElTJ5C6UBQL++GuzROR1XOrmvETgYy+JQDGYcFybPzjetOEwmVqvJvHGS4D7KAPL8T03UFq/2bAjGU7En9RRP+MZbMwJZK1bGrvMkeTnxOFNDM/SdNftTHs2s0kNIk4cnpbZhFxC/cLV496pZRDFGkdugqMBgCNhHSBXiYeqgE3sjShYj7epEe6wmpXcg3pkG7OG7dg9AyArpNmGHn6RKR+ObD18E0Lhezt267MUUfwmEw7xq1SXLvBi8cpqzT/UlorjDK7yEVamHAmO6s9GtIi+RgS2SvVmPZvT0BU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(8936002)(86362001)(5660300002)(66446008)(64756008)(66946007)(66556008)(6512007)(122000001)(6506007)(91956017)(31696002)(53546011)(4326008)(38100700002)(8676002)(66476007)(54906003)(76116006)(26005)(36756003)(83380400001)(186003)(38070700005)(2906002)(2616005)(508600001)(66574015)(6486002)(6916009)(966005)(71200400001)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFdDNC9zUXJROHZtSWlEL2J5MWxSbTNLamNzSWFsNzlYMkduNU5DclJKS3I0?=
 =?utf-8?B?aWl1NE85VDk2dWs1anhqY00yNDIyRStBdnVqSGNPVnErZDVlTUo2T0E1dkhi?=
 =?utf-8?B?TmVNdXpJUEpENEwyRWVUT2QwN3VLYktGRnZNVmVITEdmVG5ja2ZHcjY1cDNL?=
 =?utf-8?B?ZHozNGtTWkJuZ3lRcHdvUTE2YWdBbGJSSEFnWE5sMlM3bzFmbCtFUFZ2ZGcw?=
 =?utf-8?B?MmVaOEprNUJnUzNtUy9VRy9EVVpMazZTekx0bWxWR1UrdEJFb2VSYUZLaU1R?=
 =?utf-8?B?dWpvK0VJb09zaG9sZnNzVWdKUXJRQzlnMjExb21iMWV3S1hXODkvVmd5RUpq?=
 =?utf-8?B?eVl2UkVrNFBPUzJSQXUzRk5IRmxkY1BncjRsTThyOGF5Q1ZnMlVlblZ5elI5?=
 =?utf-8?B?ZEZGUklxVnJSeXRNMXFabnZ6dnR0OGN4VXVnNjNpQ2ZUZ0VjYlJWeTVFUXJ3?=
 =?utf-8?B?a1dkZWl2WXdKL2RzakxrVTRBdldIK05sTXZpM2oxaDdObXZycnU4Rk9jV2ll?=
 =?utf-8?B?NHM4RFF1VGVDY3Y3b2JCYnFoZmdiMUdkankra1AxdTNtam85WlRlWnVtQkJ3?=
 =?utf-8?B?bXRDS2hNa05iRGZTZWcvdjY3aGo4a1MxVXlxdmU3R0Z2dXFSNVdiWFFpV0pM?=
 =?utf-8?B?VFYwVUZZalNHa3VQNm1BSm9oNVdPeExhK2RZcDFwUUpGWjllSHdTUCs1M0tw?=
 =?utf-8?B?OUdsVDRHd29kMnRKenBwdjZEakpVTHhFakxvaG1ySDJLTGlta2g2RFQzQmNG?=
 =?utf-8?B?NGhVaTFib1pJbE12S01GVE0xQ3hDUHZvRVJrdjVnK2sxb2V3bWRoQ3lPbHBB?=
 =?utf-8?B?SG0xZ09LenQvaHh0dU01WkZaNEFpbWg3Unh1QVRjaVByU0crRHhRVFg3UVJR?=
 =?utf-8?B?N0p6ZnYwYWpuSkRzc3dsTXFwWjI5bkhUNHRrM005TklTUEFkQXU0NG15b1U5?=
 =?utf-8?B?dDJqak9WcG5hOTltbDF0d2E2YmR4cXpOMDB1WTg1NEZhYUp1TkQyMy9Ockk2?=
 =?utf-8?B?dlRHek0rVzFKckJidUhMNkxXa3ZocDV3N2Iya29VeVdrZGhMaDNUTXpPNldY?=
 =?utf-8?B?elZFbk5MMGQ5NlNZZFFHa2cvZng0ZmJ3eFR1bnJhV040aDlJcWMzWk9kb1RL?=
 =?utf-8?B?N2huSnA3K3JPMTlqVEVKc3JCR3dtY2pXbFFDK0c1RTU3RzhZK1BKRFB0RkRC?=
 =?utf-8?B?Sm9DclJ4bWNoZXZiVys2Mis0aUVUeUtMSW1qYllDaWxsUXZ6WkNpVmxrQjFl?=
 =?utf-8?B?U1NSaGlPaFBOaGIyVmtKa2NqWEluVmVlckNjeUhJWkJzSzJvM042bkl6ZzZE?=
 =?utf-8?B?Y1BtVkxmdjBGZkYyOGxyZjZDLzAvZEpTSUw3NlNqeGh1TzJLSTR0RmppNW5I?=
 =?utf-8?B?OENkOUgraW5hOUc2U1FkSXBEMHlTT2ZKRVQvQ3VOMDAwaWlmNVpMa1BjMTE2?=
 =?utf-8?B?TUEvem56aWFVRW1TNGJiYkVtdUI5NFNpcGZNbmdGRWRZNTBhOFFlRGQ1SThJ?=
 =?utf-8?B?dWpBT0xyQ2ppUlVQSlJEU1lkUXAvT2tvTFVFV2ZWL0IzTXUvczdRd3VFbTc2?=
 =?utf-8?B?NnFaUkdGK2VTTTZMUllaZjlGMWFGWk0xTERKdFN1UXU2SFJ0bGhNTEQ0WkdW?=
 =?utf-8?B?WTZFMElWeW9LZkxFS1d1UFBpb3JvNThuWnNqUTdYY3NuV0NpZVh2bjdlL1By?=
 =?utf-8?B?MjFyMHNYdDE4NUY1c1lRa2FMYWcwVFJKZDI0VmVMV1NFeUpZNm1CM241bU05?=
 =?utf-8?B?eVE0bXpUNVc3VE8vVC9PWUF3ZTNJRE5HdlJHcnlsZXAzSCtHMXRvczZpaTRs?=
 =?utf-8?B?ZHpNRWZ0bWp3QnR5NzdqaS9uVGpveFFwVzBrOUh0M2lXZ2pncFlTMmVRMGpB?=
 =?utf-8?B?bGpaOUtSQVNLNlA0cGZMRXRnZWlZNjQwamtsMjNzeUJmRjRuVmFBaHVEOWdk?=
 =?utf-8?B?bVZmZ0NHWXBnU3RjSzhLV3Z5MU1OSkhoOFB0NVJ1eTF2T25PaU1waFNvcWpS?=
 =?utf-8?B?eEhXeXNxN2hvQm8wZXNkUXZtemNEbDJUMW5pMTdpNlBXOVFQaE9US1dUZnVi?=
 =?utf-8?B?UUFja1diQWdRSjdwTFRtS3oxS0lPN3FNcnlGYWkrUTEvSkVTY3R4bTAvOFI1?=
 =?utf-8?B?dkc1WjZHdndvemlTN2xjUEpVakFqRWJhZU1SQlIxNHcxdk0vQTdLMlgvaEZD?=
 =?utf-8?B?dm1SYzRRYVlMa1FqUFV6bmhrNFFHVEcwUjdOQnNvRXZiMkltTmJlOFlLcjR4?=
 =?utf-8?B?TnVoQnp3aEVGRFlSeVJnMGRxYTN3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <07567A3C09D6E240A54F0375AF1D77A4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e7450b-e3c2-451a-26a9-08d9f85c13d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 12:41:00.0904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KHfPjTCNqx6NrP81vX1TXbuCXeU2sfMCLNHf3w+J1A3np7vzPozTliyXz9NtNYXzxmYPg1vuc4RF+YG+C7pk0g6TA9brWYet2WMDbvSI3Bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3600
X-OriginatorOrg: citrix.com

T24gMjUvMDIvMjAyMiAwODozOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI0LjAyLjIwMjIg
MjA6NDgsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBUaGUgb3JpZ2luYWwgc2hhZG93IHN0YWNr
IHN1cHBvcnQgaGFzIGFuIGVycm9yIG9uIFMzIHJlc3VtZSB3aXRoIHZlcnkgYml6emFyZQ0KPj4g
ZmFsbG91dC4gIFRoZSBCU1AgY29tZXMgYmFjayB1cCwgYnV0IEFQcyBmYWlsIHdpdGg6DQo+Pg0K
Pj4gICAoWEVOKSBFbmFibGluZyBub24tYm9vdCBDUFVzIC4uLg0KPj4gICAoWEVOKSBTdHVjayA/
Pw0KPj4gICAoWEVOKSBFcnJvciBicmluZ2luZyBDUFUxIHVwOiAtNQ0KPj4NCj4+IGFuZCB0aGVu
IGxhdGVyIChvbiBhdCBsZWFzdCB0d28gSW50ZWwgVGlnZXJMYWtlIHBsYXRmb3JtcyksIHRoZSBu
ZXh0IEhWTSB2Q1BVDQo+PiB0byBiZSBzY2hlZHVsZWQgb24gdGhlIEJTUCBkaWVzIHdpdGg6DQo+
Pg0KPj4gICAoWEVOKSBkMXYwIFVuZXhwZWN0ZWQgdm1leGl0OiByZWFzb24gMw0KPj4gICAoWEVO
KSBkb21haW5fY3Jhc2ggY2FsbGVkIGZyb20gdm14LmM6NDMwNA0KPj4gICAoWEVOKSBEb21haW4g
MSAodmNwdSMwKSBjcmFzaGVkIG9uIGNwdSMwOg0KPj4NCj4+IFRoZSBWTUV4aXQgcmVhc29uIGlz
IEVYSVRfUkVBU09OX0lOSVQsIHdoaWNoIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggdGhlDQo+PiBz
Y2hlZHVsZWQgdkNQVSwgYW5kIHdpbGwgYmUgYWRkcmVzc2VkIGluIGEgc3Vic2VxdWVudCBwYXRj
aC4gIEl0IGlzIGENCj4+IGNvbnNlcXVlbmNlIG9mIHRoZSBBUHMgdHJpcGxlIGZhdWx0aW5nLg0K
Pj4NCj4+IFRoZSByZWFzb24gdGhlIEFQcyB0cmlwbGUgZmF1bHQgaXMgYmVjYXVzZSB3ZSBkb24n
dCB0ZWFyIGRvd24gdGhlIHN0YWNrcyBvbg0KPj4gc3VzcGVuZC4gIFRoZSBpZGxlL3BsYXlfZGVh
ZCBsb29wIGlzIGtpbGxlZCBpbiB0aGUgbWlkZGxlIG9mIHJ1bm5pbmcsIG1lYW5pbmcNCj4+IHRo
YXQgdGhlIHN1cGVydmlzb3IgdG9rZW4gaXMgbGVmdCBidXN5Lg0KPj4NCj4+IE9uIHJlc3VtZSwg
U0VUU1NCU1kgZmluZHMgdGhlIHRva2VuIGFscmVhZHkgYnVzeSwgc3VmZmVycyAjQ1AgYW5kIHRy
aXBsZQ0KPj4gZmF1bHRzIGJlY2F1c2UgdGhlIElEVCBpc24ndCBjb25maWd1cmVkIHRoaXMgZWFy
bHkuDQo+Pg0KPj4gUmV3b3JrIHRoZSBBUCBicmluZ3VwIHBhdGggdG8gKHJlKWNyZWF0ZSB0aGUg
c3VwZXJ2aXNvciB0b2tlbi4gIFRoaXMgZW5zdXJlcw0KPj4gdGhlIHByaW1hcnkgc3RhY2sgaXMg
bm9uLWJ1c3kgYmVmb3JlIHVzZS4NCj4+DQo+PiBGaXhlczogYjYwYWI0MmRiMmYwICgieDg2L3No
c3RrOiBBY3RpdmF0ZSBTdXBlcnZpc29yIFNoYWRvdyBTdGFja3MiKQ0KPj4gTGluazogaHR0cHM6
Ly9naXRodWIuY29tL1F1YmVzT1MvcXViZXMtaXNzdWVzL2lzc3Vlcy83MjgzDQo+PiBSZXBvcnRl
ZC1ieTogVGhpbmVyIExvZ29lciA8bG9nb2VydGhpbmVyMUAxNjMuY29tPg0KPj4gUmVwb3J0ZWQt
Ynk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdz
bGFiLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+DQo+PiBUZXN0ZWQtYnk6IFRoaW5lciBMb2dvZXIgPGxvZ29lcnRoaW5lcjFA
MTYzLmNvbT4NCj4+IFRlc3RlZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJt
YXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPg0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KDQpUaGFua3MuDQoNCj4+IFNsaWdodGx5IFJGQy4gIFRoaXMg
ZG9lcyBmaXggdGhlIGNyYXNoIGVuY291bnRlcmVkLCBidXQgaXQgb2NjdXJzIHRvIG1lIHRoYXQN
Cj4+IHRoZXJlJ3MgYSByYWNlIGNvbmRpdGlvbiB3aGVuIFMzIHBsYXRmb3JtIHBvd2VyZG93biBp
cyBpbmNpZGVudCB3aXRoIGFuDQo+PiBOTUkvI01DLCB3aGVyZSBtb3JlIHRoYW4ganVzdCB0aGUg
cHJpbWFyeSBzaGFkb3cgc3RhY2sgY2FuIGVuZCB1cCBidXN5IG9uDQo+PiByZXN1bWUuDQo+Pg0K
Pj4gQSBsYXJnZXIgZml4IHdvdWxkIGJlIHRvIGNoYW5nZSBob3cgd2UgYWxsb2NhdGUgdG9rZW5z
LCBhbmQgYWx3YXlzIGhhdmUgZWFjaA0KPj4gQ1BVIHNldCB1cCBpdHMgb3duIHRva2Vucy4gIEkg
ZGlkbid0IGRvIHRoaXMgb3JpZ2luYWxseSBpbiB0aGUgaG9wZXMgb2YgaGF2aW5nDQo+PiBXUlNT
USBnZW5lcmFsbHkgZGlzYWJsZWQsIGJ1dCB0aGF0IHBsYW4gZmFpbGVkIHdoZW4gZW5jb3VudGVy
aW5nIHJlYWxpdHkuLi4NCj4gV2hpbGUgSSB0aGluayB0aGlzIHdhbnRzIGZpeGluZyBvbmUgd2F5
IG9yIGFub3RoZXIsIEkgYWxzbyB0aGluayB0aGlzDQo+IHNob3VsZG4ndCBibG9jayB0aGUgaW1t
ZWRpYXRlIGZpeCBoZXJlICh3aGljaCBhZGRyZXNzZXMgYW4gdW5jb25kaXRpb25hbA0KPiBjcmFz
aCByYXRoZXIgdGhhbiBhIHByZXR0eSB1bmxpa2VseSBvbmUpLg0KDQpGYWlyIHBvaW50LsKgIEkn
bGwgZ2V0IHRoaXMgY29tbWl0dGVkIG5vdywgYW5kIHdvcmsgb24gdGhlIElTVCBzaHN0a3MgbGF0
ZXIuDQoNCkFzIGEgbm90ZSBmb3IgYmFja3BvcnRpbmcsIHRoaXMgZGVwZW5kcyBvbiB0aGUgYWRq
dXN0bWVudHMgbWFkZSBpbiBjL3MNCjMxMTQzNGJmYzlkMSBzbyBpc24ndCBzYWZlIHRvIGJhY2tw
b3J0IGluIGV4YWN0bHkgdGhpcyBmb3JtLsKgIEknbGwgc29ydA0Kc29tZXRoaW5nIG91dCBpbiBk
dWUgY291cnNlLg0KDQp+QW5kcmV3DQo=

