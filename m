Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D7A4A4506
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 12:36:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263032.455576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUyO-0005sl-L0; Mon, 31 Jan 2022 11:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263032.455576; Mon, 31 Jan 2022 11:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUyO-0005qo-Gd; Mon, 31 Jan 2022 11:35:52 +0000
Received: by outflank-mailman (input) for mailman id 263032;
 Mon, 31 Jan 2022 11:35:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9KqZ=SP=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nEUyN-0005qi-0I
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 11:35:51 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef0f9dbe-8289-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 12:35:49 +0100 (CET)
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
X-Inumbo-ID: ef0f9dbe-8289-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643628948;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NiAQYwMUm+EzrVf7M2IkJwJ2lIPvx082Ghp/3XvMeSg=;
  b=gCVaDymXNPeLwfnaxiB/b/tKBbWl0GaqrVXe8LJF/BRQAjUjNwvLcvQH
   pIEm2G3pwwzWb1paTqjN5/yMixzIzUcj0I+qFzMARlUsLiOI/X/KJLkUN
   2povcVsYhocfPi5IkdjvdTzhMWmRjWeL4j/4xMf8issOFkquGpZL+uynQ
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HlDouB5w2hfk8P+ptChQiybKLIdewboiefLrcD1JoqkRGqWSYmpkB/ZK0GGk7l3kmcLIHRS/4Y
 BhvUhErLc13PN+RWnPUpeB+XNFAUCNtVE/Ivday5CC7RV3yJnSQcNsUxkpaZk50Twrj/cl1GGE
 Jyeiw9g/dZUoW7k23YGguBFeNbf5kJRm3ZjThIqVm/ad/Efg9jJ7mPQu9aK9qm5WifGkQGuXz2
 Auc8QyMghNFTpe7C3dZ1TS761KJv8rq34CpseehcXHr2pNLP53RMI7dNyF8jZGL5RGstLJZK9C
 Kp/fY5Y9OBp/0UuwTUhVbKrp
X-SBRS: 5.2
X-MesageID: 63032174
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mHwfVKJ9G0oAhDQPFE+RPJIlxSXFcZb7ZxGr2PjKsXjdYENShGYCz
 jFLDT3QaPuJZGKjf911PIjg9E1Vu5DWyYQ3T1RlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us4wrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Vgsl29
 osOsKCrbigVM5DSiv4AaxNxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Glr3psURKmCD
 yYfQQc3aASeYDMXAFo4F8wsxMnwlkD1fTIN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7sfQmQvrVYRUE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCs4gMFXOQOUOgG8yai9qfp/RSDG1AOZ2sUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZos7SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCskPuZJhKTysDA3CMqsyq7DFDFtW
 1Bfw6CjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9wLvWEhfBc3Y5pVEdMMX
 KM1kVkLjHO0FCDyBZKbnqrrU5h6pUQePYmNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm35irUuOG8GT50n3gNK2OS/OIZ9YYQTmUwzMxP7eyOkj2
 4wBZ5LiJtQ2eLCWXxQ7BqZKcwhScyBnVM+nwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg6AF82dZog/389IwI2OlOkhyoqbYq1tf9NfJorZ7g3sudkyKcsH
 fUCfsyBBNVJSyjGpGtBPcWs8tQ6eUT5nx+KMgqkfCM7I8xqSTvW94K2ZQDo7iQPUHa67JNsv
 7262wrHapMfXAA+Xt3OYfeiwgrp73gQke5/RWXSJdxXdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YnRxhUBWjW67qyJBL2xGv7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB748cHmL2c5D6v9EyrND4FbkX
 0uO/p9ROKmTOdOjG1kUfVJ3YuOG3PASuz/T8fVqfxmquH4ppOKKARdIIh2BqC1BN78kYooqz
 NAotNMS9wHi2AEhNcyLj3wM+mmBRpDav37Lan3O7FfXtzcW
IronPort-HdrOrdr: A9a23:UspskKotd5pDWyzOwXNp/PgaV5uPL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssSkb6K290KnpewK4yXbsibNhc4tKLzOWxFdAS7sSrLcKogeQVBEWk9Qy6U
 4OSdkGNDSdNykYsS++2njDLz9C+qjGzEnLv5an854Fd2gDAMsAjzuRSDzraXGeLDM2X6bRf6
 Dsgvav0gDQH0j/Gf7LYUXtMdKzxeHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX272oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkF2nAjv0idurD
 D/mWZmAy1B0QKWQohzm2q15+DU6kdr15Yl8y7BvZKsm72jeNtwMbs/uWsQSGqm16NnhqAg7E
 sD5RPoi3IcZymw7RjV9pzGUQpnmVGzpmdnmekPj2ZHWY9bc7NJq5cDlXklWqvoMRiKoLzPKt
 MeR/00JcwmBW+yfjTcpC1i0dasVnM8ElOPRVUDoNWc13xTkGpix0UVycQDljNYnahNB6Vs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijITQjXOGyfLFz7HOUMOm7LqZTw/LIpjdvaNaAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTXTGC0TV3Wu4hjDlhCy8vBrZbQQF++oWEV4rydSq8kc77mst
 6ISedrP8M=
