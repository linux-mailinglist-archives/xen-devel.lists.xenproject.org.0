Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E73660014
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 13:15:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472502.732729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDlcR-0002nA-PG; Fri, 06 Jan 2023 12:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472502.732729; Fri, 06 Jan 2023 12:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDlcR-0002kV-LR; Fri, 06 Jan 2023 12:14:43 +0000
Received: by outflank-mailman (input) for mailman id 472502;
 Fri, 06 Jan 2023 12:14:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sfve=5D=citrix.com=prvs=363380921=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDlcP-0002kP-IO
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 12:14:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id affb8b01-8dbb-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 13:14:39 +0100 (CET)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jan 2023 07:14:35 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6073.namprd03.prod.outlook.com (2603:10b6:408:136::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 12:14:33 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 12:14:31 +0000
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
X-Inumbo-ID: affb8b01-8dbb-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673007279;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fCGwVpkqYvY+ebNdIlosFz/zHpTs09CKo5DcQO4LugE=;
  b=TLqEQ+N42Lz3l61qGg1TUgcgcW3ylFrmZ42f26Uf987LBPGYinSc8jVZ
   giia0vZ/TIx0iCVRqGFenC8YXuCDaAn4C7BrPUPd7foIU3WLWjmzt07fO
   3PiYTiX4iwKVx9UxWFPltQfaTYkqfve6AzCLJ9C1xSQ7sEJqNm4ZJQyQI
   c=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 91882619
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:n7hKqqnsttR2muTDhFU+qeno5gxKJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJC2HVO/aKNmT9c9p/aISy9EJSvJ7UndNgSApp/ig8ECMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkPqgS5AGGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aYEDg0dPlOGu/CRw4y9evtP3906F+C+aevzulk4pd3YJdAPZMmZBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVklI3jOaF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNLRO3iqKc76LGV7k0cSwQnZXSQmvKSm3yGQe4FL
 VdMoBN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yx2CGmEOQzpFadonnMw7Xzon0
 hmOhdyBLSNrmK2YTzSa7Lj8hTGvPSkYK0cSaClCShEKi/HzrYd2gh/RQ9JLFK+uksazCTz22
 yqNriU1m/MUl8Fj6kmg1VXOgjbpo4eTSAcwv1/TRjj9sl0/Y5O5bYu171Sd9exHMIuSUliGu
 j4DhtSa6+cNS5qKkURhXdkwIV1g3N7dWBW0vLKlN8BJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:y5JW5a7IPuV9pSEKKQPXwHrXdLJyesId70hD6qm+c20wTiX4rb
 HcoB1/73SbtN9/YhEdcK+7SdO9qB/nlKKdgrNhTItKIjOW2ldARbsKheHfKlbbak7DH4BmpM
 Jdm6MXMqyMMbAT5/yX3OHSeexO/DFJmprEuc7ui05ICSVWQ+VY6QF9YzzrYnGfhmN9dOYE/F
 733Ls4m9JkE05nEfhTfUN1ONTrlpnwjZf7ZhxDLAIm7QTmt0LS1JfKVyKA2wsYUXd04ZpKyx
 miryXJop+7tu29yFvn23TN449wkN/so+EzffCku4wuMzDxjQTtW4h7Qb2Fu1kO0ZmS1Go=
X-IronPort-AV: E=Sophos;i="5.96,305,1665460800"; 
   d="scan'208";a="91882619"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gnzv7MAvU48SvKl6ofvDE2CqNYjtMDmtwPNEprPFcX5B/cUkYeO/3pxDwDUOxOXB/uX9zTzD4ssPckYMPcXHMaZ83aTgV+dZg6BJSSZqkrPJIYt8XMYoVu814f9iQYlHiutSvjeKxxtfBFh3FOlcNc4HW+z+vLCMmFZ50D6ABO9+0Lx6G27jDcTOpy2fUC2MU6tLB8GVNuE2PrG0EE3QSxilTXkTQ+Agv4nFmlM6sjczHRxJb8Bw0hEWY+MGxxOKgLngiax8EyA0eGEgE57EIkmZehUKseY7N5a8dY35i5yetf2rgr6oIqvicYeI9hLi2X+++AkTEvTAV76roGgbpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCGwVpkqYvY+ebNdIlosFz/zHpTs09CKo5DcQO4LugE=;
 b=mnvCVmDHDXZWfDmHXxQLe3PXF63ajX/wS+b6uEiWIC4QdXcRP9i2EYcSffdZL+KNgG6TCeFjRoYDB0uCFtGNkuwKv1lC8EMxP/evgwTqn1llQHd3oQKct5J9QodSNI9lP2ex6y+qsHyZb8G6M7awI031ojFWqhYB0WtAaRQ2J0yav6bmT5XKNABKSQuT488mq/Y5BXpAE7Axbuwf9kk0/APE8OknSkl7huz+BUb+QWG/OssJvOJXW4J3F7Q2rCKPL+viXuaX62HZ0YSCjDZOIxDFU4Ge5FcVWWESNt4hMbOSSwIpwvcirDAlXcvVu/CfB3mU8b5+kqxPwwwTuLpxrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCGwVpkqYvY+ebNdIlosFz/zHpTs09CKo5DcQO4LugE=;
 b=RArDU5/77Yjd/SXsCXY23eeI65cb2+umWMXSn6dqxW68J8R+F3xLb5wYB+CyiIQNp4fWxBDarwWv6+nMSe3ZVAwxZUuSWXc0VZGK3w4FtMXODc7MOWeFpfY0SkwmBP1sHoC6a8WV1zb9sfVkNX4nsgA/gIqJsG/wA8Rsp7ILK1A=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/4] xen/version: Drop bogus return values for
 XENVER_platform_parameters
