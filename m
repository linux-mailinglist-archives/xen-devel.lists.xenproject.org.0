Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C17A4AF7E8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 18:14:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269388.463452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHqXH-0001v6-7M; Wed, 09 Feb 2022 17:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269388.463452; Wed, 09 Feb 2022 17:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHqXH-0001tG-4I; Wed, 09 Feb 2022 17:13:43 +0000
Received: by outflank-mailman (input) for mailman id 269388;
 Wed, 09 Feb 2022 17:13:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3wK=SY=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nHqXF-0001tA-UO
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 17:13:42 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f9d48a1-89cb-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 18:13:40 +0100 (CET)
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
X-Inumbo-ID: 9f9d48a1-89cb-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644426820;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0sYTaWKFTYZC4KzZ6woE5VPngvVRj0Uj5X8Zm8fqvVs=;
  b=P3lfXsykPQ2f9ODVAOevf35LoyvSN6laSs574GuKg6/CQkzI09xe219v
   Y5hvrutVVybMWKgApSw7m9TQ+G8rQQSy49Y1x/TfP4CSawJGT/FBHMkxJ
   EyJYfcJchrd2Ert6+/DCi3ZskMTgztjtgO5P0YuF0tN8H5skw15+0xKaI
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6FrHb4xFTDlZygUUy8I3k5Ww5sryw0wSKwBoK9yLdxgTqodww/8mSsuaECrcblWvSbh7WvLL4+
 PchM1obGrY5BFY9omhSXI78IRKBS1iOTbfnJE4wJEMFGxZq2LNrKJZBqMVneKp/D+lPGzvbgzd
 R1XkCGScPoYBAnDEvQsuy4DLXY0bGULu8FXt0p782KU+QRtcOG/wNsXpwogmLKsVWQl7RY9NR6
 0SUlKYoAcX9L5XWeGAXa87PtN7x3eTweYGDyOksMv3CRwxqPKu7P9sFj4458mssMFXG/QiZ1Ub
 a3XKIB/OBDXrUE9ODRhhloiq
X-SBRS: 5.1
X-MesageID: 64255030
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4EdaCqxpUV4CkzCrE116t+fVwSrEfRIJ4+MujC+fZmUNrF6WrkUCz
 2dOXTyFPPmLZ2PyeNl1aNi18BlX75XXzd8yQAA4+CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wbZo2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt95Bw
 +9InqW0cgF3GJf+uu4fCEYHFAgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoruYqKsStGYobs3VpyzzxBvc6W5HTBa7N4Le02R9u2poTQK6FP
 6L1bxJoSCiQaTYUAm0cFY5mkcm2v0i4dhdh/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfngifTSI8UUrqi+ZZCglee22gSAx0+TkagrL+yjUvWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalhAsUOBVONQ+0wfT7JDmwQybXTdbSRcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFROdfNi2+AswGzARN8wGCxFATpU
 J8swZf20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4MvGoieRs4a5ZdJFcFh
 XM/XysLufe/21PwMsdKj3+ZUZx2ncAM6/y5PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2TCDOE98tbgDRBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7dwhVdCNmXsCv8KS6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLMdsDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:1J39e67z3gqvv68nKAPXwWWBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhJU3Jmbi7Scy9qeu1z+873WBjB8bfYOCAghrnEGgC1/qv/9SEIUPDH4FmpN
 5dmsRFeb7N5B1B/LzHCWqDYpcdKbu8gdiVbI7lph8HJ2ALV0gj1XYDNu/yKDwseOAsP+tcKH
 Po3Lsgm9PWQwVxUi3UPAhmY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 j4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKv6/VXEO0aOSAWQR4Z
 3xSiQbToNOArTqDyeISC7WqkzdOfAVmibfIBGj8CPeSIfCNU0H4oJ69Pxkm13imhAdVZhHod
 N29nPcuJxNARzamiPho9DOShFxj0Kx5WEviOgJkhVkIMAjgZJq3MUiFXluYd899ePBmfUaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATxRlCvgYl7d1amm1F+IM2SpFC6e
 iBOqN0lKtWRstTaa5mHu8OTca+F2SISxPRN2CZJ0jhCcg8Sjjwgo+y5K9w6PCheZQOwpd3kJ
 PdUElAvWp3YE7qAd3m5uw8zvkMehTLYd3A8LAs23FJgMyJeFOwC1zydLkHqbrTn8ki
