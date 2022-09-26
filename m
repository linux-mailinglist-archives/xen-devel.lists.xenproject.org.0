Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57B85EAF0E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 20:05:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412034.655186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocsSE-0007Gy-07; Mon, 26 Sep 2022 18:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412034.655186; Mon, 26 Sep 2022 18:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocsSD-0007Dl-T7; Mon, 26 Sep 2022 18:03:41 +0000
Received: by outflank-mailman (input) for mailman id 412034;
 Mon, 26 Sep 2022 18:03:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t0pF=Z5=citrix.com=prvs=2617546cc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ocsSC-0007Df-Ho
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 18:03:40 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b1c373f-3dc5-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 20:03:38 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 14:03:29 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6034.namprd03.prod.outlook.com (2603:10b6:610:bd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 18:03:24 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::56c6:613e:cc95:d028]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::56c6:613e:cc95:d028%6]) with mapi id 15.20.5654.026; Mon, 26 Sep 2022
 18:03:24 +0000
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
X-Inumbo-ID: 8b1c373f-3dc5-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664215418;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pXW/vj+YwTiqrobAJ7BbUg1GgTQPb1zjGrdTbyLZBDQ=;
  b=MfQsRP7xEvUnAMyxjkhRdMhETYDappb00GTDOm3hDge/EatsPtVpmolc
   CoAHICwCV/HWZpCNW+bLHjz1XxS/QpnJn1wOwt61GEQgO7qP8bPjQ2X87
   lODHf7/Mp62+95neESv0jJH7r6WfHoCkIzeAjVv5bQLsTa6THIYdCiAW8
   I=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 83891107
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BlFtmazSCW25jvAw1SN6t+f2xyrEfRIJ4+MujC+fZmUNrF6WrkUCm
 2YXXWvTM/jYMzD9c4p2bI+18RxVsZDTxt9hHQtrryAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Ukx5K2aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN10BkQGFosAx9pnCDBt8
 OQSOS8xZxKc0rfeLLKTEoGAh+wFBeyyZsYzny8lyjvUS/E7XZrEXqPGo8dC2ys9jdxPGvCYY
 NcFbT1ob1LLZBgn1lU/Ucpi2rv3wCSuNWQG+Dp5poJui4TX5CV33KLgL5z+fduSSN8Otk2Zu
 njH7yLyBRRy2Nm3mWHVoyv13rCncSXTeaApJrKSzfNWuESX4lUYVho8eUOSvqzs4qK5c5cFQ
 6AOwQI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8ywSTC3UATzVBQMc7r8JwTjsvv
 neWm/v5CDopt6eaIVqf67OVoDWaKSUTa2gYakcsVhAZ6tPupIUyiBPnTdt5FqOxyNrvFlnNL
 yuiqSE/g/AfiJAN3qDip1Tf2Wvy9t7OUxI/4RjRUiS99ARlaYW5Zouur1/G8fJHK4XfRV6E1
 JQZp/WjACk1JcnlvESwrC8lR9lFO97t3OXgvGNS
IronPort-HdrOrdr: A9a23:bQH34q6xqNOpCchuCgPXwWuBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonys2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlagkEyzzYJ7iJaYfy+Qzdk9vfrGrCV+
 O85CvICv4DqU85uFvF5ycFlTOQiQrGoEWStGNwyUGT3fARAghKRfapzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jViuKYlGchsRLYkjTVoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4eo+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSqvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9HR6svM7z64HRmyGG/fIzmZ0Wd9ih33ekIhpTsALz2LCaEVFci18O9vvR3OLyoZ8
 qO