X-IronPort-AV: E=Sophos;i="5.88,330,1635220800"; 
   d="scan'208";a="63032174"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgEPU8bfW63auB8/aqwOGaSeO50tx7tiOEpnzWxXK1jijcPvQjTFW/+lkL35VXK6iNbMLhE9m3D/mh6NsBtJJxuKcZAxCHOYIEKwYEBfOKeG1dBnadKk/6dOG1KIJ9AwQL/6r2HR1QPt/2FhdIZh/sluuavnQD7lVvWhj7gklSOvRrJ+bTkocsSyJJaKBX8b81IP25EyXX7CcksCQVqztFxdStT2MNBzIqTqgEtI5Oexr84THLuR9dJyymuvhn32TaktJy05tSYS7Q99p9PjuQVLLv1KH8JMsX3KfiF53mIH+otmT/Mt7Uq7uv9KZ3uRGVsUzzgiRJhCle4lHYwV/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiAQYwMUm+EzrVf7M2IkJwJ2lIPvx082Ghp/3XvMeSg=;
 b=FAeIMSvJIt0j23nlL+Q+lcMd93Vyr5V8VB3+FR6QRgJ6zR3mpYTdbl3DSBqsy6JDfrJqOWCQ0U8DsUnb134SWYaTAK8Lscpl55iaAHEjcFaYNgZHw8aMFE866hIWB2nuOJqhj4kjzo9toM4Hxp4LomAoEbtRaGk/C58cc2oN7Ym3D0ZgIHslbG7bdpfGQm4GUhhiwhwbaPLcjt3r7HtfOao4qKQscoC0B90ChMyfQIzgAUZhiHWml865GSFmhm50rMzRW2XUVc0tkLACcClj9cLtdhKnCmcZ9HrGgoAVZp2grZPDs96kHhO8/TQglUPm6SyP855FxdQ3u1zc8Gf+qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiAQYwMUm+EzrVf7M2IkJwJ2lIPvx082Ghp/3XvMeSg=;
 b=ezxcSFADZjKSWI+CQkT8VsZfpGtAF1qFpZVF7DQHzwXRdMQYCZ3IGpP2bvN8kdG/LUqmHHa7H2Zvk1j+wxPPQollVrgTqoe2S2NdCwpH2v8pWr2N59pIWLsUAinS9xuYT8CLqeNUpjEoPzkpL8LjzyB6pmT25Qi6TPk2eK7h8H8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 5/9] x86/spec-ctrl: Record the last write to
 MSR_SPEC_CTRL
Thread-Topic: [PATCH v2 5/9] x86/spec-ctrl: Record the last write to
 MSR_SPEC_CTRL
Thread-Index: AQHYFEsmzjI7mjP2gUCbwx5jxoXzCax876wAgAAVGYA=
Date: Mon, 31 Jan 2022 11:35:43 +0000
Message-ID: <2cdc2c56-c9ba-97ab-49e4-1a8869a6d3dd@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-6-andrew.cooper3@citrix.com>
 <18239ffb-058b-8790-be3e-0951d2d6ae6c@suse.com>
