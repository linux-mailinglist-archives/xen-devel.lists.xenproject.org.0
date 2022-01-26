Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705AD49CA19
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 13:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260891.451108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChoc-0001OT-R7; Wed, 26 Jan 2022 12:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260891.451108; Wed, 26 Jan 2022 12:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nChoc-0001Md-NM; Wed, 26 Jan 2022 12:54:22 +0000
Received: by outflank-mailman (input) for mailman id 260891;
 Wed, 26 Jan 2022 12:54:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nChob-0001MX-5O
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 12:54:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12790776-7ea7-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 13:54:19 +0100 (CET)
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
X-Inumbo-ID: 12790776-7ea7-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643201659;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oxuVZUXvILbGGCssNUdc13jIPVxk4iTBXbaHex86mY4=;
  b=D/Jyr5U5h8I0ZEvJ8wqyYo2SjW0bIxqeC+Y4cKjwLyWs3QQRguhaPLgO
   71iww01t61+9sDs/x3z0nvXHkwxgeqXKXmtFDd+NTSuYXqaHHRVyIeXh4
   z/Gr5iA0MPkIg2GKbQ8Qhv1IF/szQmdIRFTOxRlQguuU7d/Hl+s/XXco4
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: A9cAfWMsuSvleCITOpN6BB7cevgpgLwjTYlTWxwnP7a5tkYN3avJ/kEd/TTztP5Hs+lIetseAY
 J+6EAcZXNaFLUjhyYL/mRip6CaHs0ofHnkrlepo/gp/K2+//Eq5AXH4kUQUQRrVZzKtwwhvoz5
 fxMh09I9Dh8JHSf3kB2fiCRFST3aGGWtB5OnScI0uws4OSIMi2lbVZ+J1DhCYFSxJ/wNF39GQX
 FmPkgGVNGGtoNtVyyO2suqx8bo3RdRa0c5eGzYk7ooO46aRh2Hh9PNBcxCRMjrMqE7noPjMU25
 x4DVhD08yRLnS93ZMMMxQeLb
X-SBRS: 5.2
X-MesageID: 62712488
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QF/0Wq0CAFAEF4c/gvbD5T52kn2cJEfYwER7XKvMYLTBsI5bp2cCz
 WMcWGqBO6qMMTD0Ko9/b9jj/E4P7J6Hy4QxQAZppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wbBh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhv/Au4
 vlL8rKLFQIAP7biisMiDygfHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u3J8XR6qON
 6L1bxJuNTD8Mwx+JGsnEbQuntWRuSDmcjxx/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 kDs8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalj48BPB8FaoU012I46vPzRS+OTQ1CTEUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRON/Ni2+AswGzARN8wGCxFAjpU
 J8swJD20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mu2gleRk1bptUJlcFh
 XM/XysLtfe/21PxNcdKj3+ZUZx2ncAM6/y4PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1gmQv7GM6qpzz6gev2TCPEEt8tbQrRBt3VGYvZ+m05B
 f4FaZvTo/ieOcWjChTqHXk7dABTciNjVMmo8qS6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLMtsDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:+HGXdK35azxRLiJmVxDw7QqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,318,1635220800"; 
   d="scan'208";a="62712488"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1FsxQtE2+R+ISLd3KGC9NUSZh2GwS5XBZA+XoF0xXEKqGRyShCh0uAUYBkyN7gh9ydc4kvWkYtL14hSiw5a8HHjJzsNtPpzSYuIQ9yfj2KuqjOP95QEwA0nhZtT1xvEYsh+WgQ+YiMcmwzw2DYONrNp3oG98+FZFjzpA+6Jx52MK+2HNe2S173h0lignRwZrlY7bUZc/OdFtW4S/zVxQNPkYW8EsbOJylEI+DU81SUMldJEkYGaTSdEm3tDMr0hjtAuRAE4kCQYIPmxjsd/Q1PCBLJbWPtmsEzEw8+ABS+DgY4Zo4AwQWv+f+xUXc+MKpSY+ujGAo3sfTK+HlAKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxuVZUXvILbGGCssNUdc13jIPVxk4iTBXbaHex86mY4=;
 b=O461i7g19yQO2mipFBrCvsb8dZTIc55SuXlwcx158Uoc//KDNyITh8x57fKTAABSOYo73ttoxfx0W2KK3ap6Lv7e9bnNKTCHpjqkZK2OtS1Sw8bQRQfmToDUVY35onwcEjiAq4VKuh5jAyht3PDjAIiYz1ze01d2T1wwW/OgnPwILOWgLsXVJzBFJ7hF0dBAh7FlUQhs/CWpX0A6yQ5teZqf0wXBJXUlemmnR2TLqplpBSRpajBCrn7HFfUM/ZP0P2lwJZZgjmmjAmmfha8I9NjlFOGGB2syux8OU+VX7qCNHP3v9s7iT4PwZ4ZUjsPwFBKiDb8rPa5qXZl+ca3brw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxuVZUXvILbGGCssNUdc13jIPVxk4iTBXbaHex86mY4=;
 b=NR4Gz6X0VhKIylUeT/Y6OwmsdXjegL158ONKWtXwS1uwAGHwBes/6tqxxGk8WLRAq6GPfiT1Mh5gVAwBFVYCugjzx1FZTsREqTyZgY49lYdqC/ggHxhPHduUQeD0Y+AXTfU1l/OPYB0qpmO/kPQ+XKN6cY/Vx/8N/Lh2aXfNvoE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/8] x86/msr: Fix migration compatibility issue with
 MSR_SPEC_CTRL