X-IronPort-AV: E=Sophos;i="5.93,346,1654574400"; 
   d="scan'208";a="83891107"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1w1nky5XQR+QdD2+zxwLp1tKI8vBLZOgZ52CVIHd9chzpTqWw5hjGYSl+qyx+MNZIgBvQ6Lp4M0Qe4TfClG2S6ZDr0NK9nHmW3u18HjmXOEq0SDwUrksNpZ2KZZuxeMV16fjbatYLyp9nJJ5VwYg773sGfKBrQFrzdgC0tMhzGbxXKZxaqHz89jq0Ootb1OSGSYKgm25KkVFvF96alvR3AaTb6hAXk87XhVbTzGMM6/z+lrKrbvk5WbP8uxx20W5Ds4tlSgGqWF9fpA5tpFo8+BIwO48uFrvjXY6N8WVN58MFqLSAUoJO0jOBWderbrRE9XXnkF3RCC+uz4/Kv1iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXW/vj+YwTiqrobAJ7BbUg1GgTQPb1zjGrdTbyLZBDQ=;
 b=gUyBkKXPA57KigJspkunI7TIFA9DjRJYfXbLDFYyRjCPr4VIKq7wtQu68u3/iw6aqHpQLNRimcec2u0esqcGG/+ZayYu7Kd9JO1UdffIs9pFdLGoJnV5TxCvjCl1FDU9PsVMQQWecoYeS4Io3BF4pmhA6Se7PVHwjHbl2xBO367SQXKT9CLCP7hJYe6Z1ItsxBCtmCPU9G7za2lnt0unINWxrOXGR857K59QIyMkIYpNAQbRAfWJRZnERsLG6pB1RsviTIlkSIJGlR3VUGzwQtiia6oGYa+Mwpg9f1sGHLNsXX3QGTNhtK5sUKX1ZVWBpTf5qOrKjWYSKfYFKUXQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXW/vj+YwTiqrobAJ7BbUg1GgTQPb1zjGrdTbyLZBDQ=;
 b=umOINkg39jPq9Ti7JNWQT42a8ULyItRwuFdA4sr2DI9Ja4+iRV7a6raPMrDsAJbYXO7KfZKmkwlehUbF/z/YYd1wo5hReUO/8D6OcTNF6sy5kzOZyW7GiOx7lnlFdRzuwdCChKazOEZ7fDu4baYcX6F86Hpfy6ndK/+hXI8ScW4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH] x86/ept: limit calls to memory_type_changed()
