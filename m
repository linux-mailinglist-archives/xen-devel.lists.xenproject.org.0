Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C9465F535
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 21:29:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472143.732285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDWqq-00044c-Ca; Thu, 05 Jan 2023 20:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472143.732285; Thu, 05 Jan 2023 20:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDWqq-00042u-9j; Thu, 05 Jan 2023 20:28:36 +0000
Received: by outflank-mailman (input) for mailman id 472143;
 Thu, 05 Jan 2023 20:28:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+KT=5C=citrix.com=prvs=36272ec6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDWqp-00042k-5p
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 20:28:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 840dda3e-8d37-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 21:28:31 +0100 (CET)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 15:28:28 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5017.namprd03.prod.outlook.com (2603:10b6:5:1ee::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 20:28:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 20:28:26 +0000
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
X-Inumbo-ID: 840dda3e-8d37-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672950511;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3Brf3BTM2yp64T+Ybhf1eDYGhFqzzLxM11WSv72X/XE=;
  b=C29z4icAFt4RTKpOy3XWziCRFHb4lvUMyg5Nnmh0ggJQCAlLSaPGupvi
   rzy508nhpL9lG1heYFS0KC5LNEhzhtmt9p9Xz42dnkUsI6mnccToNTgGZ
   JZOJGfahQMPzFZhZeME9/oaTMdVF/cjZP4LK0JjaNB5+kwuKYjRztSf5Q
   8=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 91377134
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5HYGcq5l0/+SaxhwbLzycQxRtM/GchMFZxGqfqrLsTDasY5as4F+v
 mpKWDjXP/aMMGDzfN9zOYS/oRgAu8fUm9RkGQY5rHoxHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZlPakT4QeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 OIfdyImPkG6q+e0xI7kYcV9xdshFZy+VG8fkikIITDxK98DGMiGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUooiOiF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNLT+Lnr6U26LGV7nVMV0EuUl2endeegEejBMluB
 GEM/DV7+MDe82TuFLERRSaQrHOBvzYdXcRRCOww7AyRyqvS7B2dD2JCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BWoLfyoNVwYGy9jlvoAojxjLQ8pjEai6ldn8E3f7x
 DXihCo0iqgXjMUL/76m5l2BiDWpzrDWSiYl6wORWXiqhitlZYuNd4Gur1/B4p59wJ2xS1CAu
 D0BhJKY5eVXVZWVznXVEKMKAa2j4OuDPHvEm1lzEpI99jOrvXm+YYRX5zI4L0BsWioZRQLUj
 IbokVs5zPdu0LGCNMebv6rZ5xwW8JXd
IronPort-HdrOrdr: A9a23:QsKeJKrVWbObZ5vgS29hFPYaV5r/eYIsimQD101hICG9E/bo8v
 xG+c536faaslkssR0b9+xoQZPwJU80rKQFhrX5Xo3SPjUO2lHFEGgK1+KLqQEIfReeygc078
 xdmsNFeb7N5DZB7foTNGGDYq8dKMbuytHWuQ/Op00dKz2Ddclbnn9E4wygYzFLrFQvP+tDKH
 KFjvA33QZJYhwsH7mGOkU=
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="91377134"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LD/UWG8VzebcNoOk7SPqsCyl+nTffsHe8QpB0Vuq2oTcY/Jq749FfNPvAYGio2m9sdwfKBXBOKi71WmQcACKrougWzjdpo+I8WJdzKayjQGGS9gS+Cn2B6UsQevoyTNVKp3Yn9bEQi5MduNMMaqdX0AreZYW7XXk9LeUpQG3qwSXHjz4LQslK+eeyZHfBl/ZMDl7ZzCQkprG1YDEgpYvclsiPXK2bvBozSeD9Ld4CmiHuK6S7GQQZHlaYWh2NLl9fREL3lmac8JQ0e0BifY1nQ5VSBVKj1RzIqe6D2ZMdlhDteZzT8jCa7B8KmGN5uAXVSXmoSyTQlJ2DU5vsFSzMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Brf3BTM2yp64T+Ybhf1eDYGhFqzzLxM11WSv72X/XE=;
 b=KNJFVuf0RS0te31QSxcj6gXnmvAEAR7vBY/UDYkAwT4yI4Ntib8i4aCtiRB+0+TBGzzS2w9aHSJwC2nuLZcQ59qI9oakcJcUYTTA1WH5dDMU5ZeUSykp9JSasvh+uYiTaFN8+ccKSbn30DWuQuSpvMvtSIYso4AGsWBS/fIbss2jtmN3K8bRMv4klPyUhywwctqSDLO8rhDPa/Xcyw2TZnlduifW6kJJk734f8HSzYHf+0APDppEIwqrLhHiHR9Gi4SWFA/PPPvTBf8rqFQUkNMUkvBgZUmdAxEX/wrZkWDwzABJcaRA1Ir4L78bY6dg5WD4jY3f1HbRMuM1/CJmMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Brf3BTM2yp64T+Ybhf1eDYGhFqzzLxM11WSv72X/XE=;
 b=eH1S7z7xP+vxHazu+YSZBp5p87svwqSJUHwu8IdRT0hxOo2WRH4AXNpMAYx8YklI1xYIwrY78TVeWWT7o5sTniXp610refqRxIEKGuoxlLyNCwubv4dws3wTzwVwwdkOkBCcyuO2GHhnJNevfB7KkURHxj35X7n1l9O7XcQJN7E=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau
 Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Tim (Xen.org)"
	<tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v6 4/5] x86/mm: Reject invalid cacheability in PV guests
 by default
