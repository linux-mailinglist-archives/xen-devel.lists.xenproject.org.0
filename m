Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5734165E8E2
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 11:22:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471792.731791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDNNX-0002OE-KY; Thu, 05 Jan 2023 10:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471792.731791; Thu, 05 Jan 2023 10:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDNNX-0002LQ-HE; Thu, 05 Jan 2023 10:21:43 +0000
Received: by outflank-mailman (input) for mailman id 471792;
 Thu, 05 Jan 2023 10:21:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+KT=5C=citrix.com=prvs=36272ec6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDNNV-0002LG-TK
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 10:21:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcc3e809-8ce2-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 11:21:40 +0100 (CET)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 05:21:34 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6197.namprd03.prod.outlook.com (2603:10b6:208:30b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 10:21:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 10:21:30 +0000
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
X-Inumbo-ID: bcc3e809-8ce2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672914100;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DJ7lKESvxhuCgrxIskdZvgGuje2QQJAQLZrTbRSZmj0=;
  b=egP0ACbQ52obv5bmSSUTjtvsL7V9sTQdV88RIXAYy7i+gfvlDxc+C7Sb
   ukYHN5NXfEHElb7FkKK4cIqRd0e6JMA0+92Vx2WiO9Je2YdVCTzJPMwy1
   3anVPnzzvgn+D8jK+FTfJXnvuGbEKlaDwwYhxnXvE/TTzY0QXfOD2f6l6
   A=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 90235615
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xtGeWai5AbMFDDzZXrFrQjTTX161QhEKZh0ujC45NGQN5FlHY01je
 htvDz+CPPmJNDP8Lt1/aI61/RwC6MTcn4djQAY4+y88FCgb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6sT5QeDzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ9EXNRVz/ft964+7afYbBc3fU+a9HkadZ3VnFIlVk1DN4AaLWaGuDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEuluGzYbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ReXiraM02QD7Kmo7AzwJCGK6pNaFkBC1atJyd
 Wk+8y8Rov1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+LqRuiNC5TKnUNDRLoViMA6tjn5Y020BTGS486FLbv14OkXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94aRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:89mxbK74RlGpt80qSAPXwNnXdLJyesId70hD6qkXc202TiX4rb
 HMoB1/73TJYVkqOU3I6errBEDtexzhHP1OjbX5X43SOTUO0VHAROxfBODZowEIdReRytJg
X-IronPort-AV: E=Sophos;i="5.96,302,1665460800"; 
   d="scan'208";a="90235615"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJzzvtozj3aUq+4Pk+cLIIasSA97O/2/R3IgWvdvq1Ufn2C6ML3GHgXIj8BcbCIALygBwrfsuUKDqhaptYH3SbPtG8x4LHDK050IQn36XvQDW83ZDVKmODEEbkLddej/Fe0AsMcJj4WYVZs2raTgbl4hhA7tMlDIhx8q+tryF+YgSveOR9FEaYH9IsjxP8n5YrAWbu8o2pbvgf508FQEYlJ521WBa9HuasxHyc9qWndrhkeTUtdwu+Ldt4JfSmUIGTRL6fBb3QxMC+f9xu5IfjyRWA7t4LI1kIMkfMOYDRSCnc4/FoHIeb37yun4zaP1cGCQxRqq5BuBi0gCbrNgGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ7lKESvxhuCgrxIskdZvgGuje2QQJAQLZrTbRSZmj0=;
 b=Up87IpPx6xcrLuRJgyeluOkrpjjxCflQXnpHcvC82y1vu06BTQVbJY1q64x6/OKVJoubEG4c56OXqCZmbfXuvV32NODMztCnErt0Dih/oI0izQU8rW6UxoWh5q2taXgGMdD6WOyGC8HT9hVJuEgp5OLMXVTPFdUnArO/4mdUKN9hxXhjxdJ7698NFHxTY3d3I6g/QncZpxFXjC81NRXP4bPCeqTz3Ec0RKWz7lNJhLqfdcue6dfzEfGqcZqYYYtbBjlvkiqnxeL1Y430kTqmA9wVrxUI5Gz3BNZfYkRJOmdW41VIdEK3tSgtKDmZm/Z60Xh8L5+S+rw8KHIR9PW9rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJ7lKESvxhuCgrxIskdZvgGuje2QQJAQLZrTbRSZmj0=;
 b=T+/zy+FQ9daKcgrEHrdxwNdEmbffnV2buvrwnq7AaXxS4zGty2wrOhCDePuS+KSAPAuYg8/3aT6IOsAbIA63GKuu2NsXV3YONMlgq6/pC3WoT0GHw5B9wHgDS89lYCBoXt+OtO3DUhXOzLMuwoHUD0HszHsROupbWukcj0DjL4A=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH v2] hvmloader: use memory type constants
