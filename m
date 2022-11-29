Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A29663C972
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 21:37:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449613.706463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p07Li-0001ut-Gy; Tue, 29 Nov 2022 20:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449613.706463; Tue, 29 Nov 2022 20:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p07Li-0001rp-Du; Tue, 29 Nov 2022 20:37:02 +0000
Received: by outflank-mailman (input) for mailman id 449613;
 Tue, 29 Nov 2022 20:37:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xNwm=35=citrix.com=prvs=3259bd577=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p07Lg-0001rj-9i
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 20:37:00 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 908a7d81-7025-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 21:36:58 +0100 (CET)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Nov 2022 15:36:54 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6707.namprd03.prod.outlook.com (2603:10b6:510:112::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 20:36:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 20:36:51 +0000
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
X-Inumbo-ID: 908a7d81-7025-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669754217;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vfFTvcCL7i8yJifALi+r/OXeZZHyFf98VXEdnY/QKU8=;
  b=IB/KitgDpEBRZ0H3oJVHBtZ8bY03kIQN2uLbVURcc538ahhrJ3PgAcjK
   xiPVURHlmIIWO9oOdFvmFmpMgff0Pz7Jze+d8+rZQas1/9dgdykFCFZ5M
   Cf18SIjLMb9F+n/zJAOI3FQyKK/zJoz+ChkEO0ik6Q9gZr7rs+R2BBwP0
   o=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 85803730
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1cQeNq74gQLq2vM9NtVwAQxRtBrGchMFZxGqfqrLsTDasY5as4F+v
 mFMXDqHP/uPMGX1ct8gYN6/90wBuZeHy9ZnTws4qS1jHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkR7QeA/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 O4fKxMJNy2/i92zmYOnFtNvnc8MI5y+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUooj+SF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNJPROXjqaUy6LGV7msXFxETbAOSndmC1VKaVeIOA
 XYy9SV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgc/iTQsSAIE55zvpd81hxeWFNJ7Svfq0pvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:fgTc8qMiZN8cqsBcT+n255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4k3Ez5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDy+IiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ/+1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh77D3vXklVavoLhiKr7zPI9
 MeSv00I8wmKG9yWkqp+lWHBubcBkjbUC32GXTq8fblrgS+1EoJs3fwgvZv3kvovahNNaWtrY
 7/Q9tVvaALQckMYa1nAuAdBcOxF2zWWBrJdHmfOFL9Ccg8SjvwQrPMkcIIDduRCeo15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIRGmmRzzixsxX+pA849THNfHWGDzGTEprn9qrov0ZDMGeU/
 GvOIhOC/umKWf1A45G0wD3RpEXI3gDV88evMo9Rju104r2A5yvsvaefOfYJbLrHzphUmTjAm
 EbVDy2P8lE5lDDYA6NvPEQYQKZRqXSx+MCLEGBxZlj9GEkDPw9jiEFzVKk+8qMNTpO9qQrYU
 oWGsKUrp+G
X-IronPort-AV: E=Sophos;i="5.96,204,1665460800"; 
   d="scan'208";a="85803730"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4JTvS5QD5p3TQ6O6tfwKteyWIYOTd8fv2bO1ytMiyih+C6xeY3Y1xcUGpBe0Uthe+9WoVuBeCyO9kA3KR+kfUnsJ8tSQoKgE/Un11HwqOMAj5EFdz23eJqAgf6wczxNNYOR0U0+OSyDjvh1Fdwc57OhO06GUbmGbwEU3uArJ7H1EfsOee0NBDLuJq51kOqW7Bf0zjXEEOB+H1olXurY2ropxh5NeUI0/AN+DG22ew6EFN3JXvYsSIoEGu8EI1sUJ2gqzLVE3V1ESa3rwgfWAMaUhQR76yxAMiB3s7mYQmqMwbWttiWYFUnCv/fOupPcjK2oTBSljqQFx9A6rY0A4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfFTvcCL7i8yJifALi+r/OXeZZHyFf98VXEdnY/QKU8=;
 b=kFbgxOW+j3VvOpBWSjLfK0sOpyEGgqwXTKpUEh7A1V8aC1Q8EsiVkL2niuOkb9voWV5PK/ZZg+LCkh1jv30K5nwX9BQikH8627UG8RftEVOfSm5Y+y2nGFIFzVLjaQ649Q8kQo4H4sWvo2PO9h+HdlPLqmgQXllPU7xTVz+JPLN0mhNzPpfy9kqn+nGacC+f3DAtFnnBBHLKlSzU6LI0ewXhu2tjivB4L6erMFRfZChiwwyfxloXDvIRT5lVkQP+e8rJFHkWI1NjJ8HHuIyIxwhZIVIZ3pDlDzh2pbuPcihzA8WYU7g2sfz2GoN9RmFVKmZIRk8LH4FXDqarOMKjZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfFTvcCL7i8yJifALi+r/OXeZZHyFf98VXEdnY/QKU8=;
 b=T4l5mEeMcTGyzP6jTjpnUpt+5xFFR2zRSbxuMtqQwSuI+t9Xdh9pvUPafAhk2gBHswqpsX0nFjOKtQiYhR4mEI4u7frPxVylSDskzujqYP/qLOmfVDI4xsw0W6rpVisd6NDKperQ6GW+eljVVHxIuFd52jApRCsUe7YJRHHOC/8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/HVM: drop stale check from hvm_load_cpu_msrs()
Thread-Topic: [PATCH] x86/HVM: drop stale check from hvm_load_cpu_msrs()
Thread-Index: AQHZBAII9yW//UkOVUmtKXeE7HsILK5WXJkA
Date: Tue, 29 Nov 2022 20:36:50 +0000
Message-ID: <48ace255-8b9f-84e0-cdbe-00c4fba309bd@citrix.com>
References: <a1cacbe0-2bfb-e365-77ac-e4814067ce6f@suse.com>
In-Reply-To: <a1cacbe0-2bfb-e365-77ac-e4814067ce6f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB6707:EE_
x-ms-office365-filtering-correlation-id: ffd49f22-0664-495a-5bde-08dad24971aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5pNuZvgo90OnYYHnvSBffiAokzpFpokLk2A2urzAeyGjmOdLDdcmbHXR8rrfGMhDgsXdTc4+vcLGmmcPWJsWyiTv0XlmL5sEopGOgLriTlc/q5psdl5nHiKj0uci4huQsGSXOXZjKys72vaATn9K7n+B6peEN/Q/smVhnMvZuST2HBP/vcLWHLZGDmW3vIhLI//n9JwBih1Rn1g5AnYH/iVctSqo4PQ43tdwIyWK4/FP2exFq0hoGdqQf3G5EnKr3nxcMpovH1p1GetvXqjePUOv8HnWOzHBXVD6unJLQJnkEtO6HqD3Dwl/6ig8QH4KPmDChmtbUePCGcGjqXXhjBfwUnTrJNg/QwJd3JNhHfO+z38mRBw9NYMYnwVyadhfOGoEI6Iw4tHdgTE0/bQtGjaOoYgJ6C7b9fOaqNWi4IRs8V+zYJ6iRPgqtjM6FfZmYJYOu/7Q5fgZkNs57x+7wi87J5y+7HUd40Ws7676dUf+2v+bmaZF7UniHK3DAHcXspcz1q1hSIQ3Gd8Xw6+23JxP3SUohyNBbkk+Nx3YqMuAxGfJJdRanTnchbXZLdgTfprER/Q+QL9KcqlMHHLqYayCIuzqf/9KdphVxK5uu08/PzFtVb2Ao4hSIVQ6bxRZuxOoyjt3xNMrbJ8+UVOvFjl0pfn+/TJywIhotLvoXYmnCv+RzUrWC1qtcyJwkocaS//wbP7577AaORCAUlMTUITHQnxbuL718GbZ1bG8KhLYK8az7Hw/DLium9uWpPu/Rw3e8ksDz77xwu1caHiKyg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199015)(71200400001)(54906003)(66446008)(110136005)(8676002)(8936002)(64756008)(4326008)(91956017)(36756003)(41300700001)(66476007)(5660300002)(316002)(66556008)(66946007)(76116006)(38100700002)(122000001)(82960400001)(38070700005)(86362001)(6486002)(478600001)(107886003)(53546011)(6512007)(6506007)(26005)(2616005)(186003)(31696002)(2906002)(31686004)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RTdrTmZrbm9xNnhRVXYwVjZNeGNtZFJUNGtlaStsVHd1Rm5MRDJEb0RzMEJB?=
 =?utf-8?B?L1VTK0JKdjBycW1sd0plZWdlSkt0REFnY0cwb0lHbEZ0L1dtUHYrd3A0TnY5?=
 =?utf-8?B?b2R3dTBidWRyQW1GeTFQVWdIZ1JCQkwwOGxDclJRN3BCeGQ0TXk4T01xd1Bh?=
 =?utf-8?B?U09MWmlJWUtleGN3QXZwYTk3WVgyWlAydWFGKzBOMEVXM1luTGN6bHVPeDVC?=
 =?utf-8?B?OXg3MVdNbHlyYkg1Vnc3YnZyYTJOcC9Yc3UwdFRzRUpaU2xiQktBeHU2TjR6?=
 =?utf-8?B?Z3BsUmU0dEprZ3h0R0VtRUZrTlhGSCs4L1FzblgzY0pZWkdDUFgxREhnblN1?=
 =?utf-8?B?ZGUvSGdmbEdubE9PdHJidFpBOWR4eTV4VUNMUTN4ejYyaDVrNkVtQ3BIcUpp?=
 =?utf-8?B?bmNFYmJ4dWFOSHJFTi9hR0lWTUc4Q2NBRXM0cDAxU1R1NXh2Rmc1TmN6eTRm?=
 =?utf-8?B?STdERDV6S1pyaCtCcDhsYWJVNWRHaFJuL3hkVTkwWmxlcUdHdjhkeGMvVWlp?=
 =?utf-8?B?ZjJVUCtZM1FoU1FyL1BWb3Z4enorSkF4UDlpU0RWSFFuRTBHa1A4MzExNGcy?=
 =?utf-8?B?bmxjNm9hMnZOaTRIa2FEZFpsZFJvWGk3bUQyMTI3Nm9CRnVKamJzb0JUOXNj?=
 =?utf-8?B?bGtJOUxWRjNBRldFbnR4MWxXOUlsamZUclp4NERBMExRbVF0MmsrSVdqaUZ1?=
 =?utf-8?B?aU10YTRkZW9TTWtqK0JVQVJyb1UzeTNvOEZlVmFqVXZpb294VUhjSEZZamQ5?=
 =?utf-8?B?RHkweTFxMVI3NHhWVGdGNFlzRmdZWlV3OFJtRmUyVVNCalpvTzJ0Wi80aEc2?=
 =?utf-8?B?eE5QUSt2NEZWQ0FRYkJ0T2dlOGhUVkJoOTRnekFuQmJqMlBhanBzVDZGdGc0?=
 =?utf-8?B?bkxvMkxQRTlHaE5GdDJTVi9BVVg1SVZaTzVOcUxFMm9LTzdlUzBhUDEyRDht?=
 =?utf-8?B?VUt6Nm9BK24xWG9lM1A3UVNlZ2RCZ0xTcFQ4NTVCTDUwNldzb2htT3JST2tv?=
 =?utf-8?B?VzVOcDNVSmE3YUdjRWlSMHIxUW1CMzRoYXpDNE9tOXJ4WlkvQ2V6dDFHb1Zw?=
 =?utf-8?B?YVJIdFR1RW1heU1pcjFoNjF3amJrTlcwbGZuOTlTYUlDM0RGQi9IY3V0K3BM?=
 =?utf-8?B?ZmhjbmhOZzNncUY1KytyMXZ2ZmtBV2sxaEpRQ0xaNDlhZlBUYWtoUlZGQ0ky?=
 =?utf-8?B?LzE5TElHWlZLSENha2dtM1NjSHpVZUlqVUsvdkwxZlFoVVlMeFVjVmEyWXNh?=
 =?utf-8?B?NU5TVVh3bEJQSk5SdzYzZ3NRQ0dLNFNTSzJqR203K2QwMGxNanZvenNjUmd1?=
 =?utf-8?B?SkpRYWZramtZZEV2bkYxMk9FbGQrV29zSlBxZDA2cVdTbjNtS2tHSzhPa29Q?=
 =?utf-8?B?R0R2YWlLZ1BhUVZteFI4cHdVcm5TaTRkNmp3SXVXOGRySTIvWGNSU3NFTGhF?=
 =?utf-8?B?THlESnc2NFU2MFJlVFR6TGtwUE8vY252TE9SOUZGZW5lU0tmRTlZM2xJMjhV?=
 =?utf-8?B?dldwMHBEd1pBYmwzWVdXVW4zVit6WFFqbGhhZmpVaXorNjA5b0RQYTdMV09C?=
 =?utf-8?B?K0dibENOTUEwM21uM3RLQTFMMEhGNVJvZWdJUWJRMFFQRmErc3NTMXViQjNL?=
 =?utf-8?B?djJqclZUSU4xS1dqL0gxUFBuUVZta0dGQmlORmFrQTJsa05qemkvdlpwSThh?=
 =?utf-8?B?djZEOW0wbllHQ2RyQU1IK2JaRVBoZmZpQ0JXcHE0QmIyYnpxNG13bElNTk1p?=
 =?utf-8?B?ZlZUTjVkOVpzck9SU3QxaFBvd09Td1dWWHM3eHFIdG5QQkYraHpWQ3h2UU9z?=
 =?utf-8?B?Rm9yaitVMnUwZ21VOVZhUHNQaVlpdUNybisyd0syMTA4dE12aUxaWTdMaE9Y?=
 =?utf-8?B?SjdFZHBjdU02dS9tRkpyQmJ6UkNBZ25MQ1cxN2JiTXJqbGFwdytXdGJKbHFT?=
 =?utf-8?B?SHFaN3VnZnB2dHY4RWprYmF5eWdYZlEwMitJb2xoQS9IRVhBRXZXYnJ4OERQ?=
 =?utf-8?B?R3QwQ1lnREN0eGorN0FtbWVpVU9QNWJ5SGpnZ2J6Y2Z6K1F0MzlZeWZXRUdJ?=
 =?utf-8?B?ZCsrYWlCb25XRUY5KzlPUjVHTzFIaWhOaEFLZU4xMzFCQUk4VXA1L2RVdmtP?=
 =?utf-8?Q?42bgrq5QlAl6aSjTMpnehaHsI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C72394622D12B34D8D32C32D245424BE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Wx/RTwEAFuxRSgI6ezVMJZJY6mIoNw56W+U+SJCpuUO/5FbmljQAZ36NLLklJTanvNrJERh1qqev42C2opbiAhjXA4cjPRT47SS0XjqTmO5Z6fKJQEX0Z6aTmMNXt+e0oV5urMEH8cHWfEzQyZDr86xySkKFG6iKQ8lhrwwf2IjdcD4nQ/noVTJl2tKWt1f2kxEy0K4Gj8Re6KIEZ1BfAMOH/iHlt6LMc4mfx22FutAjsjF3Ls1m6ALezkkjQnl2lLjB7Y66XDxvUvN4L/qtPyxWdwUWdm5Meouw1D+oL/2vJIfOqah9M8mjOfyxaZKAILcxq8wxO80TmqgFbZrx4dgQyKRCCkIhFspr7gcxZEAwJ38XpPUv/ot4q16xvI5xhj5lBPiEfRV19JyeuY4uQ9PI+j1np8w3kHVjDpU4p5CgoyQjgSi3oJVvrpvC7mVE3AIoXiWWj4gBV8f1ZETrtHinpbsD4kpLuhxF9KJSWcVr8IC4hIJp+RdYBoES4qOZRdkeivulpN/Vw+LUfyerP54iajVCfG1lkDYgkEv1DQye6uGHCB8mnmBPakUpd5AZOBcQ29HuFTY4Ur4pdZgoO5Ma4CiAqDHAq4l97DN9HcSPhzK5jBCRwYIFFuvTQkqaLRIHHWyNhEgcBdhAjrUqZc3sczCurqFjwHMBPekPJOi659mHXkyy1YsSgxqFJLxRWDuDZ5a3yimVOtwOVFxkbR1Fc+RFhs1ThSOTxLo+RF7lkVyzXZBt1TPiMaxEK8vRqA/5oJP2zptI14OdCqWgQT3LgK680hkXp+pcQCMvFFd4XsO2v6DjyqsHhUMWtJ4xk7ldF8LemHS3ZuoY0B4m8w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd49f22-0664-495a-5bde-08dad24971aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 20:36:50.7313
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FTOGpDeW2vYl7McnhFNfzB8W+tQHXpVJX1P6KRFrXvtGej9l7fyT1GU9nc3nn7fMUxLrq12UDek30vkNUMLO0pq2HCnztRdh4LxtZNXJZ78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6707

T24gMjkvMTEvMjAyMiAxNDo1MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFVwIHVudGlsIGY2MTY4
NWE2NjkwMyAoIng4NjogcmVtb3ZlIGRlZnVuY3QgaW5pdC9sb2FkL3NhdmVfbXNyKCkNCj4gaHZt
X2Z1bmNzIikgdGhlIGNoZWNrIG9mIHRoZSBfcnN2ZCBmaWVsZCBzZXJ2ZWQgYXMgYW4gZXJyb3Ig
Y2hlY2sgZm9yDQo+IHRoZSBlYXJsaWVyIGh2bV9mdW5jcy5zYXZlX21zcigpIGludm9jYXRpb24u
IFdpdGggdGhhdCBpbnZvY2F0aW9uIGdvbmUNCj4gdGhlIGNoZWNrIG1ha2VzIG5vIHNlbnNlIGFu
eW1vcmUuIFdoaWxlIGRyb3BwaW5nIGl0IGFsc28gbWVyZ2UgdGhlIHR3bw0KPiBwYXRocyBzZXR0
aW5nICJlcnIiIHRvIC1FTlhJTy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPiAtLS0NCj4gV2UgY291bGQgZ28gZnVydGhlciBoZXJlLCByZW1v
dmluZyB0aGUgbG9jYWwgImVyciIgdmFyaWFibGUgYWx0b2dldGhlciwNCj4gYnkgdXNpbmcgInJl
dHVybiAtRU5YSU8iLiBUaG91Z2h0cy4NCg0KJ2VycicgaXMgYSBub24tc3RhbmRhcmQgdmFyaWFi
bGUgbmFtZSwgc28geWVhaCwgd2h5IG5vdC4NCg0KVGhhdCBzYWlkLCB0aGUgY3VycmVudCBjb2Rl
IGhhcyBhIHNwbGl0IGxvb3AgY2hlY2tpbmcgdGhlIGluY29taW5nIF9yc3ZkDQpmaWVsZHMgaW4g
YSBmaXJzdCBwYXNzLCBhbmQgdGhlbiBjYWxsaW5nIGd1ZXN0X3dybXNyKCkgb24gdGhlIHNlY29u
ZA0KcGFzcy7CoCBUaGlzIHdhcyBhbHNvIG1hZGUgcG9pbnRsZXNzIGJ5IHRoZSBpZGVudGlmaWVk
IGNoYW5nZXNldCwgc28gdGhlDQp0d28gbG9vcHMgb3VnaHQgdG8gYmUgbWVyZ2VkLg0KDQp+QW5k
cmV3DQo=