X-IronPort-AV: E=Sophos;i="5.88,356,1635220800"; 
   d="scan'208";a="64255030"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpsAC2lFIzilvZgjzt4i4n05QsacgYPx2EX1yzBCr6Qi5ETKp/cwF5QRB+GKOTGvClAawHH7x8tmbJusTK804pLoxai48u0hQdneiCje+ZUi3HvQeEqXB+Knd821ZzNrjwOL+/4/lqFnlaU/nw4eLGqInBqWChOLSOLbQnuSlj6SNrW0d0T0rlvTDXmmkjj8e9BVZFxvmD1UgR78WRy/JzPKy3v0F9TwnWVTYNw+5KW3dgIBAr3XqFU98HZOvjEWjvxBiDmAJT4RBDgTA7M0LMYNVFHERCQfjSfykdwrndMmg+7kYev3pg9OHQ+z4Xqrpq4VwUck2tjins2QZcqhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sYTaWKFTYZC4KzZ6woE5VPngvVRj0Uj5X8Zm8fqvVs=;
 b=aldYNWFbiY+NpHDWWLwrFIFHUxDoIw0fO+s5NxAtyMYps+DplefCn/whkY0nxzJJhJ74u9NiaobfJtZB8lCbmGmkMKCMGDq7O2mYzQ2FiH9jqk1TOIytMHvVz04Ck8tZKNUVV7BmrZe1ffxDKEA7TozEbZA24eOk0GvtYJyQxX0EArNrdWrVnozww5e9xoW69LX6UwpyM+xPs711MTXUErCSxmzC3T0YnQs+XHB7UTq2hQmS9Vv0EY73aZuCGDT/e0swHXEUp+xeRKNF7WN69JEofUCCIv6VtaIGjTowtEY1T5rwj9BFfHIbB6L7gddCAi0N/s8DcYCurQIjfdIuRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sYTaWKFTYZC4KzZ6woE5VPngvVRj0Uj5X8Zm8fqvVs=;
 b=SfyVzLSs5piWkzX39goAnEtOPVyxW1z6qSviGWRYmdh4L9/Ka+WIQOWhErGq5l0bGbxsgUUgsujPUhXggIG/9XiuuCUlUIzR1JjazqaXMAhpL616cwOiUMVFZnDJDZu+ooAvf4Wp37ZVygtieMxju1/wS37ibzIVxOsK597b4nw=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/dom0: Add log for dom0_nodes and dom0_max_vcpus_max
 conflict
Thread-Topic: [PATCH] x86/dom0: Add log for dom0_nodes and dom0_max_vcpus_max
 conflict
Thread-Index: AQHYHaBVLLQoAjzhjUW/NIePQEslT6yLF5CAgABd44A=
Date: Wed, 9 Feb 2022 17:13:30 +0000
Message-ID: <8b4febfe-38dc-f156-5a06-0ea5f14edc50@citrix.com>
References: <20220209103153.11391-1-jane.malalane@citrix.com>
 <4c44dea8-920b-6169-0853-01e18e89db94@suse.com>