Thread-Topic: [PATCH v2] hvmloader: use memory type constants
Thread-Index: AQHZIO4xGYPRUU9lrUSG9wpp5EE7mK6PnRcA
Date: Thu, 5 Jan 2023 10:21:30 +0000
Message-ID: <aa0a1e28-42bd-3826-2911-288093ab2a00@citrix.com>
References: <15dd4897-d87b-9a0d-fc99-551a1b4be04d@suse.com>
In-Reply-To: <15dd4897-d87b-9a0d-fc99-551a1b4be04d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BL1PR03MB6197:EE_
x-ms-office365-filtering-correlation-id: 89282547-5ddb-4e9f-8e1f-08daef069ccd
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 M/3qGEZeVA8BrHgCZ9/p5aktFpvMX61Lh+gRO70LiQwj6RvC0jwYp7FcC+aelz0fNoH2j9peoz73gdHVcQskGp79vJNfszQtwUlIbaRt7BmQ0ndXYaiB6gUKXjWqj7cVmz1vBPMNTS6xyxWSWSZhMfiWgIDKt41yGvBZgQEPeEtq2x8cSmCZXQU/gFLokZIuTAqMop2a0pHoToUPIKYtYptBAUolwnW/IFrd0WesOFoBJblDKrt9y7b0x8i1FIRwugKStq4BCqThquctAryx2V3aWWxOeT5dX4eRVHhj4ZZKA8Dl8jrHy6SLTUhnqO9rFdNNVPil8MbDC78f2RtD5vjUwsddpsElN6UOQQKdmQW9LHxi1tXVz1BYs1JABp7Gk3z6gRGP8sPN6ZYdc+oxxHCZ6dLggoNLZrPoAyRwqXCyMYpXJLTk/inyLwp/PxR/dgLjgkYlfM9QrLzRwurDLhuVE+JHGR9eKZeNtA9iwWJ/Bq2r34JsqC08TTb6y1ceDD3xBn7JHIEw9okC6pBlCq/XYdsWnHuTzbYcIeCMF7P1R22OEOFqfnex3O0gQela8ZthKpA7xATALTrvLuOpHEeNHH/29Cdx+1iBpm2vOHfVwBzVnoRP2FeXgtKXcjrgdkMqrw0YEPcMTewZpeD1GsPO0XjVrBCjEeAH3C14g7XErsWh8db8y33wo6Qi+Ef8JOd4oG4TfOdNtvYzC36Sqy56D1faKfww3iaf/hag4rRO+aorcizid/AcFw9FgjAfs4Hxxa84SIl8EssNDEqv/g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199015)(6512007)(26005)(107886003)(6506007)(86362001)(38070700005)(36756003)(558084003)(31696002)(82960400001)(122000001)(2616005)(53546011)(38100700002)(186003)(316002)(4326008)(478600001)(41300700001)(8676002)(2906002)(5660300002)(8936002)(71200400001)(6486002)(31686004)(76116006)(66476007)(66556008)(66946007)(91956017)(54906003)(66446008)(110136005)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bjVhVjA0bXhGWk1IN25lS0QzMmVkUGs5aVNnRlpTN2VucHNlay9MTGhuWklP?=
 =?utf-8?B?U2x0RlgreW9nRVVPb2thV2tBQUswbkJlT2Fta3ZSTTZOeS83TUprZ1NybGF1?=
 =?utf-8?B?cmFTMEFQQmNEaWluWDl2T1ZZRmg5ZE9QVjJmbnlEclM4UDR5OTF2Szk1anor?=
 =?utf-8?B?UVpOVUNJMlVncW9WUDMyRmpSOTJIa211ZzRNb0Vqa2dhcy8yTEFYd3BEVkhr?=
 =?utf-8?B?c0FyTW9DdG1qMWNsd3pReVFPVXdqYm5aSHJ6QVBWcFNzbWtjWnhUdzFUa3Y5?=
 =?utf-8?B?RFBodlFrc0JtV3NnYWIvaGVvcllQR1VSK05uaStya3ErcERkd0pkMExOMllp?=
 =?utf-8?B?Sk82Y1F3T0o1cDhqWjZtNGxBT0U5YWVXNG1OYldRb0RxaHllVmN0RXdmaUdW?=
 =?utf-8?B?RWU4Y2h4eVAwa0N6RmhZQnVKbWpOVDdhZDFqZS9JWGxqRkFITUgvN1hwUkJR?=
 =?utf-8?B?UEJETnZMN3FETkI0NFZtN25wYVlNR1N2YW55cUthYXR6bHZGMmpqUWxWVk5T?=
 =?utf-8?B?a3hpWjNON0wxQWhXM2hyWThVcHF0TFRyaG5lTG1xaXRJd3pTNUlFNmswZ3dn?=
 =?utf-8?B?UktXc0F3NjE0UmdBd0RFUnBKZFJMVW1GZHVOU3dyeUVBdGV1MUQxQitqbWs0?=
 =?utf-8?B?ZGVpbisvcEZ4ckZYblNoVVMrdkdkOHUwTUlZeHRIbWl4WEJvWHRRWnVVMnR5?=
 =?utf-8?B?aFVLdXgvN2JTN1NLN0xPYzh3ajZMS1JqcmVoNXlSZVpRd0FUbHQvUE5uNStC?=
 =?utf-8?B?cFlLQUNOOEI1d241ZEI5dGo2OHI4cHl1M3lSaldxZkg3U0hYSi9qV1FwMXlh?=
 =?utf-8?B?RmY4UzFTckR4b2dGQ2dHTkNhdGJEUS81ZVlrUlVBT0ROUkI3YVM2d1lOcUF2?=
 =?utf-8?B?WFg1SWU4d0E2b3VxZTEwVy8vNEMzN0hBODdVK0p5aDdFYWo1U0dmR0o2MXY5?=
 =?utf-8?B?cHAwcXRlVjFDaVF3bkFXTDRPcVFQMEdxS0JxSHpWQ0c1R0k2L0lZYUNrUXd5?=
 =?utf-8?B?M2tkVXJ2Q0pyQjJZay9oem1QVFJ2THRVMllJczR0SEYvR05FQSs0TGphQXBP?=
 =?utf-8?B?MGljVGxPVUxCMmd6VkJxSlpWTGJsN2tSSW9lb1VFV0pUL2xWK2ZHK2ZYSS9E?=
 =?utf-8?B?cUhRUmNxKzdsMGZlcVVHNW8vWFllQnhBOVl5UlRWNjE1MkJCU2ZacjhIRGZG?=
 =?utf-8?B?VXZRSmVZWFdZT3NFaUZQV2RsR0Z5NWNnWC9VVnZsYTB3cTZXSVNndzYybGxR?=
 =?utf-8?B?Y2FoRTZrajdQVkdQUzlLOG55M2pvVnhGZ05uNFd5RWhoRm1FLzdLdWVZdmdq?=
 =?utf-8?B?NDRCWm95SjBZL0FsRDh3Q282cU1yUVhiSU5BTE9ua2NKTm12aHJhczRKRllT?=
 =?utf-8?B?QkF4YmFnOFNsN3VZNWtEcjkyZVQ3dE9KMld0b0JqanJEN3Q2M3BsS2UzUG82?=
 =?utf-8?B?T3NLd2pPZnlHOE5oOUxwcUpMSm80cmJKZUFzeXZGNEthN2ZjVTZNajlBdmlU?=
 =?utf-8?B?Y1U3dzhjUVBnaWltL083aDZZNi9HdHVudjZMeHIrOVZGNTI4WVZpdkZoUURU?=
 =?utf-8?B?QmpVaXN0Q21HMzZlRUZLVDZQeU9Pa2lHY1B3cWRYUTc1RWNMR3NWNVBnSXkv?=
 =?utf-8?B?RnlRem1IYUxoQlQzQWxiam5NRXA5M3NZVm9YWTlqUFlYaXNXbGUzNTdrY0Rv?=
 =?utf-8?B?SHlqaFYzbDk0SDZ0Qkk4dElFRXdFSkt0WG56dXNpUnliYi9jZmFSaHlTVHU1?=
 =?utf-8?B?VVQ3ZEpBVDNxT1dUQzdEZ3lxbFBkTGtkTW9qZ2hiVFNsOTQ2ZlAzSTh0L1Q2?=
 =?utf-8?B?NktwWUlucG9vVllsZitNR3hTbEJ0QlRVNTNiWXM1TWI5bG9pTThBcFM5V3Z3?=
 =?utf-8?B?QmV3ZlpmQ0lDWExEYTl5T0VUWTlnN1JGVkxFOUxtb1FtY3BKNzB3cHdOWjVN?=
 =?utf-8?B?ZGlQcTQ2RFc3dFo1dUJOMWg2Mi90K1g3L0RJck9XSDZ3TitOL29Pc2IxMzFZ?=
 =?utf-8?B?R1UzQnFwNEtBUWNkcXBhUmdiNy9ialJ4Mys0Mk5QbTIrSHcvYlU2aENwQVpY?=
 =?utf-8?B?aExMbUlOZENVZTQwNmpqdForVjB0bkkvNGV4MllnZjJvMnpMNkZCRnlJZjdS?=
 =?utf-8?Q?4RCNBPykLkuw/aItWHk3O0UZJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F7A3CB5A084FB4EBCDFCA5B88CB1816@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tbEO4sih/91FC8TGg5Wuy+h8pDf2755M3hjm5AawkJCYDigAa2T9Mgra9dQvvKUzSJQNo7IcY2wQuhkTWIkgsDgUsNsIz/TI1qPe0cDoGg//jX9jl+M678GAo+aLcfI4cgqPR9tP7DRtXxM8SruARtv4CpEOpil+9ED0f8XmSriZsA+cvJ4nsIGu7jRtBm2FbjzfQZNnQ4uQI6SJvDfAZLRvbWOQKHfhABJMYH49D3i3TGArSqKe91ekJwpKvJYjQXqv2gGm1NXtHTDf98Fjo+c1yUM0WAjUZRdP6CUaitwMOtN+5lqQM3cyYNUxeTTQHuSPtOoFSTsj8YHQqnBhfrJMDA9eFh6QxadyiqQH/U3js8h9qATb6EZWGrvZKpMxKsykGypZvgf+MWK32mjVbOK92aBI+mQkcziT0P9UaV5WyocCUgFNK4E1VXSbFsK+HrdLPFbgV5tSKF8wN1gWmbRgJK0aG8wfizTt5b+LBDUsA2wLinWZefS/k0RfqkACZRQg0ok+F8NIl08zgcckPhtiI1TzPmgSFdGUtAPGBFw7pmry+aLgv16jwO69HRW0fO65fLVimjqlhXTszW6bdQn/wQJtlmNyQdVbkJ37VLLc9q69DAphWWO2PTVdvrqq0LsmV7dnJLUYVGKlhZ/EVJemcf6J5Nbopmpzjk5xnvMaGW7jqPx7zUd/vZMsdWki6HrlgwEtJhV+lhw0EXNVG6oIWnSOdsbRNB++aayivUxbfq7VkgSMI1ljbFP4wE+PfSY+tGGxId7QBBpAUpMtnHroC9haZlZrYvMrbfJLKBKCDXACxOjTB1zng1FtqoUQ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89282547-5ddb-4e9f-8e1f-08daef069ccd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 10:21:30.5749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: okECWCMB6zLzoEvPQZVpeBL+tim3P7SCl9ZOW77NsN195i/X7EDjBEYh1yIPv/Z8J+pxOYdaIRdrtFXvqyx5UwIhOEYfbHbAHIiBvkqaUT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6197

T24gMDUvMDEvMjAyMyAxMDoxMiBhbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE5vdyB0aGF0IHdl
IGhhdmUgdGhlbSBhdmFpbGFibGUgaW4gYSBoZWFkZXIgd2hpY2ggaXMgb2theSB0byB1c2UgZnJv
bQ0KPiBodm1sb2FkZXIgc291cmNlcywgZG8gYXdheSB3aXRoIHJlc3BlY3RpdmUgbGl0ZXJhbCBu
dW1iZXJzIGFuZCBzaWxlbnQNCj4gYXNzdW1wdGlvbnMuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXJAY2l0cml4LmNvbT4NCg==