Thread-Topic: [PATCH v6 4/5] x86/mm: Reject invalid cacheability in PV guests
 by default
Thread-Index: AQHZFlU8BnV2WctoSkOEZs7zNTRXG66QW9uA
Date: Thu, 5 Jan 2023 20:28:26 +0000
Message-ID: <c6223295-c4f9-8fa8-7635-80d48094190f@citrix.com>
References: <cover.1671744225.git.demi@invisiblethingslab.com>
 <2236399f561d348937f2ff7777fe47ad4236dbda.1671744225.git.demi@invisiblethingslab.com>
In-Reply-To:
 <2236399f561d348937f2ff7777fe47ad4236dbda.1671744225.git.demi@invisiblethingslab.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM6PR03MB5017:EE_
x-ms-office365-filtering-correlation-id: dd9dce96-99f8-4f8d-5f19-08daef5b6626
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 gkqglxggRT2enXx90sWB8lBtZs1iUl3miOz8EfUdtJMGNXj00h6C4cfcta1CMGsfDeSDRZ87QAQuHNXnWqATV226+rUoP5Q55+wRVbWkrL/N+rl9Q+4uN5Wpr9+3sq8PFU4+YtEp6wuGxLo2oqnv9sRvVFkcQvvRaDgWp7j6WodaBqjQEQumDwUMaYWowajZj7W8K2sgSUlDHYUtnE06gpqCVhEnI1tYOys9ReVREfSwHsJx3RsoWSE/qkk60fAPs47Zxp5bpZjH8MjmEWxIP6nBUTAfT0jwaL1Lk9hoIlPNbV7BqzVK9Sqg9XpTR18v+JDQFVWMFcfSji24zkTTBWUfBzoozsiLMmH3Op4LoDiRnxIeP+MBj+NtWVAlbP3JPIYGh+M+FioEbTH4XvIaFlzbSVJ2JQQtYRz/KjGChfwKV85igY0hbPUMjBktnMNkrmqE2NGaLhalDwVCPuI+9ArqmPv4LU+bkG5QmMT3Q8c+3ymJPlLLhBWeLBXHOu1SmT3QK5Sn8j3SSfF2UXBR1Dvgiw+ebmPQr7GA83sjI6Mk508fCq1iJgjwHpHkFL3hPf0/srdYgrOt42z3LFDHqFnOiJ+ut3bWLhCAMpEov2FKVS/ma6yZ/FAE92JFLXObhmGEhrX56P0ByjfRb+0LUrKqd5UmsbFN+IzyAAlwnICBW96OYfn1FgwBM3PDzAp1a/Pa+B7XNGttB/Tf5XPTCOdQKQd4dwPv4ILMW5aQxFnx9MOkHqAiCN4EqRrv7PyvjPVukMYL+Bj1ZzhdxrQ07A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199015)(2906002)(5660300002)(71200400001)(8936002)(41300700001)(478600001)(4326008)(316002)(8676002)(66556008)(76116006)(66476007)(64756008)(66446008)(110136005)(66946007)(91956017)(54906003)(31686004)(6486002)(26005)(6512007)(107886003)(6506007)(83380400001)(2616005)(122000001)(53546011)(38100700002)(186003)(82960400001)(86362001)(38070700005)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmZxOTNnYWZMTWhjSFUwN3dHejVja1I4RzM5V2QwUmNoNit5Z3BVSHFvcncz?=
 =?utf-8?B?UDcrYVJqcEpwT0JvVTFOby9ZSnp2ampIbW1KZ3RZaUwzWVRucUN3VVp0b0Ex?=
 =?utf-8?B?WkZkc0pGd1lzcStBTCs5NzBDZDhHZEFnZG1URGNUNFowR09hUmR3MjR6Q2FO?=
 =?utf-8?B?MnJRWUlXbm4yaHFlZUtCS1hGWktNSkg1SlNzQzJDTnprQXE2WGR0ODRPWGpS?=
 =?utf-8?B?TC9ZZGdhaHUzMU5QSUUrMWNqUkljUEJrYXdhVXMxV3pzU1RpRjI4ZHUwVnIx?=
 =?utf-8?B?L0N3R3ZiRkUwbmoza2xxMFgrcDcvWVRDL01yRTZvNVFVeGY4dXcwMW5va3BV?=
 =?utf-8?B?T2xBOWd6NFFHVzFXRkIxRXN4dTRJWlVwb3R6NzhYc25RMC9XTkUzeEsvekc4?=
 =?utf-8?B?S0FnVndrYmp1SlpLWEN5TTNKWHdRWUlCSXJhclNHV1QySjM0TTJEdDU2eUh4?=
 =?utf-8?B?TzRweDF1cG9ENmk4SHFYTER3N3dqZXJDdzg4QzJPSHpWZVg3aGp2bk0wQTJI?=
 =?utf-8?B?SXk1Zk00c0h3WDE2NVRzbWpuZ2NyUUJqbjE0NkYvR1JoYXNMbEVXYUhuWHdw?=
 =?utf-8?B?OWhqbGthWDdEcXpZcGE1eG9oSTJ1VWVxc2Z2M0dUdlFuNmViaEM2KzdjWEtV?=
 =?utf-8?B?WDZxaTV5NDBBR2tGQVlnaGlHLyszMTA3dXZpVzVoY0plSWdIOVFma3BiN2pH?=
 =?utf-8?B?ZDdZSm9DQUtLeUtxbTVjRDdzSzRYS2NvQ3hrTnB3bWt2MHdHTjQyT3N1aFZm?=
 =?utf-8?B?Q3kzd1Q3U1FYVWRwVnhValV5blZxaU5NL0FGUTJuellaTG9JbzdrVGxnS1lM?=
 =?utf-8?B?OEF5UHJJTmpvbUN4VXE4a1hWZFd6OG4wekV4WUhwZHdNS3IyeWo5aENnSld2?=
 =?utf-8?B?a3MxdFFJSW1wUUN3NEMzYmt4Tk50Y2puQWw4d3c0alJUalM4YmtDakZMODlH?=
 =?utf-8?B?cmVOejlRUVpIb09yTUZTVEQ0S1NTY2pJSW1wYXl5YWNpRG95ZmpvVm14OWt5?=
 =?utf-8?B?OEZWZHRmL29qbm56K0RnSjRLdnBDZXJHRXdsMHlwcUF5WUVWamhoME05MGpi?=
 =?utf-8?B?bUUxSElWV3JJajB3ZFNrZDN6WU5vNFAvZHFwTXI1Y3Y2VWVFTnZ3dmtyZ0Qx?=
 =?utf-8?B?NHJKTUQ3RDZQZEpQTk45YzltdmlydDZ6ejNkZGcveEVxQWRVVko2VzJKUFdS?=
 =?utf-8?B?bllUQWNoOXkyMVhhaXZGRWV1R21mNmN6dW8vblNneUp2a1ZlNDVwVG14VGl0?=
 =?utf-8?B?cGRzUFBTSFhQN28xQjJ0UXhpRFNOV0UraFU1OWdVUHVoN1piV01wYVlIbWti?=
 =?utf-8?B?VXNWVDNITlBEU0VZVysrN3I3WXduamppa1dYQUYzMTIzNnVWQnd2NmwreFBP?=
 =?utf-8?B?RzdxS0poR0dxZzljOSsyVnIxNkFjRExnZXU0MXhUaVdjZjR3R1l4N05sMFR5?=
 =?utf-8?B?clFoa2x4V1A0SnNldHRXMmdtZnJHRUNmczE4UGFYQmI4WHNUMVphTFJzbitB?=
 =?utf-8?B?SHpQNFF2L2xISm91UEdjQWV5VTgvN1pPSEljRk1kZGVudFZJek4wQnpMZm5H?=
 =?utf-8?B?QWx6bkx5d3Z3NTJFUVR3dFBsSDRFYnFubzBqTVV5Yml0T3BMUkMwQWdIQUtu?=
 =?utf-8?B?a0c2RllqZnhIT3V6NGMwUzRlL0s2dnhjYS8vM1hFeGxUUTY3SVVOUG8zY1Mz?=
 =?utf-8?B?aDZQS2g2YVlWbm1wZGxDMVdTQnFGU0NCS0F5SUxQeTFDQ0VUUkdVbTBsMlRO?=
 =?utf-8?B?T3cvcjZpaE93dWNoaVBRTFFUQjh2ZHVjSlV1UnlTRFdvNGdra0RoUWVqVzBi?=
 =?utf-8?B?RWFzZDZGQzQwbUozcGVuQ01tTFlXdzNUU01ZYnNqVE9xeVRGbmlJUkorWEM4?=
 =?utf-8?B?K08zanV6RkVUbnZtV09kdzBjQmtHSXpYUTZmV1Z4Sy9DZ0pIU2tVWi9meEFN?=
 =?utf-8?B?VWRhay81OU42czYwc0k0M0JzODNyK3pFMmhxVklRa1Y3M2t4TXBHU0piQTVn?=
 =?utf-8?B?ZTkxQ3E1L1RtQi84eGFYaGt1eUpFK3ZnZTNWMVdsVWdtR3FSSEc5WnNiT2VT?=
 =?utf-8?B?eDRzeWFPOFNySjdxT1l0TzlJVjN2VU5HcjF2bWw4ODZ5WU04RU44c2Y5dFlk?=
 =?utf-8?B?ME9yYjlBQjh3T1ZFeEVwdXhkY3NpdUpMd1JPNDc1bnd6R1hvVE5QcW9PMDlq?=
 =?utf-8?B?YXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9289119F77DBB54D877676899D7893FB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?dkdiSCtTM3A2YzZHZnZsU3haU2FlN2hGTHZYM0FZZnpieE5nQzJkRStGaGdv?=
 =?utf-8?B?ekFBZ3R0cE9QSGpSYWhWUkRFcDZENGF1Ti9LOUk2SmZOd0pRcGVtK0xzTzRB?=
 =?utf-8?B?OWtHQVRhbEtzZzJaNUdpYW42Y1c5YTZneVRFRGdYalJnL2c4Y2JjMWpCTGEv?=
 =?utf-8?B?VkZ2ZFNHOGhUNzYrMTliSDFOL3diMHBtZzc1ZXJMaFhvN0N4Tjlzckd1ajNm?=
 =?utf-8?B?bVdoaXhUWW12Rm95OTA5N3lHOUdWcCtsRTZPTlN0Tkhtc2ZzdGVMTmpqQk1j?=
 =?utf-8?B?dHlWZ1MrbFZIY0w2WTRtWDBMNnpQMnRPbXpXRElqcWo2eXM4VjZaVXZyMVZ3?=
 =?utf-8?B?SmhMeVU3SzBNOTdNTzc3UVNaZ21DeGlDaE1FaHZzZkFTWWQ4VWUrL3oxN2Y2?=
 =?utf-8?B?azV6Vk1SZ2FUZWdodEpSeGNYcjRTaCthWjMwMUl3Z3MzMnBPVlNkbnZEY2hq?=
 =?utf-8?B?TGdIVTM4dWRpeFJtYUR2d1daeHJkZk9nem52TzhWelB1QnZQeGNsZS9QUjNL?=
 =?utf-8?B?UkcvcTVVMDVSL2YvV1lvdXBiOWxhUkx0MjhKVDZ6cVBIN1hIdkhNczRwNEhr?=
 =?utf-8?B?djhoSENsY1Racm5jSUVPeFFRNlEyQXpGQVlJS0tzUDRBZlRXTW9hczlOVWN4?=
 =?utf-8?B?RzJ2YUlydmxTOTVFZ1BpMHo5anoveDMwcy9LVGFtQ1NKUVlhZXVJNnA3R1Rh?=
 =?utf-8?B?eFlzQmhMdkxJc3NLeURaMUtEamt0QmppaFpwOEhVNVlHay9iTVVqdnBCQ0pK?=
 =?utf-8?B?aGg0eUdTNHVOaWRZS0REZDhLNVFpUXgvcWFMUVd4TmFRTzJ3R3B0WG1XUG45?=
 =?utf-8?B?TXNES2huaThPTkpvalVJTVhJNm1YS0M0RE9KWktZOFRtWmJpV2szbDdvTGRy?=
 =?utf-8?B?cStoN1I1MzFUSFc3czlLTGl2WEIyaUgyREUxYnhkbXk1R1RSUkNsdnFXS1lH?=
 =?utf-8?B?ZFVxYldndUtvRXZuVW83VTFRbHJuSFErUThRWHlUb2tGSUJjT3kxVThseG9I?=
 =?utf-8?B?OVc1dGJOb1BsTy94cjcvMzg4S0lqMHpKQVJUc2ZhRVdLczE0S2pxNnFVVHJm?=
 =?utf-8?B?L2gyajdsdlRzYnNNYllQRCsxZFBNNE01b281VDdtY2tOSG02Smp5a0dQY08z?=
 =?utf-8?B?RUZUUjBpeVh4OTFkNTlwZXJNWDlHSDlwUGZQQ055bmlvMEpJUDhhRzQ0TGxZ?=
 =?utf-8?B?Zzd5Vlp5ekQ1KzRBRkZaTEFkM3p1S1E0dlVURS85UExySlVCNHZUSFpzRUpW?=
 =?utf-8?B?TkFVdENkcm04UWdvZmE4dmkyK0NtY1FCZzVWaVU4UHE2cmpVdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd9dce96-99f8-4f8d-5f19-08daef5b6626
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 20:28:26.0574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0BhOetJbSr8p7P6Kv2FiLPk+Uzn/rS+SKXJmri1WLrROMwoueQIYVgK/nZI8ztKLKJzL3Ekj1w8wXZdMVav22ByMA7Vm8bCBSLFOrDjBSjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5017