In-Reply-To: <4c44dea8-920b-6169-0853-01e18e89db94@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 975f290b-f28a-45be-52c6-08d9ebef7ec8
x-ms-traffictypediagnostic: DM6PR03MB5212:EE_
x-microsoft-antispam-prvs: <DM6PR03MB521271D87E9068B9F1FA673F812E9@DM6PR03MB5212.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8fvGeL0Iy4KlBjU5ERP7Fwm7xrdXs7GB0goitlFPGAqlGy+UbJo66PFMUh93bSUjRViS5zWZwHTsZgOe7p7iYotxGFwfwPtfAAcuxAeFJODGIhnRSEViShCcFWf4tW/4jqQo1w3BCRPnojptUuGJ8dACa7RVuqnXkUa4omZNJG85TfiyeiYfAoxTOKhfc+e2ILZmJqcwMWpn1yOxEuatTmSce+i0Pr/QMiz5LMNc/56X+4L8U1B+Zaa9HXpS7qYsRIjHvP/ayL81X9n/SpKHSGoegXZmF541KBkrhDaPioHP/9HQ54FAlrEZqoV7BVRdPLu+YwRBdPpzkCTXzDPRWuXwvyDWAFKnm2pucWZdhFbXyLmlkBcm/Rb7XLjwTyZe2Xp1xd2QxhCl6mi1lQkP6FIYWTnkwXi7u899VYonryoSWPkR40l5qefofqdSUQZlUQ2MAR5xyt/OEFCij+NDsQ/wt/65xdTsK8nYSObQ5EIpEPUs9stPnEq07PLqOQjxASMVTMF49k8GlLTrTDPezSZXLTHkmk4S/5AqXZiItbjnA7QyTFXK5IORkXYwuj9Mr2ADYbcCgaGJAXUwi1W73pdykBjLUnqYUfnkKff8vts+4SG7FNOBos0jfixhlRy33MpIVBA+JefBqax9OeWIzUfq6ZkxrjbcpGexSJPppv3EFI7dbxbc/Kv3g9T+uyx/yT564QgeJ1mXp9D8tF8z+lYcI6LUzinKLwn/TYaAe7APVGTQ3Dv/LZj/LrD7nlf/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(54906003)(53546011)(6512007)(6506007)(26005)(83380400001)(2616005)(186003)(122000001)(71200400001)(6916009)(316002)(4326008)(8676002)(8936002)(5660300002)(91956017)(66946007)(76116006)(66446008)(66476007)(66556008)(2906002)(508600001)(64756008)(82960400001)(6486002)(38100700002)(31686004)(86362001)(38070700005)(31696002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXlodWxuUlJOMGFieTNFMjBrdWNNd0JuRVFaUGhjTnFCWmNJN3dyZ2xSbzI3?=
 =?utf-8?B?UFozTENCa2VPUU5MWXdRbU5HdEI5Smo4VXY4SlF5cmRLamd4SlZNM1VYNnFN?=
 =?utf-8?B?Wlc1Sjg0bVVQTFlzU1U1OG1hOEJDUWZQYlcvanRXZzQzalVCWkdPRzI5amJQ?=
 =?utf-8?B?bnVwNHVvNkVSNlpWMStuY0dFWklBTC8wMnN0V1hIQ2JOcklabUxiSzdoMzZU?=
 =?utf-8?B?MUFSRXA5YU52aXcydlpsU2Ntdm9lbmdZOU1XcUczYVZqRnByT2hwb2luMnJl?=
 =?utf-8?B?Z1VaTjhRSi9rSUNkaFFiREFoWXEvWVNmdnR0bGNjVjVOajQ4bEdrLzVYQVc1?=
 =?utf-8?B?R09PaUlzMWVzMkN1aW95RDBjU3g5N2dxTGtNMHdpZmxJOHJlbk1uYS9LeWl5?=
 =?utf-8?B?ZE1nUVJTYkZoYU5GSjBMMGZKNXpKcEt5bDZ1R1o5WFhyOG53REtJU3ZrUmY1?=
 =?utf-8?B?aUIrN2lBRzhScXlFYVFubTB4UWJiZXN0UHI2ZFhzZW1mU3AzQ3pKeGVSOGlL?=
 =?utf-8?B?cW9pYmdYYitja0ljSVdNWVdJcEpCMEpPTWJ0cFFqd2lKQ0lrT0ZENHRmM2dN?=
 =?utf-8?B?NzhGOHV3ZXRPRThDK2pZWkhaaEY3Q2dkeEVJbmdjK21xOWNwajgwSExHYUpw?=
 =?utf-8?B?NVZTRGhnU2ZjS1dtNWVCT0FzZ2FhQzN4ZEJDOXdCUXhEVzAza0ZTaDVQZmJC?=
 =?utf-8?B?SmNYeGsrMkVoR0prUkNsV2FvY0hpSjdVVjNrU0YyZUo4dEZRRDlKaC9sTWtY?=
 =?utf-8?B?Sml0cU9iZTU1NFk4QmZ1SFpjWUxGeG1ENmQxK0xEVlBtVEdLZm9HaXVRNytZ?=
 =?utf-8?B?dVJHdi9KRER0d0Y4aHFSVzMzbFpKQnVRZzBhV2xuVm1Bb244S1ArVXJJM3p3?=
 =?utf-8?B?NzBIM0FwaVZVSFJ4enV4R2J4aVdoT2MrVkFVMFg1NkZqang1blhwdTkrY0U4?=
 =?utf-8?B?ajNza0JZdnhtQU5UR2pJYVNCY241R3pVTlFIWEI0WE4wMkxndHVmSjE2N0ly?=
 =?utf-8?B?RjRrdUtlVlV5Z04rN2Z2Nk5MMXhWTkNROU9Sdml1OVg5Q3A5WVUydE1Sb05s?=
 =?utf-8?B?UWhZdjJWMk8yajIrQ2U2UGx6YVQ3b2ZmUnRmMTZBeDhLMWVJTytrNGxUUVVa?=
 =?utf-8?B?ZWl1V1E2QWN4VitxS0s2aVBhdW1YZUtXMk91bUM3ZjUwY0tIbnlsbU52MHBP?=
 =?utf-8?B?ZmtCQ0VPUEU1OTNpa0pFMDlTeHZMeThjeUw2TCtOb1lMZ0RGaTIvOE9qWHEy?=
 =?utf-8?B?VWNhYlE4VDZEalM1QmNJR3E4Ri81YSs5VUhISXVJUzFmVXBaamlZT2ZZeHZq?=
 =?utf-8?B?YTlVeEloazNUMDVKOGVVSEg3QWhtdkY4cVJPT2JzcEVqMmxiNXNOSTJlb3Fi?=
 =?utf-8?B?SElQRXpwdENZemUyS05CdThyYmtFakNQVlhZUEhmb1BLZTFMU29mN29NVnNO?=
 =?utf-8?B?SlpuL0w0MkdCODNRYlR3cElIcFFpSURZMTVNT2sxdzkrNVNuQUliSHB4L3JF?=
 =?utf-8?B?aWRWL1RpdElWQlBTcTkxV0dHWjduZWF1N2RVbmtkeVBUQmFYd3AxTXd4OUNE?=
 =?utf-8?B?MWpYWW1rN1BHczQ4dVZlUHMwckxJVVU3UTAvU2xlY1QzS1VZSVpsNGxMbTdy?=
 =?utf-8?B?WVp5MnFUWlI0K3JucVZtZEZ4ckN2d0ptWWQ4ODcyUVgrNlNzY0g0U3RFSVBw?=
 =?utf-8?B?aUZvRmg5TXdyWDJRa1BseVFlNVlzWlZ3WlRjQm5HR0JEWWdJMHRsdENHcGI2?=
 =?utf-8?B?dkRHS010K0tqcU5uY3FsSEdBU1dROHhhMGlIZFlDS0FGNWp4QlZmalIzZm1J?=
 =?utf-8?B?dGtwRmkzd01veVhaZFBnb2Q4NkdSc2F6USt2WVVzZXp1K3M1Vm5KV2h2Sk4y?=
 =?utf-8?B?UTREdkFEdDg2NVprdzk3YmRaZUYwNDFZbVhOTnVBZFFPUVdGQVJNdFB3QVB2?=
 =?utf-8?B?d2pMdTNEUVZTQmd3cWIvOCtjU1Z5N2ttWjJqQ0Z5VDU3bjhCQ3dtcnlQbGFl?=
 =?utf-8?B?aE9iNzJFZVdGQU9Za3RwMU1ZNlhQSEJYUDl1cjcvRSsvaEJRb0FQUTYxOVNW?=
 =?utf-8?B?TXo3V00zdHFNdzhCb0tnYmxCaDRuRS9KOWpiY081eFg2MFZkSStKWm9uVzBk?=
 =?utf-8?B?MmpmN1ROVzAvVjB2UlowVmE4ZWNsQUVXUUMzWmhsTGpSYy9VUFB3M1NlWWR1?=
 =?utf-8?B?aHBMck94QkxXZHJ2S1RobFVBY2d4eG9DcW5RYVFBWVZIOGdsMkdaWTNycEVL?=
 =?utf-8?Q?fxZOi24rtNzvLjJSUKZDGLtEiMQIvzqsTRrJhO7cvI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1822837138CD334EA18BDA3793A1EF97@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 975f290b-f28a-45be-52c6-08d9ebef7ec8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 17:13:30.5310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3vJ4S4m8bOk8VuNgknBdSYS3d9RbxSfTiNQgg7OH9fUVEqi0nMalBJiNG4k3EAV8BBbKGtSznrBiWDRM2LDw3mNg05ZDpNPr4Dm8qgYg30E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5212
X-OriginatorOrg: citrix.com

T24gMDkvMDIvMjAyMiAxMTozNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFtDQVVUSU9OIC0gRVhU
RVJOQUwgRU1BSUxdIERPIE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZS4NCj4gDQo+IE9uIDA5LjAyLjIwMjIgMTE6MzEsIEphbmUgTWFsYWxhbmUgd3Jv
dGU6DQo+PiBUaGlzIGlzIG5vdCBhIGJ1Zy4gVGhlIHhlbiBjbWRsaW5lIGNhbiByZXF1ZXN0IGJv
dGggYSBOVU1BIHJlc3RyaWN0aW9uDQo+PiBhbmQgYSB2Y3B1IGNvdW50IHJlc3RyaWN0aW9uIGZv
ciBEb20wLiBUaGUgbm9kZSByZXN0cmljdGlvbiB3aWwgYWx3YXlzDQo+PiBiZSByZXNwZWN0ZWQg
d2hpY2ggbWlnaHQgbWVhbiBlaXRoZXIgdXNpbmcgZG9tMF9tYXhfdmNwdXMgPA0KPj4gb3B0X2Rv
bTBfbWF4X3ZjcHVzX21heA0KPiANCj4gVGhpcyBpcyBxdWl0ZSBub3JtYWwgYSBjYXNlIGlmIGEg
cmFuZ2Ugd2FzIHNwZWNpZmllZCwgb3IgZGlkIHlvdSBtZWFuDQo+IG9wdF9kb20wX21heF92Y3B1
c19taW4/IEJ1dCBtaW4gYW5kIG1heCBnZXQgYXBwbGllZCBsYXN0IGFueXdheSwgc28NCj4gdGhv
c2UgYWx3YXlzIG92ZXJyaWRlIHdoYXQgd2FzIGRlcml2ZWQgZnJvbSBkb20wX25yX3B4bXMuDQpZ
ZXMsIEkgd2FzIGp1c3QgZ2l2aW5nIGNvbnRleHQgaGVyZSBmb3Igd2hhdCBJIHNheSBpbiB0aGUg
Zm9sbG93aW5nIA0Kc2VudGVuY2UuIE1heWJlIHRoaXMgYmVjYW1lIG1vcmUgY29uZnVzaW5nIHRo
YW4gaGVscGZ1bC4NCj4gDQo+PiBvciB1c2luZyBtb3JlIHZDUFVzIHRoYW4gcENQVXMgb24gYSBu
b2RlLiBJbg0KPj4gdGhlIGNhc2Ugd2hlcmUgZG9tMF9tYXhfdmNwdXMgZ2V0cyBjYXBwZWQgYXQg
dGhlIG1heGltdW0gbnVtYmVyIG9mDQo+PiBwQ1BVcyBmb3IgdGhlIG51bWJlciBvZiBub2RlcyBj
aG9zZW4sIGl0IGNhbiBiZSB1c2VmdWwgcGFydGljdWxhcmx5DQo+PiBmb3IgZGVidWdnaW5nIHRv
IHByaW50IGEgbWVzc2FnZSBpbiB0aGUgc2VyaWFsIGxvZy4NCj4gPiBUaGUgbnVtYmVyIG9mIHZD
UFUtcyBEb20wIGdldHMgaXMgbG9nZ2VkIGluIGFsbCBjYXNlcy4gQW5kIHRoZQ0KPiByZWFzb25z
IHdoeSBhIGNlcnRhaW4gdmFsdWUgaXMgdXNlcyBkZXBlbmRzIG9uIG1vcmUgdGhhbiBqdXN0DQo+
IHRoZSBudW1iZXItb2Ytbm9kZXMgcmVzdHJpY3Rpb24uIA0KTWF5YmUgSSBzaG91bGQgaGF2ZSBz
YWlkICdEb20wICJyZWNlaXZpbmciICVkIHZDUFVTJyBpbnN0ZWFkIG9mICJ1c2luZyIgDQppbiB0
aGUgc2VyaWFsIGxvZywgaW4gd2hpY2ggY2FzZSBJIGNhbiBhbWVuZCB0aGF0IHRvIG1ha2UgaXQg
Y2xlYXJlciANCih0aGF0IG9mYyBpZiB3ZSBzdGlsbCB3YW50IHRoaXMgY2hhbmdlKT8NCkkgdGhl
cmVmb3Igd29uZGVyIHdoZXRoZXIgdGhlDQo+IHdvcmRpbmcgYXMgeW91J3ZlIGNob3NlbiBpdCBp
cyBwb3RlbnRpYWxseSBtaXNsZWFkaW5nLCBhbmQNCj4gcHJvcGVybHkgZXhwcmVzc2luZyBldmVy
eXRoaW5nIGluIGEgc2luZ2xlIG1lc3NhZ2UgaXMgZ29pbmcgdG8NCj4gYmUgcXVpdGUgYSBiaXQg
dG9vIG5vaXN5LiBGdXJ0aGVybW9yZSAuLi4NCj4gDQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvZG9t
MF9idWlsZC5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jDQo+PiBAQCAtMjQw
LDYgKzI0MCwxMSBAQCB1bnNpZ25lZCBpbnQgX19pbml0IGRvbTBfbWF4X3ZjcHVzKHZvaWQpDQo+
PiAgICAgICBpZiAoIG1heF92Y3B1cyA+IGxpbWl0ICkNCj4+ICAgICAgICAgICBtYXhfdmNwdXMg
PSBsaW1pdDsNCj4+ICAgDQo+PiArICAgIGlmICggbWF4X3ZjcHVzIDwgb3B0X2RvbTBfbWF4X3Zj
cHVzX21heCAmJiBtYXhfdmNwdXMgPiBvcHRfZG9tMF9tYXhfdmNwdXNfbWluICkNCj4+ICsgICAg
ICAgIHByaW50ayhYRU5MT0dfSU5GTyAiRG9tMCB1c2luZyAlZCB2Q1BVcyBjb25mbGljdHMgd2l0
aCByZXF1ZXN0IHRvIHVzZSINCj4+ICsgICAgICAgICAgICAgICAiICVkIG5vZGUocyksIHVzaW5n
IHVwIHRvICVkIHZDUFVzXG4iLCBvcHRfZG9tMF9tYXhfdmNwdXNfbWF4LA0KPj4gKyAgICAgICAg
ICAgICAgIGRvbTBfbnJfcHhtcywgbWF4X3ZjcHVzKTsNCj4gDQo+IC4uLiB0aGUgZnVuY3Rpb24g
Y2FuIGJlIGNhbGxlZCBtb3JlIHRoYW4gb25jZSwgd2hlcmVhcyBzdWNoIGENCj4gbWVzc2FnZSAo
aWYgd2UgcmVhbGx5IHdhbnQgaXQpIHdvdWxkIGJldHRlciBiZSBpc3N1ZWQganVzdCBvbmNlLg0K
WWVzLCB0aGF0IGlzIHRydWUgYW5kIHRoaXMgY29kZSB3b3VsZCBoYXZlIHRvIGxpdmUgb3V0c2lk
ZSBvZiBkb20wX2J1aWxkLmMuDQo+IA0KPiBUbyBhbnN3ZXIgeW91ciBsYXRlciByZXBseSB0byB5
b3Vyc2VsZjogSSB0aGluayBwcmludGsoKSBpcyBmaW5lDQo+IGhlcmUgKGFnYWluIGFzc3VtaW5n
IHdlIHdhbnQgc3VjaCBhIG1lc3NhZ2UgaW4gdGhlIGZpcnN0IHBsYWNlKTsNCj4gaXQncyBhIGJv
b3QtdGltZS1vbmx5IG1lc3NhZ2UgYWZ0ZXIgYWxsLg0KPiANCk9rYXkuDQoNClRoYW5rIHlvdSwN
Cg0KSmFuZS4=