Thread-Topic: [PATCH 1/8] x86/msr: Fix migration compatibility issue with
 MSR_SPEC_CTRL
Thread-Index: AQHYEpES7gvScC69dESW9o3ZnqmjH6x1ODuAgAAKRgA=
Date: Wed, 26 Jan 2022 12:54:14 +0000
Message-ID: <089c379d-5603-53b9-69ce-eb3ad83c2e26@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-2-andrew.cooper3@citrix.com>
 <YfE71yLhvV9W7GT+@Air-de-Roger>
In-Reply-To: <YfE71yLhvV9W7GT+@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ca21b40-ca3f-4663-cce6-08d9e0caf4ef
x-ms-traffictypediagnostic: SA0PR03MB5626:EE_
x-microsoft-antispam-prvs: <SA0PR03MB5626E70CBAE88924D9795801BA209@SA0PR03MB5626.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0R+DkMDIlDYQLXXYe+eceCkPDnkxtAKxkoQ5NgiQpwgZY+lVklzbvIJJJhUXr8+ozT1AaklL9lwkBj6a6ca0ueEf15kGKngfshHyPMyjXCW61z6bj23iQmX+gIm5pBkv9qd5gY6u+lx3uHsj1XB2sT8tKLzKBrUN3ZNH/4waM932nASt959YOJ90npo4dlOsR1X+EYSm8Go9/0y7bvcpig/+JLPI4mCPCHu+L7HXRUX9mFTjB9KjKpRYX9chhxFlu/XRf+qcORDfTRr6Y5OYJGlhqySbCf/212c7ip2VFqMcbK5S4n9VtOY3oyNt6nv3EoV8KEjgkfLDKNh4KgbCy/JJD8/efPqkci7Qi2nFy2UE/F2feJyyMUCLncyCfLXRtE2QipSYUDJv7ZcQ7ynRzGEgMp9KisQgy1Qc5bxJSvRCoa//agML8vUTrSfWkUfGk8s+GSR3LS8X7EkrvYouPg+YiJ/Ahb1ONDfUHREIep5mSqufdoeZRX1TzYEJkPoIVOwaT2JRWPhHweXZ5D80AVp3MHiPmqGg2Ci8WBkSIAP7bcifLCfm6UNpnjzPqBWkYCgUW+RrhV0kLmIpaXV72XF2s5Uo9McH3/Zao2cOeASfksEe04ayuwKpj3L4ACapiFKkodZ3BtIJf24lTvhMor3FcRtU44TzwtMknIQ07wMxK6wdOhGnrK9eNso6OG9M7RzDMVP+aPtuag2tvPI+yJzd77tRw6A9Gqc5J2ZT8JLpyStuF/rO1sUP6qDDKMrs4QS0N1H0A87h1ohNs2/o7Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(6512007)(6506007)(38070700005)(8676002)(82960400001)(86362001)(53546011)(31696002)(2906002)(5660300002)(38100700002)(6862004)(4326008)(8936002)(37006003)(6486002)(36756003)(54906003)(83380400001)(26005)(508600001)(91956017)(2616005)(76116006)(66946007)(66446008)(64756008)(66556008)(66476007)(186003)(71200400001)(316002)(31686004)(6636002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXNlZnEvYW5UVVB2aGZvaVc0d1k5YW5KRlZJSkx3aGttcGZOYy9SUWlwN3k3?=
 =?utf-8?B?Vy8vdTRMU051SlprVFc1Vk9nWlo0NllaMmxSVW83dG12RHVMcEQ1Zk1wSG9O?=
 =?utf-8?B?R2hEbGFsaVNQTDd4aEQzd2Z6bFdMTVFPUHlNdEFEbkFYbzVqWGxWRWxmOUZJ?=
 =?utf-8?B?VG00RkkzRFJtcG9jL2I0RUxWOXRoZ0lzc201dzEwTFhjL3kxTGNMSmdJcFNr?=
 =?utf-8?B?elJqN0NHVWVLS1hyc01abGJaUi8wTnkxWGlwaXZVcHBzUG1EYkN5ZDl6M2tJ?=
 =?utf-8?B?NmxsMDJyMW1JK3JQZktqVTJvRWRhMitUSGxZOW5FT0czbXpFM2xhM0FPbmhK?=
 =?utf-8?B?OG10c25DZlpzRExTVUNzSEdoamQ2bXFZV21wYmdMT0VEcW5YaVpwc3VBemNW?=
 =?utf-8?B?T0xjbzJFZDV6TFI0ZXRWUmJQcDQzYXhIRmg2TkZuVHVhb2poUzBzeGNTZXhQ?=
 =?utf-8?B?UTZXWCtsZXlRUEtYVnphbnVvL0J2S3gySjV6SFdVREZJUytxcklOYmpIUDFS?=
 =?utf-8?B?VUVjOUluVTc1aVJBZURUTUFtTTJBelpYM1pzQ3cydGcvVmV0ZkdHby9LK3pL?=
 =?utf-8?B?N2g5MlBXUkhWaTNUZWVFMEh4K0oxeHhMYzFGbEV3NmhGMWNCdHU2by9CNTFj?=
 =?utf-8?B?NkZhMVdobnJZSjUxbWpTdDVncXZ5emJaSlBDRFFCK2pVSGxIbEdQSVFYWW4z?=
 =?utf-8?B?aHZldW5ncVFpUkhlSElxem83elQ2RnJQbFJQdmVmeFJlOGpndldYWkVlUFVZ?=
 =?utf-8?B?d1g2ZGJ1N29rSnBvcVpoajB5NWl5TEFwbUgzenJPcmpXREYrODY4ZjIrUTZr?=
 =?utf-8?B?cDVkOVlmZFh5Yyt6TmpLZlJwOUxXRDh5SVpkYmdlem9yTmEybEdJd013MWdX?=
 =?utf-8?B?SjBBeGpxUU1hUG5qeGhwOVdmeFJneElSU0hzck50Nml3QlM0aDgxOStaaVNx?=
 =?utf-8?B?VnFXTHUybG5VU2creXR5TnBqU0pWUzZocWxac1R6WGlwSzNVbFRlVkV6bW5Q?=
 =?utf-8?B?eUNwWGVKK1Q4OWFJUGNiMVQ3Q2J4ZDljbWdhVkVWamlCbW1CbEtLbzdPRm9N?=
 =?utf-8?B?U3lXODBnM2NDV0lyRXhGZ0hpQWJnUW5PV0s0WFF1TnF2Ym1zVDI1YWxBa2s5?=
 =?utf-8?B?Mk4yWEtaUS83OFhVNllrQlp6ZzRuZTdSaXB6MnJQK0xqa0YxNnlKUHljUVpz?=
 =?utf-8?B?VWE4TjNNd2ZVdFp1NFJ6bk5Ic0RtRGhYL2QvZmQra3JOUjBFQ29pYmY4TDNU?=
 =?utf-8?B?MTUzRWl0a3FhTUlnaVY5ZU5zRGNqak1ubytiRHYxRjhtaUIrSVlNYnFDT0VF?=
 =?utf-8?B?WktadmtYeU5oRVd0SUV2TkhWRzAyNjNJY1hmSUdCUDZnTnVsS3E0VmpHQm9p?=
 =?utf-8?B?cUE1MmNhVmdCRlNqQ09CUTlXRDNYNkJlRHlwejZMN3lRVVFpMGJHUEFZaHFo?=
 =?utf-8?B?Q3ZxN2xxdm1CTU5aNjF5Q3N6TE4zUGwva3BWZzhyanluVGdpR0llWHJSMFRM?=
 =?utf-8?B?YWY2MUpFRDMyMWpIOHlNU2FYMW9zRG9vRzZFdisveitGT0NJbWorc2Nhdytw?=
 =?utf-8?B?R21ISDhXUkRJQ3BWMDdOazZIV2J0NGQvNndDSVFWQTluTjhsWTRQL2hDYjVZ?=
 =?utf-8?B?UE1yNTV4RkFTSWVJMm1wMHcyczRFNzFNOWxOODlUQUFacXdQaGFpOXlQcTBH?=
 =?utf-8?B?cjVoa3ZXaDdoNDk1Nk1Odlp4SmFJZHBtVmgrMzVkSmd1bUlwVFQyZEJ0ZnFp?=
 =?utf-8?B?OXZUY2NERmFiMjFlbVlVWGFCYmpzU0NXMDNtRVZqaWs1VDg3MTAzWWhZdURr?=
 =?utf-8?B?QXM3eVl0SVh1R2pkTWMvMER6TmFVb2MxUmxYUTdCMU5ka1AyVlVhTmROVFE2?=
 =?utf-8?B?TnFtODBHTGQ5WUtPRHFrZFpidXh2WUpCaDF3UCtDaFZwSXpOSXJuR3hKbmw4?=
 =?utf-8?B?bFhQN2Z6Ui8vbTNrckZ3QkZMVDMyVWdoYWFJU0UyZnlKZURaOW9XK3NGUEpG?=
 =?utf-8?B?VTMvRDNtQXowOWdMS2hUMkNLQmhjYUFhUnRsdTZMUzNoTERlTFZ5K0lNQ1hn?=
 =?utf-8?B?cUg0K3FhYzlvY2VacXJsRzl3ZmQ4cXVmZzNxVklaNUplNFNERG1aTmQwVVJ5?=
 =?utf-8?B?djBmY1N0dE9oeERzUStoSjF3eENLK3ZJQVhvdGtWSGhGWFBZY1JQZ0V0QkxH?=
 =?utf-8?B?Y2dNcDA5QVNKSmY4a1ZqcXpWRDVvWDJKeGFFU2tBSTU4L3RqNFBIWVREWFcy?=
 =?utf-8?B?b3ZQbk8vOURHcjBGQ2NZSTZkV0RBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A05EF938D17C0D4092C182029A91FAE9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca21b40-ca3f-4663-cce6-08d9e0caf4ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 12:54:14.6070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EHod3yJ8BYQqIZQoJqzpXwtinS5MLb55f4nifv5ImtrBCApSSyQR/CFrJ/giiwISL4j9cMzqB7rwewgAuSCJ3kyXhvYNNGIHmSHo+CivyaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5626