T24gMjIvMTIvMjAyMiAxMDozMSBwbSwgRGVtaSBNYXJpZSBPYmVub3VyIHdyb3RlOg0KPiBkaWZm
IC0tZ2l0IGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jIGIvZG9jcy9taXNjL3hl
bi1jb21tYW5kLWxpbmUucGFuZG9jDQo+IGluZGV4IDQyNGIxMmNmYjI3ZDZhZGUyZWM2M2VhY2I4
YWZlNWRmODI0NjU0NTEuLjAyMzBhN2JjMTdjYmQ0MzYyYTQyZWE2NGNlYTY5NWYzMWY1ZTBmODYg
MTAwNjQ0DQo+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYw0KPiArKysg
Yi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MNCj4gQEAgLTE0MTcsNiArMTQxNywx
NyBAQCBkZXRlY3Rpb24gb2Ygc3lzdGVtcyBrbm93biB0byBtaXNiZWhhdmUgdXBvbiBhY2Nlc3Nl
cyB0byB0aGF0IHBvcnQuDQo+ICAjIyMgaWRsZV9sYXRlbmN5X2ZhY3RvciAoeDg2KQ0KPiAgPiBg
PSA8aW50ZWdlcj5gDQo+ICANCj4gKyMjIyBpbnZhbGlkLWNhY2hlYWJpbGl0eSAoeDg2KQ0KPiAr
PiBgPSBhbGxvdyB8IGRlbnkgfCB0cmFwYA0KPiArDQo+ICs+IERlZmF1bHQ6IGBkZW55YCBpbiBy
ZWxlYXNlIGJ1aWxkcywgb3RoZXJ3aXNlIGB0cmFwYA0KPiArDQo+ICtTcGVjaWZ5IHdoYXQgaGFw
cGVucyB3aGVuIGEgUFYgZ3Vlc3QgdHJpZXMgdG8gdXNlIG9uZSBvZiB0aGUgcmVzZXJ2ZWQgZW50
cmllcyBpbg0KPiArdGhlIFBBVC4gIGBkZW55YCBjYXVzZXMgdGhlIGF0dGVtcHQgdG8gYmUgcmVq
ZWN0ZWQgd2l0aCAtRUlOVkFMLCBgYWxsb3dgIGFsbG93cw0KPiArdGhlIGF0dGVtcHQsIGFuZCBg
dHJhcGAgY2F1c2VzIGEgZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0IHRvIGJlIHJhaXNlZC4NCj4g
K0N1cnJlbnRseSwgdGhlIHJlc2VydmVkIGVudHJpZXMgYXJlIG1hcmtlZCBhcyB1bmNhY2hlYWJs
ZSBpbiBYZW4ncyBQQVQsIGJ1dCB0aGlzDQo+ICt3aWxsIGNoYW5nZSBpZiBuZXcgbWVtb3J5IHR5
cGVzIGFyZSBhZGRlZCwgc28gZ3Vlc3RzIG11c3Qgbm90IHJlbHkgb24gaXQuDQo+ICsNCg0KVGhp
cyB3YW50cyB0byBiZSBzY29wZWQgdW5kZXIgInB2IiwgYW5kIG5vdCBhIHRvcC1sZXZlbCBvcHRp
b24uwqAgQ3VycmVudA0KcGFyc2luZyBpcyBhdCB0aGUgdG9wIG9mIHhlbi9hcmNoL3g4Ni9wdi9k
b21haW4uYw0KDQpIb3cgYWJvdXQgYHB2PXtuby19b29iLXBhdGAsIGFuZCBwYXJzZSBpdCBpbnRv
IHRoZSBvcHRfcHZfb29iX3BhdCBib29sZWFuID8NCg0KVGhlcmUgcmVhbGx5IGlzIG5vIG5lZWQg
dG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiBkZW55IGFuZCB0cmFwLsKgIElNTywNCmluamVjdGluZyAj
R1AgdW5pbGF0ZXJhbGx5IGlzIGZpbmUgKHRvIGEgZ3Vlc3QgZXhwZWN0aW5nIHRoZSBoeXBlcmNh
bGwNCnRvIHN1Y2NlZWQsIC1FSU5WQUwgdnMgI0dQIG1ha2VzIG5vIGRpZmZlcmVuY2UsIGJ1dCAj
R1AgaXMgZmFyIG1vcmUNCnVzZWZ1bCB0byBhIGh1bWFuIHRyeWluZyB0byBkZWJ1ZyBpc3N1ZXMg
aGVyZSksIGJ1dCBJIGNvdWxkIGJlIHRhbGtlZA0KaW50byBwdXR0aW5nIHRoYXQgYmVoaW5kIGEg
Q09ORklHX0RFQlVHIGlmIG90aGVyIGZlZWwgc3Ryb25nbHkuDQoNCj4gQEAgLTEzNDMsNyArMTM3
NCwzNCBAQCBzdGF0aWMgaW50IHByb21vdGVfbDFfdGFibGUoc3RydWN0IHBhZ2VfaW5mbyAqcGFn
ZSkNCj4gICAgICAgICAgfQ0KPiAgICAgICAgICBlbHNlDQo+ICAgICAgICAgIHsNCj4gLSAgICAg
ICAgICAgIHN3aXRjaCAoIHJldCA9IGdldF9wYWdlX2Zyb21fbDFlKHBsMWVbaV0sIGQsIGQpICkN
Cj4gKyAgICAgICAgICAgIGwxX3BnZW50cnlfdCBsMWUgPSBwbDFlW2ldOw0KPiArDQo+ICsgICAg
ICAgICAgICBpZiAoIGludmFsaWRfY2FjaGVhYmlsaXR5ICE9IElOVkFMSURfQ0FDSEVBQklMSVRZ
X0FMTE9XICkNCj4gKyAgICAgICAgICAgIHsNCj4gKyAgICAgICAgICAgICAgICBzd2l0Y2ggKCBs
MWUubDEgJiBQQUdFX0NBQ0hFX0FUVFJTICkNCj4gKyAgICAgICAgICAgICAgICB7DQo+ICsgICAg
ICAgICAgICAgICAgY2FzZSBfUEFHRV9XQjoNCj4gKyAgICAgICAgICAgICAgICBjYXNlIF9QQUdF
X1VDOg0KPiArICAgICAgICAgICAgICAgIGNhc2UgX1BBR0VfVUNNOg0KPiArICAgICAgICAgICAg
ICAgIGNhc2UgX1BBR0VfV0M6DQo+ICsgICAgICAgICAgICAgICAgY2FzZSBfUEFHRV9XVDoNCj4g
KyAgICAgICAgICAgICAgICBjYXNlIF9QQUdFX1dQOg0KPiArICAgICAgICAgICAgICAgICAgICBi
cmVhazsNCj4gKyAgICAgICAgICAgICAgICBkZWZhdWx0Og0KPiArICAgICAgICAgICAgICAgICAg
ICAvKg0KPiArICAgICAgICAgICAgICAgICAgICAgKiBJZiB3ZSBnZXQgaGVyZSwgYSBQViBndWVz
dCB0cmllZCB0byB1c2Ugb25lIG9mIHRoZQ0KPiArICAgICAgICAgICAgICAgICAgICAgKiByZXNl
cnZlZCB2YWx1ZXMgaW4gWGVuJ3MgUEFULiAgVGhpcyBpbmRpY2F0ZXMgYSBidWcNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICogaW4gdGhlIGd1ZXN0LiAgSWYgcmVxdWVzdGVkIGJ5IHRoZSB1c2Vy
LCBpbmplY3QgI0dQDQo+ICsgICAgICAgICAgICAgICAgICAgICAqIHRvIGNhdXNlIHRoZSBndWVz
dCB0byBsb2cgYSBzdGFjayB0cmFjZS4NCj4gKyAgICAgICAgICAgICAgICAgICAgICovDQo+ICsg
ICAgICAgICAgICAgICAgICAgIGlmICggaW52YWxpZF9jYWNoZWFiaWxpdHkgPT0gSU5WQUxJRF9D
QUNIRUFCSUxJVFlfVFJBUCApDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBwdl9pbmplY3Rf
aHdfZXhjZXB0aW9uKFRSQVBfZ3BfZmF1bHQsIDApOw0KPiArICAgICAgICAgICAgICAgICAgICBy
ZXQgPSAtRUlOVkFMOw0KPiArICAgICAgICAgICAgICAgICAgICBnb3RvIGZhaWw7DQo+ICsgICAg
ICAgICAgICAgICAgfQ0KPiArICAgICAgICAgICAgfQ0KDQpUaGlzIHdpbGwgY2F0Y2ggY2FzZXMg
d2hlcmUgdGhlIGd1ZXN0IHdyaXRlcyBhIGZ1bGwgcGFnZXRhYmxlLCB0aGVuDQpwcm9tb3RlcyBp
dCwgYnV0IHdvbid0IGNhdGNoIGNhc2VzIHdoZXJlIHRoZSBndWVzdCBtb2RpZmllcyBhbg0KaW5k
aXZpZHVhbCBlbnRyeSB3aXRoIG1tdV91cGRhdGUvZXRjLg0KDQpUaGUgbG9naWMgbmVlZHMgdG8g
YmUgaW4gZ2V0X3BhZ2VfZnJvbV9sMWUoKSB0byBnZXQgYXBwbGllZCB1bmlmb3JtbHkgdG8NCmFs
bCBQVEUgbW9kaWZpY2F0aW9ucy4NCg0KUmlnaHQgbm93LCB0aGUgbDFfZGlzYWxsb3dfbWFzaygp
IGNoZWNrIG5lYXIgdGhlIHN0YXJ0IGhpZGVzIHRoZSAiY2FuDQp5b3UgdXNlIGEgbm9uemVybyBj
YWNoZWF0dHIiIGNoZWNrLsKgIElmIEkgZXZlciBnZXQgYXJvdW5kIHRvIGNsZWFuaW5nIHVwDQpt
eSBwb3N0LVhTQS00MDIgc2VyaWVzLCBJIGhhdmUgYSBsb2FkIG9mIG1vZGlmaWNhdGlvbnMgdG8g
dGhpcy4NCg0KQnV0IHRoaXMgY291bGQgYmUgc29tZXRoaW5nIGxpa2UgdGhpczoNCg0KaWYgKCBv
cHRfcHZfb29iX3BhdCAmJiAobDFmICYgUEFHRV9DQUNIRV9BVFRSUykgPiBfUEFHRV9XUCApDQp7
DQrCoMKgwqAgLy8gI0dQDQrCoMKgwqAgcmV0dXJuIC1FSU5WQUw7DQp9DQoNCmZhaXJseSBlYXJs
eSBvbi4NCg0KSXQgb2NjdXJzIHRvIG1lIHRoYXQgdGhpcyBjaGVjayBpcyBvbmx5IGFwcGxpY2Fi
bGUgd2hlbiB3ZSdyZSB1c2luZyB0aGUNClhlbiBBQkkgQVBULCBhbmQgc2VlaW5nIGFzIHdlJ3Zl
IHRhbGtlZCBhYm91dCBwb3NzaWJseSBtYWtpbmcgcGF0Y2ggNSBhDQpLY29uZmlnIG9wdGlvbiwg
dGhhdCBtYXkgd2FudCBhY2NvdW50aW5nIGhlcmUuwqAgKFBlcmhhcHMgc2ltcGx5IG1ha2luZw0K
b3B0X3BiX29vYl9wYXQgYmUgZmFsc2UgaW4gYSAhWEVOX1BBVCBidWlsZC4pDQoNCn5BbmRyZXcN
Cg==