In-Reply-To: <18239ffb-058b-8790-be3e-0951d2d6ae6c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fe7c372-b52c-430e-82f5-08d9e4add11a
x-ms-traffictypediagnostic: SN2PR03MB2253:EE_
x-microsoft-antispam-prvs: <SN2PR03MB22532430FAB8A5954AEEAF16BA259@SN2PR03MB2253.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NJOdVxDwLb0ScZdoSnSWLu2gWFkUq2JFoBAJjdFE1mgWoWLLCLC0RLBs8QurjTtap3BOBecDG/5CZgbFSrqY3ryQ756qOfmMdOq+EG6txGTyXJVRJNi0ynXJiPTet+CM/aXg0fHJf1lTVg+jgI9M7v6l8Ki712irBI6zQvsdbpV7d/3X+3qK8g1kty0f0SwGSuPgsPh20k2Pio5oIM0FyzJ1wWl6uZr0e2fffPtIXyw66HaS1iBjjHvDECTgXvpSg+iq4848aVrDtqrL5YSWZT+nVWHXz2DNUWZJ+Gn7P5bM4fyCRkTdSMwFB2ACj43PCGd2nmcqp3EjpPwXptGJ1IAt2Pd4YIOtoLYgtnHMek3cX7bfLLSm10bbEg5CRivyr3+zWyWlvIl8TD7kj/YYjmWAvYytEnE6tKkq04FyBDhlKEeduH07fF2I1ByR66f1dAUwZxjtXibu+gGN89URXZ2wN2Hw+xD0HCJmkTQNE/Hg5wCMPQzP0uSIpAkcy3lpBDs1StUiZbDbmYYJ2YE3mMgJ/u/fnmkXuah31ruOSZxqVJOJKCfkFX612sFigA81GlaHNY0D6Xqk0slDvItgIc1v54o7xYkOOO0EwEZ/NzyE9fWpcWv3SuFPECAYC2ZtYfmQxog+/wS32IPzvobYf69zHYx9rqIlgiJ82+PRW5QFEvT4YHMDMgRabz7oLMg65ETdz/gkGPtV2kzt3Flf2XDLXEpOoWRcUXvYIM0E2geFMJNR18osYm1JpWnzNC+46h3UKVqtv+AAiUAiVjEkgQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(186003)(86362001)(5660300002)(31686004)(2906002)(38070700005)(36756003)(26005)(71200400001)(53546011)(76116006)(66446008)(38100700002)(8676002)(6506007)(4326008)(66556008)(8936002)(66946007)(6512007)(66476007)(64756008)(91956017)(31696002)(122000001)(508600001)(82960400001)(6916009)(54906003)(316002)(6486002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTVHTEp1VXQxVEtvUDlMUHlNaTE3bmJ3VHhZOW5iTGN3NHdHUklkVWhSQ3F0?=
 =?utf-8?B?YUUybzU1VlorVlRIeDNlRXIyR0hzbk1kQWFLNjZPTmN4YndpVEFRN21rL25q?=
 =?utf-8?B?WXRVZVl4Tjh4b1BOcmVsRCtUdUFwOFIwUGNkRXFwZXlBejR1SndJeGVKdmhF?=
 =?utf-8?B?S3RQbG54VUo4RDVYMVBKaExuVjFIRWpvdFY2K1REY01Jdnh3WDJBVTduOHgz?=
 =?utf-8?B?RGpSb2tQeUFRNktLMFowOXAzQVhiZHkvTWQvMmtKbVNSVEx2dDhVdG9YVnVy?=
 =?utf-8?B?cE13Q0drOXBVeVJOZ0J3ZUhJM1I5WmV1TC9EU3VjeUNiQVkvM3pMNlBBWTJn?=
 =?utf-8?B?UE00ZlJ4SzZxRVN2ZWdvNG9DWjZEQXNqdm96MlJRaHFKbUFXbXhSN2FtYVRH?=
 =?utf-8?B?WDhDbDFpeWRGNUp4U0RTcHdTdnREdTJWMytqL1YvblNGdlIybERHMXJCQ2d6?=
 =?utf-8?B?SjZ4RU1EMzZrd0U5c0puQklKZW51d2NwYlNYN3NUSnU0cHpQL0V4Z3B2S0ly?=
 =?utf-8?B?V1lEYmQyTDFPN3VaNWZ6SWtjaWJDU29OUUx1alJmL2EvUE8vaTVaYXM0N1Z5?=
 =?utf-8?B?cGhaL01uczRsNHRvSlRFSEUwWlJ0dEh6RHp3S1hCN0JJeWFtcWdvZkQyUEo2?=
 =?utf-8?B?dmFGQXgxOWFWN0lPZ0l5cGtWeXE1R01JOFhLSURqSFcrMDY1aDdaYjlpbGtk?=
 =?utf-8?B?T1dGdGlkZGx1eXFhb3lIaHZCRjFpWTZWS1BHZEtobWFnK1ViVkpCWko3R3dZ?=
 =?utf-8?B?TnJlVm5OSFNPU281Z1dxazRtNnkwZG9CVFFSWVdNbVp4dFVRSEUvM2lCME55?=
 =?utf-8?B?N1VaYkg3VTNJWkdWUERRenJYRG5UOHZ2dUF6Y3dUbWxJaDBuSFZURHdFbVRW?=
 =?utf-8?B?WDJIZHBGWUNSWEtFV0xxOEpFem9ZQkpMWnRHeS9tN2RyV0JMZ0JtaDRDRzUx?=
 =?utf-8?B?dU5IU1NxbS9GYWU1MjBES0RrYk56MFZpa01pQ2dHWGNEUm9qWlE4YmhTdklH?=
 =?utf-8?B?NERxK0R0eHFJdWM0eXBuditHRzNoN2lBcWpGejR0bUZ4aTFoUndnWFBBV21l?=
 =?utf-8?B?YUJZQ0pReXllOTViTXdJYmxmS25FRkMvNGFISDhIMFNMa1ZhUDgwTU43cVFE?=
 =?utf-8?B?WnNxd2RTZGg1VTJNTkdtbll6NVV3enJVM3ZQVE9zMmp5OUpTaUtjcEZCYzFZ?=
 =?utf-8?B?MmRRSXhUMlhvVnRoZFJMZTRRZzAzeGNseG1VamFIeHZCZGJYRjJLZnNTMnVD?=
 =?utf-8?B?WmVzUFg2MEZYZXM1VTY1R04rc2JFYUFVN3o0NmFIY0NOVXI3R1dqK01GWFI1?=
 =?utf-8?B?eGdpUVNzNFgxRjlBdXRKaW9ZbGJWUFA4MEpRdFMxZUY1L3owY3RsRkZiTGJa?=
 =?utf-8?B?ekhqQ2VQZmNSanVtcHd4Z0pXUlFHKzhEeDdXQTdCZEpZaVlmLytkLzVaTmZH?=
 =?utf-8?B?VkxtbmlRRUZWbGx4a09CVEpPeHhVQkpoWEFjZHBKVjI5c1pTZTk5V2NYRjQz?=
 =?utf-8?B?b1lZWFdXQ0JQQVpKZDZGVVFwQ1JWWVBjakt5Yll6V3V2S3J0RHJNQUpzNkZh?=
 =?utf-8?B?ZjFnTGNnc0p1ZTJ1WVhqK3J1OTdqUGl6cE11Ykt1OTFhcEhCZko0aVQvd0pN?=
 =?utf-8?B?THZOdTZydm9RU0J4Y3FCcUdOMG96Mmp4dktUOFVNTUNOZEl5UkxVNEhVc0tv?=
 =?utf-8?B?alU0MEIyWC9jZURFUTA5M2orNjYzcVBURVlTNWhObzk4Vjd5WWtDMkxDbnZM?=
 =?utf-8?B?VmI2bmtud3hqZHUwbDA0WStBcDNtd0hHTFE4bkowUGdTeFNKWTZ6dVlRY0RE?=
 =?utf-8?B?Y0pYa1c2TmRHM1laOXA3L1BlM3p0Wkg5bkNhK3FYQ0NzMXcvMkJON0NQdW9y?=
 =?utf-8?B?R3UzdzVmOXJ1Rit4ZVlaUCtNdHVvdXJEcFdXNG1rSUlKbldld2xFK0YzUnlO?=
 =?utf-8?B?VWtZYmVYL1p4SkE5Z1VEWVphekUyVnQwcWxRU1pSM0V4bStweENRbWxEQ25P?=
 =?utf-8?B?R3h6M3Fra01XNDhmOFFCR3FOUTAweVlSOHFZOURPODJHSUhpUCtLREhnKzBP?=
 =?utf-8?B?OTNwT05hVURtenkvQXQ4NDZiSzR4eENqVVkxbTdXVElCUlF2U2FhRmM4OWdr?=
 =?utf-8?B?L2dMWkhXZTR5ZVFXaE1aS1JUMFhKVDNFZk8vRjU2a2hmWUhWZHJ5S0Z5ZHF3?=
 =?utf-8?B?bGk2blhqVmk2SElodkZNZnJhRmRyTGxzNWJtY0wxdE0yLzJpNzZSVWttaTNR?=
 =?utf-8?B?V0hVRzg3TW42YTlpd2R2b1ZJSUVBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <197EA45DBF4478459331017313DF47C1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe7c372-b52c-430e-82f5-08d9e4add11a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 11:35:43.5474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3o/zo6pETlQWLKcnRqy/9Pw71aHW/dRYJgjw6OuIT+ChwTy30YORGmUe781vHzbFmxXTqZ754ewehJNmH3tFwaIrPb1lc7zs42jXon7iPw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2253
X-OriginatorOrg: citrix.com

T24gMzEvMDEvMjAyMiAxMDoyMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI4LjAxLjIwMjIg
MTQ6MjksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBJbiBzb21lIGNhc2VzLCB3cml0ZXMgdG8g
TVNSX1NQRUNfQ1RSTCBkbyBub3QgaGF2ZSBpbnRlcmVzdGluZyBzaWRlIGVmZmVjdHMsDQo+PiBh
bmQgd2Ugc2hvdWxkIGltcGxlbWVudCBsYXp5IGNvbnRleHQgc3dpdGNoaW5nIGxpa2Ugd2UgZG8g
d2l0aCBvdGhlciBNU1JzLg0KPj4NCj4+IEluIHRoZSBzaG9ydCB0ZXJtLCB0aGlzIHdpbGwgYmUg
dXNlZCBieSB0aGUgU1ZNIGluZnJhc3RydWN0dXJlLCBidXQgSSBleHBlY3QNCj4+IHRvIGV4dGVu
ZCBpdCB0byBvdGhlciBjb250ZXh0cyBpbiBkdWUgY291cnNlLg0KPj4NCj4+IEludHJvZHVjZSBj
cHVfaW5mby5sYXN0X3NwZWNfY3RybCBmb3IgdGhlIHB1cnBvc2UsIGFuZCBjYWNoZSB3cml0ZXMg
bWFkZSBmcm9tDQo+PiB0aGUgYm9vdC9yZXN1bWUgcGF0aHMuICBUaGUgdmFsdWUgY2FuJ3QgbGl2
ZSBpbiByZWd1bGFyIHBlci1jcHUgZGF0YSB3aGVuIGl0DQo+PiBpcyBldmVudHVhbGx5IHVzZWQg
Zm9yIFBWIGd1ZXN0cyB3aGVuIFhQVEkgbWlnaHQgYmUgYWN0aXZlLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFRlY2hu
aWNhbGx5DQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoN
ClRoYW5rcy4NCg0KPiBCdXQgLi4uDQo+DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvYWNwaS9wb3dl
ci5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jDQo+PiBAQCAtMjk2LDcgKzI5
NiwxMCBAQCBzdGF0aWMgaW50IGVudGVyX3N0YXRlKHUzMiBzdGF0ZSkNCj4+ICAgICAgY2ktPnNw
ZWNfY3RybF9mbGFncyB8PSAoZGVmYXVsdF9zcGVjX2N0cmxfZmxhZ3MgJiBTQ0ZfaXN0X3dybXNy
KTsNCj4+ICANCj4+ICAgICAgaWYgKCBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfSUJSU0IpICkN
Cj4+ICsgICAgew0KPj4gICAgICAgICAgd3Jtc3JsKE1TUl9TUEVDX0NUUkwsIGRlZmF1bHRfeGVu
X21jdV9vcHRfY3RybCk7DQo+PiArICAgICAgICBjaS0+bGFzdF9zcGVjX2N0cmwgPSBkZWZhdWx0
X3hlbl9tY3Vfb3B0X2N0cmw7DQo+PiArICAgIH0NCj4gLi4uIHdvdWxkbid0IHdlIGJldHRlciBo
YXZlIGEgd3JpdGVfc3BlY19jdHJsKCkgaGVscGVyIGRvaW5nIGJvdGgsDQo+IHBlcmhhcHMgd2l0
aCB0aGUgY2hlY2staWYtc2FtZSBsb2dpYyBhZGRlZCBhcyB3ZWxsIChvdmVycmlkYWJsZSBieQ0K
PiBhICJmb3JjZSIgYm9vbGVhbiBpbnB1dCwgdW5sZXNzIHRoZSBjYXNlcyB3aGVyZSB0aGUgd3Jp
dGUgY2Fubm90IGJlDQo+IHNraXBwZWQgY2FuIGJlIGVudGlyZWx5IGRldGVybWluZWQgZnJvbSBw
cmV2aW91cyBhbmQgbmV3IHZhbHVlcyk/DQoNCkkgY29uc2lkZXJlZCB0aGF0LCBidXQgZGVjaWRl
ZCBhZ2FpbnN0IGl0LsKgIFRoZSBQViBhbmQgSVNUIGNhY2hpbmcgbG9naWMNCmlzIGxpa2VseSB0
byBiZSBpbiBhc20sIG1lYW5pbmcgdGhhdCB0aGUgc2luZ2xlIHBpZWNlIG9mIEMgY2hlY2staWYt
c2FtZQ0KbG9naWMgaXMgaW4gdm1lbnRyeV9zcGVjX2N0cmwoKS4NCg0KaS5lLiBJIHRoaW5rIHRo
aXMgaXMgdGhlIHJpZ2h0IHdheSBmb3J3YXJkLsKgIEJ5IHRoZSBlbmQgb2YgdGhlIFBWIHdvcmss
DQppZiB0aGVyZSBpcyBvYnZpb3VzIHRpZHktdXAgdG8gZG8sIEkgd2lsbCBkbyBzby4NCg0KfkFu
ZHJldw0K