Thread-Topic: [PATCH] x86/ept: limit calls to memory_type_changed()
Thread-Index: AQHYzp0jOSXqM10oEkmgUDyRmTrHkK3yB08A
Date: Mon, 26 Sep 2022 18:03:24 +0000
Message-ID: <3ab6e33c-58a4-8db7-93d2-631b60e9772e@citrix.com>
References: <20220922160516.5929-1-roger.pau@citrix.com>
In-Reply-To: <20220922160516.5929-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH0PR03MB6034:EE_
x-ms-office365-filtering-correlation-id: eede0fae-8939-4948-0ac3-08da9fe967d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zuRBk4FyTqDwntikFmCJaFJQYUmx3UX+jaRt5tPswvOHib0qbblJBBpTEnJlGHPVhNV1ymvHr++AQjFzp6/F6a/7qNPj1/z/IhFQ7kNu/Wc0lzwxIkw5Cidgt9/h5OYXtRcZcqIFFD2lQ60++XqkNsQtoD95F3ZbH0d38jDiK4g2VvMDhL4txF56P1ANCRfDFGb8MZTf5/8BgJ2YxAVHbXhcROqPYhqqWwx8iZnO3QZ4OOCc3R5KgqPODAgO7Kn0Z77oix6ffaToajVhJMnbRZsOQhyzpyGXlFVRJV4CTc3Yyl/YrbsiSpR4U01XMX/yjAvQnDruv7JOiO9+bY9SBg92Ip4N5nzX+bssPAY2XGjBd3zhxP0Kyqlh/SQuSDwqeaPzSnbaTAx/K2v9GuXtEQsd2Xkb1qzlErr9azo+gau5UIYvhG3sL3L4KEqhpBP5mU4dcEs5GjbosnCPMUm0sRRA4FaPCk0jvCjJMbDZ1ZUVUkTuVnlEDezmTbdPkhFzSHvoE7U8YPolCBG1jyeIpa2oS/kb6JP9RSUcqk6jh2Q3f9zDp6y99CVHZs1+oLzb/GleTyMNfeVTt0rRLnYPeSJb8IfzYNPnLmeiofUgX0EjfSomEMedX6f4IKQFyMtXP0WomOygRf4Rqpv9EWlXFCSxOgANiMsUSEL/huADp9nAkmQ/ER0bwhJFrWu31hVXbXhDVmTo7lVnAYvRO+8kkYIJdh0q2pWFminSfbY61Dm3Ic02hOrMTSlnYRhgIbea7SQV/Lx/oNC4uDPURwXUw4sCfXGlP5VXLwubksrsT2olXtYx8rYTaGS53CPPDzIHmcACl0HYJVNq9tR1msCRLg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199015)(36756003)(110136005)(31686004)(86362001)(31696002)(5660300002)(38070700005)(82960400001)(2616005)(54906003)(122000001)(38100700002)(83380400001)(186003)(76116006)(53546011)(6506007)(26005)(41300700001)(6486002)(316002)(91956017)(4326008)(66946007)(71200400001)(66476007)(66556008)(64756008)(8676002)(66446008)(6512007)(478600001)(8936002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajZYNnM2Uk1mS3VuRU1od2hjcjYzZDFrMUQ0RUZpMmsvWjBhV0hrbWlnNkZr?=
 =?utf-8?B?NjZHNHYvNWliOUZOU1IwQ3lpTkJzdDI0WlBFZjlHcktRSmNFRkVaUFkwOW14?=
 =?utf-8?B?bWMvSHdXR1VEYTRTSFRMZHlPLzFqcXJ5b2ZpYVFqR2xuQjJ0UGg0bHh5dVlp?=
 =?utf-8?B?N05CT1lXNzZKK2VaYmpNYnpkbENhRXkvTGV1c1BRSjhoQTNwUFpvLzNOempq?=
 =?utf-8?B?UmRkdTV0b3FHTE5VemI1a1ZveUNWeGlVZFFqK3Q0TGlDRWJ6LzJWaHIvL29D?=
 =?utf-8?B?c0VLOWNaSmNnR2daeDdkSmFoOUUvWStxMTBwQlFqRjVvU3JyWFVJVEtaeStm?=
 =?utf-8?B?ZDJobTZtZzVRSUZLYjlITzB5amNtMk1mai9DanJ1eGEyMjBJdUNod2hLNjNK?=
 =?utf-8?B?V2IxVEIrWWQ4K3RYbVhobVBLZ0tiTXBldnlJZnVkYUZYQkFWcm1MekJvZy92?=
 =?utf-8?B?UU1Wc1pxUFNIaEJvMlJyM3FtTzZzb2h6cmNVOUNybDN2M01KbjdHbUpkdm04?=
 =?utf-8?B?YklaNDNUQzN6UURKZFN4UkxVK0tJSElqUXBUT2h5UlpjQVczTTR6cGR5SWZQ?=
 =?utf-8?B?c3hFNXQ1aWVHMkh0S1h1MjlTeWNYTnVWSGlrY21mVkxqSzdhcmNkTTZadWo5?=
 =?utf-8?B?RzJxYlJhaHBhbllGUzlkSUlIcjdqbFMwVE1ZQUJrdUVxY3lvUVl4L05zZStl?=
 =?utf-8?B?MEVvM0Ewa3hHci9oMGFvTmJyZ0VYQm5UMUdhNmZGdmtZbm13SlMxTnJXZFlD?=
 =?utf-8?B?YXNXR05aeHcyamVyOUdvU1Q1WU1GQ3Y5MHJlVFpPWk9RR01kam03eEVCNVB5?=
 =?utf-8?B?bCtOSGsrL0xxdWJGbjZqREszc1Z3MFdySE42SmtlWE9YZFFLM1BLajZrUmZU?=
 =?utf-8?B?b3hKOUY3dVVtV2hiWEtKa2ZYcHpVS2l3Q21WU1cxdkJoZ2FYK0ZSaEw1SjZn?=
 =?utf-8?B?elJqUzQ0T2swdEttRWFYS2o1VDhMZnp3VUxmNnRMMDF1WllpVmFDcE5PVlRK?=
 =?utf-8?B?M2JuRDZ1cVdKcmdkdStvZ3lBZHE0NldDNUNwNEVrcnFCVVB0M0JuL0dEYjFE?=
 =?utf-8?B?WFQ1Q1hneDJWR2krWFlHNHhDd21GM29NK3I3VzdVNUU0Nm1wMDB2cGlpQ3pC?=
 =?utf-8?B?bXE3MllzY200TkpMN3puVnE5ZXB3S2dicEtwU0hoazYyRjdJRUlGYkF5SFhx?=
 =?utf-8?B?SlNrbHJCdjZRRHd0eXlRWWt4OXVWVE8vcDdmay9rcmU4TWJGVnhpQW9WNStC?=
 =?utf-8?B?Y1Rkb2NZVk5Eb2JJSDhBVTVXbVRnTGsxbStPV2NDNlNmM1QzWDlhTGxNUVVJ?=
 =?utf-8?B?UEhWd3lMb1NuMHJRSzV5OWdFQjRoOEdvdVcxVHZkUjF1bm13SmtWaGtXUTJP?=
 =?utf-8?B?cWt2RUxTVm1OUnRBM3pPK2d5OEVkNTd2dWE3Yml4TFhxdnRDcHV2UmN4Zkcz?=
 =?utf-8?B?elBGczkxNkZjWElRUVRFNnlheG4yNWxPMUQ4QWxPaGRBcFpOclJHQUVzRnFM?=
 =?utf-8?B?WFV0L2QyNUFZNGx5VFdiQ0RKYU9lMW9BQmlISk8yVnIyT2s3MnhRRDlYaTJ6?=
 =?utf-8?B?cnlONVdadXJYTlRYYWFwRWYrNWtObElwRDBVbkphQW9GelZoQ1JGTjMyc2FG?=
 =?utf-8?B?TGxobjRiY20rQ1B1RWFXaXVyWDh6L2c1REJBZHo2RlJzWStudHRjZXZBRkpM?=
 =?utf-8?B?Q0YrNURUYWxOa3RZWVM5bjZObmtQcm1oZFFkQk1sZ3RFUFVRWWk0SGs2eGZ2?=
 =?utf-8?B?YUR1YUVpbitVTlkrRmY4M2dUN3I5c1gvTU1JYUp3QjNlUWFHR2tPb2xnSSs3?=
 =?utf-8?B?MGg3UjFBQ3NWUDY5YVNxSHg3cm9ERkNadUtLQVp4VEFtNnRpamNRK2tTb2VM?=
 =?utf-8?B?L1dPVk1hckVLcUViQVR5QWt0UXUvNG5mSDE2c3JGSE11d2NJWXA4aWtremI1?=
 =?utf-8?B?SDh4RjF5Vmw3WTUvcVNqSnExeGZQaVFXaE5pdmptZmwwbU8xUjhManBPaUx1?=
 =?utf-8?B?MEZzUyswL095UDFzOUxkVkpCUGEyUko2R1orTGhVOTk3ME5WQk9SZWs5Vkc2?=
 =?utf-8?B?c293Q1pDcUlhMVNienVpUHY4b2dYMHRGNW5GMUQxMmFnNXNtWVUxdjZCcmo1?=
 =?utf-8?Q?qz51X5mkoQsmCSaLqZtbYNMlo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5EFF2CB15AB32443878C456819EB1D7C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eede0fae-8939-4948-0ac3-08da9fe967d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 18:03:24.3917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pZGCKcsHC5yBhBkXUdae9Na+6YHs8xEmBMJq0nw5HKMp69oWTn72ZHRQ4Xp06QU5IRMmsCiYbQbhzc7v0nwqzeBk6tRamDzuAeQknAOpt2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6034

T24gMjIvMDkvMjAyMiAxNzowNSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBtZW1vcnlfdHlw
ZV9jaGFuZ2VkKCkgaXMgY3VycmVudGx5IG9ubHkgaW1wbGVtZW50ZWQgZm9yIEludGVsIEVQVCwg
YW5kDQo+IHJlc3VsdHMgaW4gdGhlIGludmFsaWRhdGlvbiBvZiBFTVQgYXR0cmlidXRlcyBvbiBh
bGwgdGhlIGVudHJpZXMgaW4NCj4gdGhlIEVQVCBwYWdlIHRhYmxlcy4gIFN1Y2ggaW52YWxpZGF0
aW9uIGNhdXNlcyBFUFRfTUlTQ09ORklHIHZtZXhpdHMNCj4gd2hlbiB0aGUgZ3Vlc3QgdHJpZXMg
dG8gYWNjZXNzIGFueSBnZm5zIGZvciB0aGUgZmlyc3QgdGltZSwgd2hpY2gNCj4gcmVzdWx0cyBp
biB0aGUgcmVjYWxjdWxhdGlvbiBvZiB0aGUgRU1UIGZvciB0aGUgYWNjZXNzZWQgcGFnZS4gIFRo
ZQ0KPiB2bWV4aXQgYW5kIHRoZSByZWNhbGN1bGF0aW9ucyBhcmUgZXhwZW5zaXZlLCBhbmQgYXMg
c3VjaCBzaG91bGQgYmUNCj4gYXZvaWRlZCB3aGVuIHBvc3NpYmxlLg0KPg0KPiBSZW1vdmUgdGhl
IGNhbGwgdG8gbWVtb3J5X3R5cGVfY2hhbmdlZCgpIGZyb20NCj4gWEVOX0RPTUNUTF9tZW1vcnlf
bWFwcGluZzogdGhlcmUgYXJlIG5vIG1vZGlmaWNhdGlvbnMgb2YgdGhlDQo+IGlvbWVtX2NhcHMg
cmFuZ2VzIGFueW1vcmUgdGhhdCBjb3VsZCBhbHRlciB0aGUgcmV0dXJuIG9mDQo+IGNhY2hlX2Zs
dXNoX3Blcm1pdHRlZCgpIGZyb20gdGhhdCBkb21jdGwuDQo+DQo+IENhbGxzIHRvIG1lbW9yeV90
eXBlX2NoYW5nZWQoKSByZXN1bHRpbmcgZnJvbSBjaGFuZ2VzIHRvIHRoZSBkb21haW4NCj4gaW9t
ZW1fY2FwcyBvciBpb3BvcnRfY2FwcyByYW5nZXMgYXJlIG9ubHkgcmVsZXZhbnQgZm9yIEVNVA0K
PiBjYWxjdWxhdGlvbnMgaWYgdGhlIElPTU1VIGlzIG5vdCBlbmFibGVkLCBhbmQgdGhlIGNhbGwg
aGFzIHJlc3VsdGVkIGluDQo+IGEgY2hhbmdlIHRvIHRoZSByZXR1cm4gdmFsdWUgb2YgY2FjaGVf
Zmx1c2hfcGVybWl0dGVkKCkuDQoNClRoaXMsIGFuZCB0aGUgcGVyZiBwcm9ibGVtIENpdHJpeCBo
YXZlIGZvdW5kLCBpcyBjYXVzZWQgYnkgYSBtb3JlDQpmdW5kYW1lbnRhbCBidWcgd2hpY2ggSSBp
ZGVudGlmaWVkIGR1cmluZyBYU0EtNDAyLg0KDQpYZW4gaXMgd3JpdHRlbiB3aXRoIGFzc3VtcHRp
b24gdGhhdCBjYWNoZWFiaWxpdHkgb3RoZXIgdGhhbiBXQiBpcw0KZGVwZW5kZW50IG9uIGhhdmlu
ZyBkZXZpY2VzLsKgIFdoaWxlIHRoaXMgaXMgcGVyaGFwcyB0cnVlIG9mIGN1cnJlbnQNCmNvbmZp
Z3VyYXRpb25zIGF2YWlsYWJsZSwgaXQgaXMgYSBsYXllcmluZyB2aW9sYXRpb24sIGFuZCB3aWxs
IGNlYXNlDQpiZWluZyB0cnVlIGluIG9yZGVyIHRvIHN1cHBvcnQgZW5jcnlwdGVkIFJBTSAoYW5k
IGJ5IGV4dGVuc2lvbiwNCmVuY3J5cHRlZCBWTXMpLg0KDQpBdCB0aGUgbW9tZW50LCB3ZSBrbm93
IHRoZSBJT01NVS1uZXNzIG9mIGEgZG9tYWluIHJpZ2h0IGZyb20gdGhlIG91dHNldCwNCmJ1dCB0
aGUgY2FjaGVhYmlsaXR5IHBlcm1pdHMgYXJlIGR5bmFtaWMsIGJhc2VkIG9uIHRoZSBub24tZW1w
dHluZXNzIG9mDQp0aGUgZG9tYWluJ3MgZGV2aWNlIGxpc3QsIGlvcG9ydCBsaXN0LCBhbmQgdmFy
aW91cyBvdGhlcnMuDQoNCkFsbCB0aGUgbWVtb3J5X3R5cGVfY2hhbmdlZCgpIGNhbGxzIGhlcmUg
YXJlIHRvIGNvdmVyIHRoZSBmYWN0IHRoYXQgdGhlDQpvcmlnaW5hbCBkZXNpZ24gd2FzIGJ1Z2d5
IGJ5IG5vdCBoYXZpbmcgdGhlIGNhY2hlYWJpbGl0eS1uZXNzIHBhcnQgb2YNCmRvbWFpbiBjcmVh
dGUgaW4gdGhlIGZpcnN0IHBsYWNlLg0KDQpUaGUgYXBwcm9wcmlhdGUgZml4LCBidXQgZGVmaW5p
dGVseSA0LjE4IHdvcmsgYXQgdGhpcyBwb2ludCwgaXMgdG8gaGF2ZQ0KYSBuZXcgQ0RGIGZsYWcg
d2hpY2ggcGVybWl0cyB0aGUgdXNlIG9mIG5vbi1XQiBjYWNoZWFiaWxpdHkuDQoNCkZvciB0ZXN0
aW5nIHB1cnBvc2VzIGFsb25lLCB0dXJuaW5nIGl0IG9uIG9uIGFuIG90aGVyd2lzZSAicGxhaW4g
Vk0iIGlzDQp1c2VmdWwgKGl0cyBob3cgSSBhY3R1YWxseSBkZWJ1Z2dlZCBYU0EtNDAyLCBhbmQg
dGhlIG9ubHkgc2FuZSB3YXkgdG8gZ28NCmFib3V0IGludmVzdGlnYXRpbmcgdGhlIE1UUlIgcGVy
IGRpc2FzdGVycyBmb3IgVkdQVSBWTXNbMV0pLCBidXQgZm9yDQpyZWd1bGFyIHVzZWNhc2VzLCBp
dCB3YW50cyBjcm9zcy1jaGVja2luZyB3aXRoIHRoZSBJT01NVSBmbGFnIChhbmQNCmVuY3J5cHRl
ZCBWTSBmbGFnIGluIHRoZSBmdXR1cmUpLCBhbmQgZm9yIGFsbCBkeW5hbWljIGxpc3QgY2hlY2tz
IHRvDQp0dXJuIGludG8gYSBzaW1wbGUgJ2QtPmNvbmZpZyAmIENERl9mdWxsX2NhY2hlYWJpbGl0
eScuDQoNClRoaXMgd2F5LCB3ZSBkZWxldGUgYWxsIGNhbGxzIHRvIG1lbW9yeV90eXBlX2NoYW5n
ZWQoKSB3aGljaCBhcmUgdHJ5aW5nDQp0byBjb3ZlciB0aGUgdmFyaW91cyBkeW5hbWljIGxpc3Rz
IGJlY29taW5nIGVtcHR5L25vbi1lbXB0eSwgYW5kIHdlDQpyZW1vdmUgc2V2ZXJhbCBvcmRlcmlu
Zy1vZi1oeXBlcmNhbGxzIGJ1Z3Mgd2hlcmUgbm9uLWNhY2hlYWJsZSBtYXBwaW5ncw0KY2FuJ3Qg
YWN0dWFsbHkgYmUgY3JlYXRlZCBvbiBhIFZNIGRlY2xhcmVkIHRvIGhhdmUgYW4gSU9NTVUgdW50
aWwgYQ0KZGV2aWNlIGhhcyBhY3R1YWxseSBiZWVuIGFzc2lnbmVkIHRvIHN0YXJ0IHdpdGguDQoN
Cn5BbmRyZXcNCg0KWzFdIE1UUlIgaGFuZGxpbmcgaXMgYWxzbyBidWdneSB3aXRoIHJlZHVjZWQg
Y2FjaGVhYmlsaXR5LCBjYXVzaW5nIHNvbWUNCmFyZWFzIG9mIFJBTSB0byBiZSB1c2VkIFVDOyBu
b3RhYmx5IHRoZSBncmFudCB0YWJsZS7CoCBUaGlzIG1hbmlmZXN0cyBhcw0KUFYgZGV2aWNlIHBl
cmYgYmVpbmcgd29yc2UgdGhhbiBxZW11LWVtdWxhdGVkIGRldmljZSBwZXJmLCBvbmx5IHdoZW4g
YQ0KR1BVIGlzIGFkZGVkIHRvIGEgVk1bMl0uwqAgSW5zdGVhZCBvZiBmaXhpbmcgdGhpcyBwcm9w
ZXJseSwgaXQgd2FzIGhhY2tlZA0KYXJvdW5kIGJ5IGZvcmNpbmcgSVBBVD0xIGZvciBYZW5oZWFw
IHBhZ2VzLCB3aGljaCBvbmx5ICJmaXhlZCIgdGhlDQpwcm9ibGVtIG9uIEludGVsIChBTUQgaGFz
IG5vIGVxdWl2YWxlbnQgbWVjaGFuaXNtKSwgYW5kIG5lZWRzIHJldmVydGluZw0KYW5kIGZpeGlu
ZyBwcm9wZXJseSAoaS5lLiBnZXQgdGhlIHZNVFJSIGxheW91dCB3b3JraW5nIGNvcnJlY3RseSkg
dG8NCnN1cHBvcnQgVk1zIHdpdGggZW5jcnlwdGVkIFJBTS4NCg0KWzJdIFRoZXJlJ3MgYSBzZWNv
bmQgYnVnIHdpdGggbWVtb3J5X3R5cGVfY2hhbmdlZCgpIGluIHRoYXQgaXQgY2F1c2VzDQpkcmVh
ZGZ1bCBzeXN0ZW0gcGVyZm9ybWFuY2UgZHVyaW5nIFZNIG1pZ3JhdGlvbiwgd2hpY2ggaXMgc29t
ZXRoaW5nIHRvDQpkbyB3aXRoIHRoZSBpbnRlcmFjdGlvbiBvZiByZXN0b3Jpbmcgdk1UUlJzIGZv
ciBhIFZNIHRoYXQgaGFzIGEgZGV2aWNlDQpidXQgaXNuJ3QgcnVubmluZyB5ZXQuwqAgVGhpcyBz
dGlsbCBuZWVkcyBpbnZlc3RpZ2F0aW5nLCBhbmQgSSBzdXNwZWN0DQppdCdzIGdvdCBhIHNpbWls
YXIgcm9vdCBjYXVzZS4NCg==