Thread-Topic: [PATCH 3/4] xen/version: Drop bogus return values for
 XENVER_platform_parameters
Thread-Index:
 AQHZH69XYhd2rMGoWE+asSBKOPPG4q6OdxyAgAA2ioCAAMm+gIAA8B2AgAChQoCAAEi6gA==
Date: Fri, 6 Jan 2023 12:14:31 +0000
Message-ID: <5bb7382c-bed0-144c-2906-38bc08c76a52@citrix.com>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-4-andrew.cooper3@citrix.com>
 <540a449d-f76d-eb16-4f98-c4fb3564ce98@suse.com>
 <7dd00ce3-a95b-2477-128c-de36e75c4a34@citrix.com>
 <ebaf70e5-e1ba-d72d-84f2-5acb7e38a6bc@suse.com>
 <9ce20298-5870-aa1b-ee5e-e16a623beadb@citrix.com>
 <a65a4553-d003-1a8d-abb7-5d8c1c9fface@suse.com>
In-Reply-To: <a65a4553-d003-1a8d-abb7-5d8c1c9fface@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN9PR03MB6073:EE_
x-ms-office365-filtering-correlation-id: 48acae29-53ec-4d7d-4413-08daefdf911b
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hCyLquK7cW01e/Tx4i3/q1Bt4LO3VvJ0buTqfcQx6fG+iMvNiFfPsfQ4yd2figH5KAGqlb/Yy9s4cGtkBVyEWjkc9nQexST7nGecX3EQoj9G5ByfU12qbfx8kKM/0vt9D1Fe51/HrRckZNZSU3A4D+Djz+1Sv083+surlkGLsAxNvOU41bVTsi2azBlgUmt5O8Hdf/TN/5qQyCwnhRoUkidhfE9v0QZwhvT21Nj+ELAznrbglMsMXDlmpJO+h1larHtq/peXgo7nLJA8zocK3LJ7vbdQ8+IVarPioxFxqVY9wOaES+EJ9pb8oGr1MBLqK4rDfLR9o2HNx8y0gp78AWyosZU8ezDx8Nf9iSX8Z9qrQWcjaV1m21uyUo74ouyPzdGIqz+aYWWXe3Xda/fx5LXbkDbt2AQhgqc1+NNAKRN00lpGdiJx2zbf/bxUSkQRy10jQYAycPxHL/gNsZK+SJX57QYcGEtvgC9r69a5HYFPlhkiqoP/MD8HR8acqy1x0L/q/tlvGx8HPfzdHiVRhkivfrSaEesrp8hFCaUrJei55KLAnlYko0UfZWEkzJRJnYWQoFUyahlEcRfc5EY6WamLG57sYe5jbGpZlM0tDNRwltLXAkvwOtdM9pfgzrfmYT1epmKq9Q3oPLKCw7V/Hnm4Rri7c6LtNG+m1W9/PTFLSi3C5YsWVcXI0y3ZgITkUQZERlgNuzHJ6wciUe817AsVFQCz20cdnA5CEWLuFiZ7BYGQSRzU6OEIIOc5EOPnAyb6/o5xO2D5w5jcvV02AQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199015)(5660300002)(2906002)(8936002)(4326008)(8676002)(31686004)(41300700001)(66946007)(64756008)(76116006)(316002)(91956017)(54906003)(66446008)(6916009)(478600001)(66556008)(66476007)(71200400001)(6486002)(6512007)(2616005)(186003)(26005)(6506007)(53546011)(31696002)(38100700002)(122000001)(86362001)(38070700005)(82960400001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NkI1a3Q4Z3pPQlQ2OW9RcUVydGRxa0p2cWZNWTBWMnNiM2NiKzZDdE1yaUdx?=
 =?utf-8?B?ZjAvN25Tb1dvMHo2ZHZtK1NpejVXZ2lJT3hGdHZ0ZjN6dno4SkVSbHlQMFF5?=
 =?utf-8?B?YVA1aHZNNWpqV3NWdGtQNFhxYXNSOFl6V3pWR0tJZ1B6aC8xSWU0VmVnZFJS?=
 =?utf-8?B?Z25JTmRpMWJ4eEZpMldyMzNVL1FlVk53dlZ2Snh0STREcWprNFVNdnNVMTJZ?=
 =?utf-8?B?MmdlYm02eDg1cTlGWFUwM1RHRjZkTElBR3dLdFJRaWJ2MGdhOXZSaEVFWE81?=
 =?utf-8?B?RStyTzVidi9mQWFmQkpINTVCbS90d0RLWFM1dFVGL1NaVmc1ZVZSVURONmdl?=
 =?utf-8?B?U3ZuOGNhdUEyNUJGWHVwb2Q4RS9EMnpVUzYrR3FsZCswdjhSNDlvWXhUV3po?=
 =?utf-8?B?M0NWT2g5NmMwRUVBWVhtbTlIZ1RxZ2l1emdTVW0zbGcvQkx3anN2MG04QUVB?=
 =?utf-8?B?Ty8rWEpqOU1jbG5vM3czUWhjajU4eDVkYndOR1J5N0Q2bG1VYUdmM3NBeFRr?=
 =?utf-8?B?eEh4TGZqZ3RIWko0Q3dacTREVVNpa3pBNVNCYnNyYlVpNXZYMDZIRzlLUGJG?=
 =?utf-8?B?dkJXQTBJbVpLRlhUNFkwZWd1RWdoTjY3T1RXRitIWkplck0vOXloOHZuSnlp?=
 =?utf-8?B?MzlYVmdaQnUvWnNmeHNGeVBYdElpNU9RQWZZV1BNWHZOMnZONzcvL3NGZW81?=
 =?utf-8?B?KzJnNmJSYnhPWmpMbHZPblZFcEFkL3NTV25udzJHZkRvekg4RU9wMzZieEVH?=
 =?utf-8?B?T3o5TjJaSTQ0VzN3eXhwak11dWI3TWJwUU9WMkRTNllhaVVROU9PK0I3SUl5?=
 =?utf-8?B?cDhqZm53MTlGSEM0NDZnU1hZdTk1MTEyMlhQbFhvRzVaUUlZWXRJZ1pDSzYv?=
 =?utf-8?B?cEdwT285MHdlWitlR3g2R0FMVitqUjdubjc2YXgzQnVwZEo0Z1ExRVlLV1VT?=
 =?utf-8?B?ekUwUXJSc1ZtRTFvd3JVZ3dOZmxrMTdyYmIxZUZrZWxzNVpmcXBJRUQxZE5B?=
 =?utf-8?B?aTRYdGwwMzJNaUUrY0M3MldTbEFSQkFvYUFUNGZ4ZTc5SkdOL2ZGTUo2STBl?=
 =?utf-8?B?UnJIWThoa2ZVVXNBbFpHRWlZd0FaaXRKUE9WeGRqNU5IbjdCYUFYMTZtZmdo?=
 =?utf-8?B?dlQ0R3pWUmpwM3RxY0daREtoTm1SRDhYTHNOaVdKNHRjSXdiMzhaMWIxMytu?=
 =?utf-8?B?TXo4MW9wN3NZMmRTY25MY2plMXdzazRiSVdDRzBWc2tuNmp3UjBUR0ZtR29Q?=
 =?utf-8?B?NU5CZlkzYUJFdXNxbDlHNWcyVnM1ZWFRSmFrZUFxM2NscncyNkt1QnVNc0ZY?=
 =?utf-8?B?UlYxdCtSWHlOQ1cxdHhuUWdlUkszcWxUQ2ZFYnI4Mk12VU5vQ1JMM1BHUWx4?=
 =?utf-8?B?VlNHc1Q4ZEhMc3JEY2Irek9VdXdzVk9CbmIwaEFoY00vVVA5bmU2NW1ZeW1m?=
 =?utf-8?B?ZEpiaktLQ29BT2VhYlJVM1pOOUZTUDdCSytkNlNGRGQrUm1XZmlma2R3Q21x?=
 =?utf-8?B?UFo4NjVPaElxak8xdld2R0hqSllQNjZIUDk1UjBOSzBTN3B2c2x1M245b0ZY?=
 =?utf-8?B?WnV5bEE5eWs1Rk5MaTJoTzlrRCtjYWhUbURWVUJTa3d3R21VaW1GVzBUY2gw?=
 =?utf-8?B?N1ZVcWJ3THhFUmdsci9LMWsvVmNEemRyd2EvS21pYjVtaG5nakc4Zk9iS2w2?=
 =?utf-8?B?S2NUbzNJR0Z0RW95K1Bla0d0SGhjRFZIajAwQ3ZoOGMvU0F5MHg1bEVZTW8z?=
 =?utf-8?B?dStVY2E3ZFBJeVlvMjhwM3owYmtMWDFLNGhpcnFIQlQ4UXkzNmd0UkdxaDJh?=
 =?utf-8?B?cVFZSmJaUG85VGJrdDltd0tqREx3YjQ5L0dBb2hGVXBnZDkxaFUyM05yWWF3?=
 =?utf-8?B?RzJQemRrUE50d0dBNlpHZmNNY25Ccm01eEoyZXdqSFh0TmNWQXA3eFF6UGli?=
 =?utf-8?B?Wnk1Rk40MldSMW9PSkRkTkc3STI1MmZDbFpheWNBRHJEbWxjQXFCUlV5dlFI?=
 =?utf-8?B?eis2VFJNNGNXOXc4bHBPK2xrRElQZzQ2NmYrb0pwMUpTVWRocCtzczRFRWNX?=
 =?utf-8?B?RzhDY3JEdWtvWHl2cnZ2eGU5RzVmaURqVzFxRy9tWjlKdzhuTGgyR0hFWVdz?=
 =?utf-8?B?M0Z3N2wxeDZidzVrSTlHczRmbmprU0pZaFc1eldDUG83bklQeHZnVTVnQUN2?=
 =?utf-8?B?blE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7596C5B903702049A2859A08808AEB5A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hLUuJW/ByHtEP3ERw0H2Q1OUqsOvoJ7ddioftGV5fdJLxV7OKf0gtvVQMRUsi6/jRJSEEZnuI5upCLVTbBnNS0DkCZ0jGSLlVj+j9fnUGh75grnlU02yOSTDDoIENg9jm8osfH17No+C8+sRe3l+7pGkK/O0bPSypYyD6rBixV3c4pSIozUxBLsNFYml6UDtMW7b09WsrUeMYg93t/mk+5IjyXUix+LxK91ZXtashNk2e1ViCdCz+HVl1N30gEv0fzMBSdpguoKamev4m9Jb6h21D1bmF3bBrQOb7plDS9PDQiLYzlc/X7O0BODI5luJH95cbruajaXKQMkoaAEfwPXMg34uGFZUut/hTfPv3IJAYSLgTx2uOTtKPkslI1wxQxbQZDPeYj/Nh5GbACBQUmWd2JNGMBeAZx9Hlcb5KVOCnrx4zZ1y1tPgWKzhdpLAjQs3DO89L9eb17ZnthQBEF4HiFQeIQfBJkgaTbU2zNJhNdKsw0Ba2Fdhi01ViXVF9qxIqaNuRI3X4MsSCJ6dQEw2hmssnxRV0poXBjSKH7RXBw2xXhrnLhKafQLLxw6dYOFn6/G33YOdbsYMKLGCPp02uYppOQ/drNdGzS+PqBfMT0FTqulZuQASUbckqqGjtLha/Gl0Zj2ta1ECwWMcGDykJ9R7BTTjiQ82KxELZJCAbIGHIG5VvaI3CZBWKtU9aevCYHeTTE3kvoWdYAx0L+WRJV8xCiptlCYyKxLYmtJqYWL5DS1kAzhdQrk9sykY39YiorA9yEsG71F3Ep2qJ95e1oWZHrUDHWoeCwE4Q3YuUSi2W6tdfUGmpUyppCd89lxXNG8dTQFxRP7bXIKtxeb0/J1VApdgDRxigtkz+1Ab2Md7O5XCKokUH8//GM+i
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48acae29-53ec-4d7d-4413-08daefdf911b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 12:14:31.6950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5wuhcADoqDBze5TA6FXCLosO7FAiYnUeIbW3udpoCgE9PPNTi5T3viMHUcNVd8KFzDQb0Mf/sU0C7Bd5kInxiOx3FpgYPdF2Vdk//Y/Oa44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6073

T24gMDYvMDEvMjAyMyA3OjU0IGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDUuMDEuMjAy
MyAyMzoxNywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDA1LzAxLzIwMjMgNzo1NyBhbSwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDQuMDEuMjAyMyAyMDo1NSwgQW5kcmV3IENvb3Bl
ciB3cm90ZToNCj4+Pj4gT24gMDQvMDEvMjAyMyA0OjQwIHBtLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDAzLjAxLjIwMjMgMjE6MDksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4+Pj4g
QSBzcGxpdCBpbiB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UgaXMgb25seSBhcHBsaWNhYmxlIGZvciB4
ODYgUFYgZ3Vlc3RzLg0KPj4+Pj4+IEZ1cnRoZXJtb3JlLCB0aGUgaW5mb3JtYXRpb24gcmV0dXJu
ZWQgZm9yIHg4NiA2NGJpdCBQViBndWVzdHMgaXMgd3JvbmcuDQo+Pj4+Pj4NCj4+Pj4+PiBFeHBs
YWluIHRoZSBwcm9ibGVtIGluIHZlcnNpb24uaCwgc3RhdGluZyB0aGUgb3RoZXIgaW5mb3JtYXRp
b24gdGhhdCBQViBndWVzdHMNCj4+Pj4+PiBuZWVkIHRvIGtub3cuDQo+Pj4+Pj4NCj4+Pj4+PiBG
b3IgNjRiaXQgUFYgZ3Vlc3RzLCBhbmQgYWxsIG5vbi14ODYtUFYgZ3Vlc3RzLCByZXR1cm4gMCwg
d2hpY2ggaXMgc3RyaWN0bHkNCj4+Pj4+PiBsZXNzIHdyb25nIHRoYW4gdGhlIHZhbHVlcyBjdXJy
ZW50bHkgcmV0dXJuZWQuDQo+Pj4+PiBJIGRpc2FncmVlIGZvciB0aGUgNjQtYml0IHBhcnQgb2Yg
dGhpcy4gU2VlaW5nIExpbnV4J2VzIGV4cG9zdXJlIG9mIHRoZQ0KPj4+Pj4gdmFsdWUgaW4gc3lz
ZnMgSSBldmVuIHdvbmRlciB3aGV0aGVyIHdlIGNhbiBjaGFuZ2UgdGhpcyBsaWtlIHlvdSBkbyBm
b3INCj4+Pj4+IEhWTS4gV2hvIGtub3dzIHdoYXQgaXMgYmVpbmcgaW5mZXJyZWQgZnJvbSB0aGUg
dmFsdWUsIGFuZCBieSB3aG9tLg0KPj4+PiBMaW51eCdzIHN5c2ZzIEFCSSBpc24ndCByZWxldmFu
dCB0byB1cyBoZXJlLsKgIFRoZSBzeXNmcyBBQkkgc2F5cyBpdA0KPj4+PiByZXBvcnRzIHdoYXQg
dGhlIGh5cGVydmlzb3IgcHJlc2VudHMsIG5vdCB0aGF0IGl0IHdpbGwgYmUgYSBub256ZXJvIG51
bWJlci4NCj4+PiBJdCBlZmZlY3RpdmVseSByZXBvcnRzIHRoZSBoeXBlcnZpc29yICh2aXJ0dWFs
KSBiYXNlIGFkZHJlc3MgdGhlcmUuIEhvdw0KPj4+IGNhbiB3ZSBub3QgY2FyZSBpZiBzb21ldGhp
bmcgKGtleGVjIHdvdWxkIGNvbWUgdG8gbWluZCkgd291bGQgYmUgdXNpbmcNCj4+PiBpdCBmb3Ig
d2hhdGV2ZXIgcHVycG9zZS4NCj4+IFdoYXQgYWJvdXQga2V4ZWMgZG8geW91IHRoaW5rIHdvdWxk
IGNhcmU/DQo+IEkgZGlkbid0IHRoaW5rIGFib3V0IGFueXRoaW5nIHNwZWNpZmljLCBidXQgSSBj
b3VsZCBzZWUgd2h5IGl0IG1heSB3YW50IHRvDQo+IGtub3cgd2hlcmUgaW4gVkEgc3BhY2UgWGVu
IHNpdHMuDQoNClRoZSBrZXhlYyBpbWFnZSBkb2Vzbid0IHJ1biAidW5kZXIiIFhlbjsgaXQgcmVw
bGFjZXMgWGVuIGluIG1lbW9yeSwgYW5kDQp0cmFuc2l0aW9uIGludG8gdGhlIG5ldyBpbWFnZSBp
cyB2aWEgbm8gcGFnaW5nICgzMmJpdCkgb3IgaWRlbnRpdHkNCnBhZ2luZyAoNjRiaXQpIGluIHRo
ZSByZXNlcnZlZCByZWdpb24uDQoNCldlIGRvbid0IHJlYWxseSBzdXBwb3J0IGtleGVjIGxvYWQg
KGl0J3MgdGhlcmUsIGJ1dCBJIGRvbid0IGV4cGVjdA0KYW55b25lIGhhcyBleGVyY2lzZWQgaXQg
aW4gYW5nZXIpLCBidXQgaWYgd2Ugd2VyZSB0byBsb2FkIGEgbmV3DQpYZW4rZG9tMCwgdGhlbiBr
ZXhlYy10b29scyBzdGlsbCBoYXMgbm90aGluZyByZWxldmFudCB0byBkbyB3aXRoDQpuZXctWGVu
K2RvbTAncyBzcGxpdC4NCg0KPj4+Pj4+ICsgKiBGb3IgYWxsIGd1ZXN0IHR5cGVzIHVzaW5nIGhh
cmR3YXJlIHZpcnQgZXh0ZW50aW9ucywgWGVuIGlzIG5vdCBtYXBwZWQgaW50bw0KPj4+Pj4+ICsg
KiB0aGUgZ3Vlc3Qga2VybmVsIHZpcnR1YWwgYWRkcmVzcyBzcGFjZS4gIFRoaXMgbm93IHJldHVy
biAwLCB3aGVyZSBpdA0KPj4+Pj4+ICsgKiBwcmV2aW91c2x5IHJldHVybmVkIHVucmVsYXRlZCBk
YXRhLg0KPj4+Pj4+ICsgKi8NCj4+Pj4+PiAgI2RlZmluZSBYRU5WRVJfcGxhdGZvcm1fcGFyYW1l
dGVycyA1DQo+Pj4+Pj4gIHN0cnVjdCB4ZW5fcGxhdGZvcm1fcGFyYW1ldGVycyB7DQo+Pj4+Pj4g
ICAgICB4ZW5fdWxvbmdfdCB2aXJ0X3N0YXJ0Ow0KPj4+Pj4gLi4uIHRoZSBmaWVsZCBuYW1lIHRl
bGxzIG1lIHRoYXQgYWxsIHRoYXQgaXMgYmVpbmcgY29udmV5ZWQgaXMgdGhlIHZpcnR1YWwNCj4+
Pj4+IGFkZHJlc3Mgb2Ygd2hlcmUgdGhlIGh5cGVydmlzb3IgYXJlYSBzdGFydHMuDQo+Pj4+IElN
TywgaXQgZG9lc24ndCBtYXR0ZXIgd2hhdCB0aGUgbmFtZSBvZiB0aGUgZmllbGQgaXMuwqAgSXQg
ZGF0ZXMgZnJvbSB0aGUNCj4+Pj4gZGF5cyB3aGVuIDMyYml0IFBWIHdhcyB0aGUgb25seSB0eXBl
IG9mIGd1ZXN0Lg0KPj4+Pg0KPj4+PiAzMmJpdCBQViBndWVzdHMgcmVhbGx5IGRvIGhhdmUgYSB2
YXJpYWJsZSBzcGxpdCwgc28gdGhlIGd1ZXN0IGtlcm5lbA0KPj4+PiByZWFsbHkgZG9lcyBuZWVk
IHRvIGdldCB0aGlzIHZhbHVlIGZyb20gWGVuLg0KPj4+Pg0KPj4+PiBUaGUgc3BsaXQgZm9yIDY0
Yml0IFBWIGd1ZXN0cyBpcyBjb21waWxlLXRpbWUgY29uc3RhbnQsIGhlbmNlIHdoeSA2NGJpdA0K
Pj4+PiBQViBrZXJuZWxzIGRvbid0IGNhcmUuDQo+Pj4gLi4uIG9uY2Ugd2UgZ2V0IHRvIHJ1biBY
ZW4gaW4gNS1sZXZlbCBtb2RlLCA0LWxldmVsIFBWIGd1ZXN0cyBjb3VsZCBhbHNvDQo+Pj4gZ2Fp
biBhIHZhcmlhYmxlIHNwbGl0OiBMaWtlIGZvciAzMi1iaXQgZ3Vlc3RzIG5vdywgb25seSB0aGUg
ci9vIE0yUCB3b3VsZA0KPj4+IG5lZWQgdG8gbGl2ZSBpbiB0aGF0IGFyZWEsIGFuZCB0aGlzIG1h
eSB3ZWxsIG9jY3VweSBsZXNzIHRoYW4gdGhlIGZ1bGwNCj4+PiByYW5nZSBwcmVzZW50bHkgcmVz
ZXJ2ZWQgZm9yIHRoZSBoeXBlcnZpc29yLg0KPj4gLi4uIHlvdSBjYW4ndCBkbyB0aGlzLCBiZWNh
dXNlIGl0IG9ubHkgd29ya3MgZm9yIGd1ZXN0cyB3aGljaCBoYXZlDQo+PiBjaG9zZW4gdG8gZmlu
ZCB0aGUgTTJQIHVzaW5nIFhFTk1FTV9tYWNocGh5c19tYXBwaW5nIChlLmcuIExpbnV4KSwgYW5k
DQo+PiBkb2Vzbid0IGZvciBlLmcuIE1pbmlPUyB3aGljaCBkb2VzOg0KPj4NCj4+ICNkZWZpbmUg
bWFjaGluZV90b19waHlzX21hcHBpbmcgKCh1bnNpZ25lZCBsb25nICopSFlQRVJWSVNPUl9WSVJU
X1NUQVJUKQ0KPiBIbW0sIGxvb2tzIGxpa2UgYSBtaXN1bmRlcnN0YW5kaW5nPyBJIGNlcnRhaW5s
eSB3YXNuJ3QgdGhpbmtpbmcgYWJvdXQNCj4gbWFraW5nIHRoZSBzdGFydCBvZiB0aGF0IHJlZ2lv
biB2YXJpYWJsZSwgYnV0IHJhdGhlciB0aGUgZW5kIChpLmUuIG5vdA0KPiBleGFjdGx5IGxpa2Ug
Zm9yIDMyLWJpdCBjb21wYXQpLg0KDQpCdXQgZm9yIHdoYXQgcHVycG9zZT/CoCBZb3UgY2FuJ3Qg
bWFrZSA0LWxldmVsIGd1ZXN0cyBoYXZlIGEgdmFyaWFibGUgcmFuZ2UuDQoNClRoZSBiZXN0IHlv
dSBjYW4gZG8gaXMgbWFrZSBhIDUtbGV2ZWwtYXdhcmUgZ3Vlc3QgcnVubmluZyBvbiA0LWxldmVs
IFhlbg0KaGF2ZSBzb21lIG5ldyBzZW1hbnRpY3MsIGJ1dCBhIDQtbGV2ZWwgUFYgZ3Vlc3QgYWxy
ZWFkeSBvd25zIHRoZQ0Kb3ZlcndoZWxtaW5nIG1ham9yaXR5IG9mIHZpcnR1YWwgYWRkcmVzcyBz
cGFjZSwgc28gYmVpbmcgYWJsZSB0byBoYW5kDQpiYWNrIGEgZmV3IGV4dHJhIFRCIGlzIG5vdCBp
bnRlcmVzdGluZy7CoCBBbmQgZm9yIG1ha2luZyB0aGF0IGhhcHBlbi4uLg0KDQo+Pj4+IEZvciBj
b21wYXQgSFZNLCBpdCBoYXBwZW5zIHRvIHBpY2sgdXAgdGhlIC0xIGZyb206DQo+Pj4+DQo+Pj4+
ICNpZmRlZiBDT05GSUdfUFYzMg0KPj4+PiDCoMKgwqAgSFlQRVJWSVNPUl9DT01QQVRfVklSVF9T
VEFSVChkKSA9DQo+Pj4+IMKgwqDCoMKgwqDCoMKgIGlzX3B2X2RvbWFpbihkKSA/IF9fSFlQRVJW
SVNPUl9DT01QQVRfVklSVF9TVEFSVCA6IH4wdTsNCj4+Pj4gI2VuZGlmDQo+Pj4+DQo+Pj4+IGlu
IGFyY2hfZG9tYWluX2NyZWF0ZSgpLCB3aGVyZWFzIGZvciBub24tY29tcGF0IEhWTSwgaXQgZ2V0
cyBhIG51bWJlciBpbg0KPj4+PiBhbiBhZGRyZXNzIHNwYWNlIGl0IGhhcyBubyBjb25uZWN0aW9u
IHRvIGluIHRoZSBzbGlnaHRlc3QuwqAgQVJNIGd1ZXN0cw0KPj4+PiBlbmQgdXAgZ2V0dGluZyBY
RU5fVklSVF9TVEFSVCAoPT0gMk0pIGhhbmRlZCBiYWNrLCBidXQgdGhpcyBhYnNvbHV0ZWx5DQo+
Pj4+IGFuIGludGVybmFsIGRldGFpbCB0aGF0IGd1ZXN0cyBoYXZlIG5vIGJ1c2luZXNzIGtub3dp
bmcuDQo+Pj4gV2VsbCwgb2theSwgdGhpcyBsb29rcyB0byBiZSBnb29kIGVub3VnaCBhbiBhcmd1
bWVudCB0byBtYWtlIHRoZSBhZGp1c3RtZW50DQo+Pj4geW91IHByb3Bvc2UgZm9yICFQViBndWVz
dHMuDQo+PiBSaWdodCwgSFZNIChvbiBhbGwgYXJjaGl0ZWN0dXJlcykgaXMgdmVyeSBjdXQgYW5k
IGRyeS4NCj4+DQo+PiBCdXQgaXQgZmVlbHMgd3JvbmcgdG8gbm90IGFkZHJlc3MgdGhlIFBWNjQg
aXNzdWUgYXQgdGhlIHNhbWUgdGltZQ0KPj4gYmVjYXVzZSBpdCBpcyBzaW1pbGFyIGxldmVsIG9m
IGJyb2tlbiwgZGVzcGl0ZSB0aGVyZSBiZWluZyAoaW4gdGhlb3J5KSBhDQo+PiBsZWdpdGltYXRl
IG5lZWQgZm9yIGEgUFYgZ3Vlc3Qga2VybmVsIHRvIGtub3cgaXQuDQo+IFRvIG1lIGl0IGZlZWxz
IHdyb25nIHRvIGFkZHJlc3MgdGhlIDY0LWJpdCBQViBpc3N1ZSBieSByZW1vdmluZyBpbmZvcm1h
dGlvbiwNCj4gd2hlbiAtIGFzIHlvdSBhbHNvIHNheSAtIGl0IGlzIGFjdHVhbGx5IF9taXNzaW5n
XyBpbmZvcm1hdGlvbi4gVG8gbWUgdGhlDQo+IHByb3BlciBjb3Vyc2Ugb2YgYWN0aW9uIHdvdWxk
IGJlIHRvIGV4cG9zZSB0aGUgdXBwZXIgYm91bmQgYXMgd2VsbCAoc3VjaA0KPiB0aGF0LCBkb3du
IHRoZSByb2FkLCBpdCBjb3VsZCBiZWNvbWUgZHluYW1pYykuIFRoZXJlJ3MgYWxzbyBubyBpbmZv
IGxlYWsNCj4gdGhlcmUsIGFzIHRoZSB0d28gKHN0YXRpYykgYm91bmRzIGFyZSBwYXJ0IG9mIHRo
ZSBQViBBQkkgYW55d2F5Lg0KDQouLi4gdGhlIGFic29sdXRlIGJlc3QgeW91IGNvdWxkIGRvIGhl
cmUgaXMgaW50cm9kdWNlIGEgbmV3DQpYRU5WRVJfcGxhdGZvcm1fcGFyYW1ldGVyczIgdGhhdCBo
YXMgYSBkaWZmZXJlbnQgc3RydWN0dXJlLg0KDQpXaGljaCBzdGlsbCBsZWF2ZXMgdXMgd2l0aCBY
RU5WRVJfcGxhdGZvcm1fcGFyYW1ldGVycyBwcm92aWRpbmcgZGF0YQ0Kd2hpY2ggaXMgc29tZXdo
ZXJlIGJldHdlZW4gdXNlbGVzcyBhbmQgYWN0aXZlbHkgdW5oZWxwZnVsLg0KDQp+QW5kcmV3DQo=