X-OriginatorOrg: citrix.com

T24gMjYvMDEvMjAyMiAxMjoxNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBPbiBXZWQsIEph
biAyNiwgMjAyMiBhdCAwODo0NDo0NUFNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL2h2
bS5jDQo+PiBpbmRleCBkN2QzMjk5YjQzMWUuLmM0ZGRiODYwN2Q5YyAxMDA2NDQNCj4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMN
Cj4+IEBAIC0xMzc1LDcgKzEzNzcsMjYgQEAgc3RhdGljIGludCBodm1fc2F2ZV9jcHVfbXNycyhz
dHJ1Y3QgdmNwdSAqdiwgaHZtX2RvbWFpbl9jb250ZXh0X3QgKmgpDQo+PiAgICAgICAgICBpZiAo
ICF2YWwgKQ0KPj4gICAgICAgICAgICAgIGNvbnRpbnVlOyAvKiBTa2lwIGVtcHR5IE1TUnMuICov
DQo+PiAgDQo+PiAtICAgICAgICBjdHh0LT5tc3JbY3R4dC0+Y291bnRdLmluZGV4ID0gbXNyc190
b19zZW5kW2ldOw0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICAqIEd1ZXN0cyBhcmUgZ2l2
ZW4gZnVsbCBhY2Nlc3MgdG8gY2VydGFpbiBNU1JzIGZvciBwZXJmb3JtYW5jZQ0KPj4gKyAgICAg
ICAgICogcmVhc29ucy4gIEEgY29uc2VxdWVuY2UgaXMgdGhhdCBYZW4gaXMgdW5hYmxlIHRvIGVu
Zm9yY2UgdGhhdCBhbGwNCj4+ICsgICAgICAgICAqIGJpdHMgZGlzYWxsb3dlZCBieSB0aGUgQ1BV
SUQgcG9saWN5IHlpZWxkICNHUCwgYW5kIGFuIGVudGVycHJpc2luZw0KPj4gKyAgICAgICAgICog
Z3Vlc3QgbWF5IGJlIGFibGUgdG8gc2V0IGFuZCB1c2UgYSBiaXQgaXQgb3VnaHQgdG8gbGVhdmUg
YWxvbmUuDQo+PiArICAgICAgICAgKg0KPj4gKyAgICAgICAgICogV2hlbiBtaWdyYXRpbmcgZnJv
bSBhIG1vcmUgY2FwYWJsZSBob3N0IHRvIGEgbGVzcyBjYXBhYmxlIG9uZSwgc3VjaA0KPj4gKyAg
ICAgICAgICogYml0cyBtYXkgYmUgcmVqZWN0ZWQgYnkgdGhlIGRlc3RpbmF0aW9uLCBhbmQgdGhl
IG1pZ3JhdGlvbiBmYWlsZWQuDQo+PiArICAgICAgICAgKg0KPj4gKyAgICAgICAgICogRGlzY2Fy
ZCBzdWNoIGJpdHMgaGVyZSBvbiB0aGUgc291cmNlIHNpZGUuICBTdWNoIGJpdHMgaGF2ZSByZXNl
cnZlZA0KPj4gKyAgICAgICAgICogYmVoYXZpb3VyLCBhbmQgdGhlIGd1ZXN0IGhhcyBvbmx5IGl0
c2VsZiB0byBibGFtZS4NCj4+ICsgICAgICAgICAqLw0KPj4gKyAgICAgICAgc3dpdGNoICggbXNy
ICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgIGNhc2UgTVNSX1NQRUNfQ1RSTDoNCj4+ICsg
ICAgICAgICAgICB2YWwgJj0gbXNyX3NwZWNfY3RybF92YWxpZF9iaXRzKGQtPmFyY2guY3B1aWQp
Ow0KPj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICAgICAgfQ0KPiBTaG91bGQgeW91IG1v
dmUgdGhlIGNoZWNrIGZvciAhdmFsIGhlcmUsIGluIGNhc2UgdGhlIGNsZWFyaW5nIGRvbmUNCj4g
aGVyZSB6ZXJvcyB0aGUgTVNSPw0KDQpTa2lwcGluZyBNU1JzIHdpdGggYSB2YWx1ZSBvZiAwIGlz
IHB1cmVseSBhbiBvcHRpbWlzYXRpb24gdG8gYXZvaWQNCnB1dHRpbmcgYSBsb2FkIG9mIGVtcHR5
IE1TUiByZWNvcmRzIGluIHRoZSBzdHJlYW0sIGJ1dCBub3RoaW5nIHdpbGwgZ28NCndyb25nIGlm
IHN1Y2ggcmVjb3JkcyBhcmUgcHJlc2VudC4NCg0KVGhlIGNvc3Qgb2YgdGhlIGV4dHJhIGxvZ2lj
IGluIFhlbiB0byBzcG90IHRoZSAwIGNvcm5lciBjYXNlIGlzIGdvaW5nIHRvDQpiZSBsYXJnZXIg
dGhhbiB0aGUgZGF0YSZkb3dudGltZSBzYXZpbmcgb2YgMTYgYnl0ZXMgZm9yIGFuIGFscmVhZHkt
YnVnZ3kgVk0uDQoNCkkgY2FuJ3Qgc2F5IEkgY2FyZSBmb3IgZml4aW5nIGl0Li4uDQoNCj4+ICsN
Cj4+ICsgICAgICAgIGN0eHQtPm1zcltjdHh0LT5jb3VudF0uaW5kZXggPSBtc3I7DQo+PiAgICAg
ICAgICBjdHh0LT5tc3JbY3R4dC0+Y291bnQrK10udmFsID0gdmFsOw0KPj4gICAgICB9DQo+PiAg
DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21zci5oIGIveGVuL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL21zci5oDQo+PiBpbmRleCAxMDAzOWMyZDIyN2IuLjY1N2EzMjk1
NjEzZCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc3IuaA0KPj4g
KysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL21zci5oDQo+PiBAQCAtMjc3LDYgKzI3Nyw4
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB3cm1zcl90c2NfYXV4KHVpbnQzMl90IHZhbCkNCj4+ICAg
ICAgfQ0KPj4gIH0NCj4+ICANCj4+ICt1aW50NjRfdCBtc3Jfc3BlY19jdHJsX3ZhbGlkX2JpdHMo
Y29uc3Qgc3RydWN0IGNwdWlkX3BvbGljeSAqY3ApOw0KPj4gKw0KPj4gIGV4dGVybiBzdHJ1Y3Qg
bXNyX3BvbGljeSAgICAgcmF3X21zcl9wb2xpY3ksDQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGhvc3RfbXNyX3BvbGljeSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB2
X21heF9tc3JfcG9saWN5LA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tc3IuYyBiL3hl
bi9hcmNoL3g4Ni9tc3IuYw0KPj4gaW5kZXggMmNjMzU1NTc1ZDQ1Li41ZTgwYzhiNDdjMjEgMTAw
NjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvbXNyLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9t
c3IuYw0KPj4gQEAgLTQzNSw2ICs0MzUsMjQgQEAgaW50IGd1ZXN0X3JkbXNyKHN0cnVjdCB2Y3B1
ICp2LCB1aW50MzJfdCBtc3IsIHVpbnQ2NF90ICp2YWwpDQo+PiAgICAgIHJldHVybiBYODZFTVVM
X0VYQ0VQVElPTjsNCj4+ICB9DQo+PiAgDQo+PiArLyoNCj4+ICsgKiBDYWxsZXIgdG8gY29uZmly
bSB0aGF0IE1TUl9TUEVDX0NUUkwgaXMgYXZhaWxhYmxlLiAgSW50ZWwgYW5kIEFNRCBoYXZlDQo+
PiArICogc2VwYXJhdGUgQ1BVSUQgZmVhdHVyZXMgZm9yIHRoaXMgZnVuY3Rpb25hbGl0eSwgYnV0
IG9ubHkgc2V0IHdpbGwgYmUNCj4+ICsgKiBhY3RpdmUuDQo+PiArICovDQo+PiArdWludDY0X3Qg
bXNyX3NwZWNfY3RybF92YWxpZF9iaXRzKGNvbnN0IHN0cnVjdCBjcHVpZF9wb2xpY3kgKmNwKQ0K
Pj4gK3sNCj4+ICsgICAgYm9vbCBzc2JkID0gY3AtPmZlYXQuc3NiZDsNCj4+ICsNCj4+ICsgICAg
LyoNCj4+ICsgICAgICogTm90ZTogU1BFQ19DVFJMX1NUSUJQIGlzIHNwZWNpZmllZCBhcyBzYWZl
IHRvIHVzZSAoaS5lLiBpZ25vcmVkKQ0KPj4gKyAgICAgKiB3aGVuIFNUSUJQIGlzbid0IGVudW1l
cmF0ZWQgaW4gaGFyZHdhcmUuDQo+PiArICAgICAqLw0KPj4gKyAgICByZXR1cm4gKFNQRUNfQ1RS
TF9JQlJTIHwgU1BFQ19DVFJMX1NUSUJQIHwNCj4+ICsgICAgICAgICAgICAoc3NiZCAgICAgICA/
IFNQRUNfQ1RSTF9TU0JEICAgICAgIDogMCkgfA0KPj4gKyAgICAgICAgICAgIDApOw0KPiBUaGUg
Zm9ybWF0IGhlcmUgbG9va3Mgd2VpcmQgdG8gbWUsIGFuZCBJIGRvbid0IGdldCB3aHkgeW91DQo+
IHVuY29uZGl0aW9uYWxseSBvciBhIDAgYXQgdGhlIGVuZD8NCj4NCj4gSSB3b3VsZCBhbHNvIGJl
IGZpbmUgd2l0aCB1c2luZyBjcC0+ZmVhdC5zc2JkIGRpcmVjdGx5IGhlcmUuDQoNClNlZSBwYXRj
aCA3IHRvIGNvdmVyIGJvdGggcG9pbnRzLg0KDQpUaGUgdHJhaWxpbmcgMCBpcyBsaWtlIHRyYWls
aW5nIGNvbW1hcywgYW5kIHRoZXJlIHRvIHJlZHVjZSB0aGUgZGlmZnN0YXQNCm9mIHBhdGNoZXMg
YWRkaW5nIG5ldyBsaW5lcy4NCg0KfkFuZHJldw0K

