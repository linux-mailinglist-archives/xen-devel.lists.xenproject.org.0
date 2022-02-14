Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CB44B5B36
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 21:48:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272619.467515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJiFR-00070s-Vc; Mon, 14 Feb 2022 20:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272619.467515; Mon, 14 Feb 2022 20:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJiFR-0006yX-SN; Mon, 14 Feb 2022 20:47:01 +0000
Received: by outflank-mailman (input) for mailman id 272619;
 Mon, 14 Feb 2022 20:47:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJiFP-0006yR-RI
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 20:47:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e6c489b-8dd7-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 21:46:57 +0100 (CET)
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
X-Inumbo-ID: 3e6c489b-8dd7-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644871617;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=n+xWnoUlh9HhJ3fEOyjvhXYRWmXKU2+lJ/KUpHfQ6/g=;
  b=OSdr2Y9Z81JU4eXnfASwX+GZ5X/GvEj/cgQjaxvCu9zqZnHFyrQU4oFD
   Wb8T101uzX3tSaYFHJNWpO3M8M955AE4J6Vgt4+u36GFEhfl0MzQGbGnz
   LJOZxatv1wg+JgZy05oO4BEw5X5RkFR7NiOTPZgkkvF03ysBhWz0JiOwL
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /WxbFVkmZxQI759Z3mJhL164W/hao9IRZsk42iAJXTgtmNZgasIi1uSXpLHPv0FZmUMLn+BNRz
 h+SscJGXqF2XS3M73/2OzSwNDPCV2HKfkZKUQn6Lo4Uehc1TWI0lh1+jYa7WQrVzaLP0CQD929
 FjpuK/kSIRMaKSolh2MNg1oJvjTM238BENDeARNdEmRPtO1vgycUQW+HUZ5UefGaJpz45clRvo
 eYFxeLpR7xjfcZhYqVwRV9p5TTtvCB7O3GpUXjKqDepERjMzNQBTUte2iRPQvFUGx6pFqDR3Wa
 2tgNxJiv9a70JSxZJbhv0vxN
X-SBRS: 5.1
X-MesageID: 66418031
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EWqY4Ku2FHaxDuuA5XcAg9AqF+fnVKpZMUV32f8akzHdYApBsoF/q
 tZmKT3QP/zYNmKne9x1Oo209B9U6J/cxoViSQJp/iwyFSoR+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IThWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl7IaCVFZ3IqH1l8sQbRJZKSpuNK8a9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 ZZAOWI0NXwsZTUUGUg9T4hhvt6om0fPWCRdhmKLvqwetj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3ErvDLtTP2XsQVDrLQ3vx3hFyewEQDBRtQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9haHvA+6QqN4rHJ+AvfDW8BJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1rE7IWJ/G2uNREaAmI8bi4+RhsM4YXs9dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZROdb9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQM1d3XC3270k5JGQWy3yGsgTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27CqyLPooTP8AoL1XvEMRSiam4hT6FraTRuftnZ
 cfznTiEUR729piLPBLpHrxAgNfHNwg1xH/JRICT8vhU+eH2WZJhcp9caAHmRrlgtMus+VyJm
 /4CZ5ri40gOC4XWP3iImbP/2HhXdBDX87it8JcJHgNCSyI7cFwc5wj5n+9wJdw9x/4N/goKl
 1nkMnJlJJPErSSvAS2Ba2x5aaOpWpB6rHkhOjcrM0ru0H8mCbtDJo9FH3fuVbV4puFl09BuS
 PwJJ5eJDvhVE2yV8DUBd5jt6odlcU3z1w6JOiOkZhk5foJhGFOVqoO1IFO3+XlcFDezuOs/v
 6akilHRT60cSlkwF83Rcv+ukQ+85CBPhOJoUkLUCdBPY0GwopNyIin8g6ZvccEBIBnO3BWA0
 AOSDUtKrOXBudZtotLImbqFv8GiFO4nRhhWGGzS7LCXMyjG/zX8nd8cAbjQJT2EDTH64qSvY
 +lR3srQCvxfkQYYqZd4HpZq0bk6u4nlqYhFw1k2B37MdVmqVO9teyHUwclVu6RR7bZFog/qC
 FmX89xXNLjVasPoFFkdeFgsYuiZjKxGnzDT6bI+IVng5T8x972CCB0AMx6JgS1bDb10LIJ6n
 rtx5J9Is1Sy2kgwL9KLriFI7GDdfHUPXpIuuoweHIK22BEgzUtPYMCEByL7iH1Vhw6g7qX+z
 ueouZf/
IronPort-HdrOrdr: A9a23:FKQiP6pGlUGH+z4Dfrq827gaV5uNL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6Ky90KnpewK5yXbsibNhfItKLzOWx1dAS7sSrbcKogeQVREWk9Q96U
 4OSdkHNDSdNykZsS++2njELz9C+qjFzEnLv5ak854Fd2gDAMsMj3YbNu/YKDwNeOAvP+tlKH
 P23Lshm9PUQwVvUi3NPAhiYwGsnayvqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+eemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aSSARcR4Z
 3xSiUbToJOAkDqDziISNzWqlHdOQMVmjjfIJmj8CDeSILCNWgH4oF69Pxkm1PimjsdVZdHof
 52Niuixulq5VmrplWM2/HYEx5tjUa6unwkjKoaiGFeS5IXbPtLoZUY5149KuZMIMvW0vFtLA
 BVNrCX2B+WSyLsU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsMtVcegK28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBRbBKnibL1jrHLwOf3jNt5n06rMo4/zCQu1F8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBH6wWDz8o/sur6SReoeMDYYDHRfzPWzGovHQ1cn3WPerKc
 pbEKgmd8PeEQ==
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="scan'208";a="66418031"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMgwoSPPev/ih3XYABGdPfxyFL5M1918941WpFKWtl4mcRiWxykyYUyu748FVDSddwUvZAJY9040Yspl7n/UZoJK42zKotf7bf7Lvjfcle1FPZaQOhkCygTolqSlmgLiXZmY2qfpWFdP3EZiBNWXnhjG8Txoz+43VATs8jCrENbmoCvqDXtIP9vktPnGAhsT+lvPm72dj88LCbrB5wr3oZ2KlrhS1qjMw32/wf9PdeKEdrrNOzkbHrL2kvZJxBMnjvi4kmRxKgweAWVck4oVnKHoidMXcDtkq7BTEo1AUGTKnJ+l+yfHeJiaIocAd+/v1Y45kdAAV0F2NzX8NpG8sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+xWnoUlh9HhJ3fEOyjvhXYRWmXKU2+lJ/KUpHfQ6/g=;
 b=Mw5kFr2F5uFcyOdBwqQ2L75jjYEafGsBa1xeQ2KMhf2j7SRLRC5RJvR51mnwoCH2UMVP5CHKY/bpjTNhPVSRZoMTnvUNULdTaiVitNk0Irofzqw3KbdWWPGixrY3ClLpSZSeceNVdDNWM+KUvGUhZZ3SVnSfOxM1i9lq1+wA0pffcifhtPmTCCkK5t111Hrntf5xQLQ+QfElex03y+n+UcYJCuJUDU9+sQB8ByoQSSgtHuFEYIZMU8kFLFrl0XmN8efgNO5HegZu4oGnfVejLAJ8KA+hXcs5e8d3J1Kfw2Z9HwZeouF6yRWj4E4NKc+VfEafD4eMLBNXsdO+6rvt9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+xWnoUlh9HhJ3fEOyjvhXYRWmXKU2+lJ/KUpHfQ6/g=;
 b=G+iOBeicZ/leMHQXMxnQ5ZRtIdRiCKg7UVPDjFhuSgVgvZEWAx4nxhRHWWGtlUAPUG98fDZ8MMmzdFcjlt3FPk5puqvcKonJql46gVBbPA1lz9oxPQAeE3S20sVM1LLma2wXrjbb3+gEpojovVVsH8J84W25fSJQMrxpeOdEUDA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM guests
Thread-Topic: [PATCH 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM guests
Thread-Index: AQHYF4thsK6t/XxLoUS9M7m4X3UCsayTmOKA
Date: Mon, 14 Feb 2022 20:46:50 +0000
Message-ID: <4457dcd5-6a64-355a-b794-6b404cf90335@citrix.com>
References: <20220201164651.6369-1-roger.pau@citrix.com>
In-Reply-To: <20220201164651.6369-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb21219b-25c4-41d2-af11-08d9effb200e
x-ms-traffictypediagnostic: DM6PR03MB5242:EE_
x-microsoft-antispam-prvs: <DM6PR03MB5242C00BB559F0EDB2CE8510BA339@DM6PR03MB5242.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KsMChuWU15GiRBm36PnoWUJLpLeStr5l7SXA65+2K9j9QjTkcp70aSjsotxjcIUGD5ehWoeOMLUyoNRU+0gqJmvTxFeQ7bteZSCPOnbNn7OvUiwP8d617w1rWJ0ad7DPREx4O0UuDWbr3IQr0HdvCNA7H2VDA/OatK0gj/E6FfbM1gMs7j7sHVC9sRt8h285l8WPX1a5TTCNn80e5+AJNUbKygNsaiTD2Tkd3tyTZR7dCGLvcaeqo1Uz2oNhcMmHjaYY8hz74Tz4XEBjNaBf5NM5ZKAi5NBRlzuolPfogAbKitjY4QtXJmOOj6414a8hVTqyERFl7pyfmYnKJCiTr76/DTuXUoozRvypINZVKLxfqcgR2iUCPXbIpOaYcv60y6JDVlsE0F8+bCI7J2JxCok4+cGgL6RM0aZLIb2zZ4N5Gswe4VSP5O8tBr12rUWQCIMMKgFVjbBL3u2N6TyFUh/1RgF+3+P7JU844hN/s78hmzON1XUjntcb/cO6T6Fbhbiuch1CbLk9GNJcZYHm1q7a0/edHkWaes5gdz3h7PB0Gvgzjhe0UWTPfRPtHwmVa6qgthsqW1GgoMCgR14Vg/L4359KKjbVQgz48GzKRtLGZJO+9z4l4HrUS9uunzyjVg8DFqUoVasIUFohsbdXr6F68eKZHc3iZnmwms4yykBWwHgVne1UZKT7nZK8js5TOIaze68XiVP8nl3yMDUpysMgsthOjwP/8/UGGKgC/vwHyA4kALNfIB0aW8RullsMPMTn610F/LbK5EUzi+tjew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(2616005)(5660300002)(66946007)(2906002)(31696002)(186003)(8936002)(38100700002)(26005)(38070700005)(76116006)(66556008)(53546011)(8676002)(4326008)(64756008)(66446008)(66476007)(82960400001)(122000001)(110136005)(6506007)(316002)(508600001)(54906003)(91956017)(86362001)(31686004)(6512007)(6486002)(71200400001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzBnMGRKVDJFeVY3aVhtTkdkd0tXOG1WUjFZSmM0eGNqSmJiMTc5KzZueVVG?=
 =?utf-8?B?MUVQVG1HRmxZcWJhaVNBbmN4VUgwOTQwMGg4eDdUTE9JWUtkVVNFVmtENk0w?=
 =?utf-8?B?MHhuYmpSSVF2NWR6c0RlQTQ1azlVN3laYmVDeExiSGxCTmdIZFZEVlJOU25V?=
 =?utf-8?B?NEZUQzBjV1d6VU91Uktpai9LMXJiTzlDYVphZkViM1ZoVGlJaU5rVktDTjcv?=
 =?utf-8?B?TDNteHBpck96OEtJeHV2WXNZTVVHOWNvbWNjanJ6Nm1vWXB6dGdoMWVMTXJl?=
 =?utf-8?B?QWt0ZnRGWUVTZzdZNDJZMllSYys2S09zcmJaOFNtM1ROL2hnOXhFdXY2ekJX?=
 =?utf-8?B?VElZSjVtQ1ozdnZxYjR1ZmQ4YWZOeDNoNksxYzlzZzlEcmQraVg2TmthZmYz?=
 =?utf-8?B?Z2h4QklPaW1BZE9LdmxWZk8ybDdJQmwyUnM4aGhaRzFCbXZ3QU9RR0J3RzZ3?=
 =?utf-8?B?bjlteDZJM0orZWs5c3IrM2xGVHpFNDZ2TE9Pd0t5a3JWaTZ2Qjdtc1ZJLy9Q?=
 =?utf-8?B?bGpzU0xBaWV4c1M1QSs2cVdQUW0vRVZpZmV0c3dXaUxTUlY2SjdZdHJBWitX?=
 =?utf-8?B?cVBNK2Ewb0RXMkRXWFg0cGVXdWNqVlpwQmNZS1FCc3NGME5hbnBldUVvdjBH?=
 =?utf-8?B?QUlwWWsxRlplZ1BmQzJSMjUxN2ZEQmtjU0pmaGFMK3Q2QmNyVE1qYXljM0Fx?=
 =?utf-8?B?dGdId1pVak9OK0Y4M29HL0NqOCs4c0xFN0NmQ0VkK0dRQmRYV0lPRU9HVVA1?=
 =?utf-8?B?WGI3NkJINytPb2pXV2orTkU2N3F3VjZyMU9xWjBvTVlPa0tNR1ZrTmlUQnZC?=
 =?utf-8?B?MXBiRDR1a2ZHR0h0amgxME90RFRweWJlakdUYzJPeGo0RnRmL0EvM1hib3Q4?=
 =?utf-8?B?b1hrNEFEVFBzRFNHdWg5UVVSZ3M4emsvbis2VHNVYlJrSVdRUFFhNGhsMlpK?=
 =?utf-8?B?UGdEU2FEZ3lONTJIaG5vNmoreEZlV01uajRBN1lBS3hLNU1ZTERKTGlsdjl5?=
 =?utf-8?B?TzhFZ0h4WmtHb0tRb2ZtSGtqVzR0azlEY1pCUHVIbS8rZ1pZeUsyUzcrSU43?=
 =?utf-8?B?NWg5MlFlSjJzY21tV0ZpRzJXdmNjalJrY3JzU2QvNXd6MGpybCtWTjlGbHhk?=
 =?utf-8?B?d3dQNVRXbERJSTRhckR6Q0hjdmNmRnRkKzNKd1RRREtHbzViUXFxblJKc1Ni?=
 =?utf-8?B?NHRlanhkNS82dHhvV0pnYWJob094SWFBakkramhHZ3Ava1pVcy9JWnhYVFAx?=
 =?utf-8?B?TjEySUd5QkFNR0tVYU4vQUNZSitseUU2V2xHcVpZaWVnbXNzSXhNNTdaMFVS?=
 =?utf-8?B?MnBzaGp0VmJxbERmV1lzWHpZTS92OGo0bk5rcVRlUUhTZDNOaG5PdnNjWmph?=
 =?utf-8?B?YjgwVnF1K2J6VEZ1YjRzcnRKU3RjcC9CM1FLR29rYkd5elJBMEl3dVNFd0NX?=
 =?utf-8?B?YUthUW1iMHlBQU5xdWNKY3pzUkxmSDZCTW1kQ0J0cHU0NnI1YjUvQmpmdVYv?=
 =?utf-8?B?QmIyK0h3MlZSd3pqQmZkdHVkekRDZVVUbjNldXJZWnhUMVdVSitCc2Rrbk1X?=
 =?utf-8?B?dGpkUXkvSHZUemlqQVBINll2VU94aTRXbEVQbjdOaWNNcG8wYUFLY3d3NTlE?=
 =?utf-8?B?bzV1NGg3ZHYrbkR5Q01KRm1TNitQS0RQRFVITjBJWnFqSmxpVWNGRkNvTnJm?=
 =?utf-8?B?S0dEdUpMSkViSzlQUlI0S01NZ1pwemVZUUhEVWVtVFFYOFJRTkM5a2RRc2VO?=
 =?utf-8?B?bVZpaG1ndWQvMkJ5S05NeWh1aG1FZHJoRzR4cnpSZENqNDFVbG83R3dQNU1Z?=
 =?utf-8?B?SmY1cWNYM3dualpPM1piaHZrZlB6RlNDQlVTK1duRlNZVTdSU2lUY0YyOG1I?=
 =?utf-8?B?cUExWTdiZ0Jwa2c4NlVFMDdWdXpkUmdkMUlaZTdCZVM3a1RiUFVXd3oza2Rx?=
 =?utf-8?B?RlRLWjZiLzN1UGloc3FPNEhqaGlJVTZCRUxFb1ZtdkxpRkwvS3VaWmtSeFJL?=
 =?utf-8?B?L1pQZnBnTEJRYndyNHMyRUpWQzJhSUNheDdLMWhqeE0zWldkWnM5TlROeFdt?=
 =?utf-8?B?aEJVRDlva29ML0VXVHdlQWNtYXhVSXZuRWgvTEZyb1VmRE5qT0lmaHJTUjhM?=
 =?utf-8?B?UWZCbGZRcmY0ZFFFSTJJdnJYYUZrRUZTeWZjR3I2SnpvN0N1NUVtQlVkMWN5?=
 =?utf-8?B?bS8vM1g4R2piR0RhRmtCcmk5di9DdXlDNXhGdDNuVEdDeXJqMmNuMkttTXVL?=
 =?utf-8?B?emdqOVNhMDdFKzZBRVBVK3cxcitBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <495E3C2D08351342B62993CD134270FA@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb21219b-25c4-41d2-af11-08d9effb200e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 20:46:50.1736
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CX59d+WtizBw7ygDwbK3c5XLxcRGBUmukHXj4cyNBXNWM/erzh1Dcr2XgTDXqEgPNLNCsIiZIevHAO568Znz5wRB6py2snU4ynovs+xnG0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5242
X-OriginatorOrg: citrix.com

T24gMDEvMDIvMjAyMiAxNjo0NiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBIZWxsbywNCj4N
Cj4gVGhlIGZvbGxvd2luZyBzZXJpZXMgaW1wbGVtZW50cyBzdXBwb3J0IGZvciBNU1JfVklSVF9T
UEVDX0NUUkwgb24NCj4gZGlmZmVyZW50IEFNRCBDUFUgZmFtaWxpZXMuDQo+DQo+IE5vdGUgdGhh
dCB0aGUgc3VwcG9ydCBpcyBhZGRlZCBiYWNrd2FyZHMsIHN0YXJ0aW5nIHdpdGggdGhlIG5ld2Vy
IENQVXMNCj4gdGhhdCBzdXBwb3J0IE1TUl9TUEVDX0NUUkwgYW5kIG1vdmluZyB0byB0aGUgb2xk
ZXIgb25lcyBlaXRoZXIgdXNpbmcNCj4gTVNSX1ZJUlRfU1BFQ19DVFJMIG9yIHRoZSBTU0JEIGJp
dCBpbiBMU19DRkcuDQo+DQo+IEZpcnN0IHBhdGNoIGlzIHF1aXRlIGNsZWFuLCBhcyBpdCB1c2Vz
IHRoZSBzaGFkb3cgU1BFQ19DVFJMIGluIG9yZGVyIHRvDQo+IHNldCB0aGUgU1NCRCBiaXQgYW5k
IGhhdmUgaXQgY29udGV4dCBzd2l0Y2hlZCBieSBYZW4gdXNpbmcgdGhlIGV4aXN0aW5nDQo+IGxv
Z2ljIHJlY2VudGx5IGFkZGVkLg0KPg0KPiBUaGUgbmV4dCB0d28gcGF0Y2hlcyBpbnRyb2R1Y2Ug
YSBkaWZmZXJlbnQgd2F5IHRvIGNvbnRleHQgc3dpdGNoIFNTQkQNCj4gZWl0aGVyIGRlcGVuZGlu
ZyBvbiB0aGUgdW5kZXJseWluZyBTU0JEIHN1cHBvcnQsIHNvIGl0J3MgZWl0aGVyIHVzaW5nDQo+
IFZJUlRfU1BFQ19DVFJMIG9yIHRoZSBMU19DRkcgTVNSLiBUaGV5IGFsc28ga2luZCBvZiBvdmVy
bG9hZCB0aGUgdXNhZ2Ugb2YNCj4gc2V2ZXJhbCBzcGVjX2N0cmwgdmFyaWFibGVzIGluIHRoZSBo
eXBlcnZpc29yIGluIG9yZGVyIHRvIHN0b3JlIHRoZQ0KPiBzdGF0dXMgb2YgU1NCRCBldmVuIHdo
ZW4gbm90IHVzaW5nIE1TUl9TUEVDX0NUUkwgaXRzZWxmLiBJJ3ZlIHRyaWVkIHRvDQo+IGRvY3Vt
ZW50IHRob3NlIGluIHRoZSBjb21taXQgbWVzc2FnZXMsIGJ1dCBpdCBjb3VsZCBiZSBjb250cm92
ZXJzaWFsLg0KPg0KPiBUaGFua3MsIFJvZ2VyLg0KDQpJIHN1c3BlY3QgaXQgd291bGQgaGVscCBy
ZXZpZXdpbmcgdGhpbmdzIHRvIHN0YXRlIHdoYXQgdGhlIGVuZCByZXN1bHQgaXMNCmludGVuZGVk
IHRvIGJlLg0KDQoxKSBYZW4gc2hvdWxkIHVzZSB0aGUgQU1EIHByb3ZpZGVkIGFsZ29yaXRobSBm
b3IgZW5nYWdpbmcgU1NCRCBpdHNlbGYuwqANClRoaXMgaW5jbHVkZXMgdXNpbmcgTVNSX1ZJUlRf
U1BFQ19DVFJMIGlmIFhlbiBpcyBuZXN0ZWQgdW5kZXIgYW5vdGhlcg0KaHlwZXJ2aXNvci7CoCBJ
biB0aGUgY3VycmVudCBjb2RlLCB0aGlzIGlzIGltcGxlbWVudGVkIGJ5IGFtZF9pbml0X3NzYmQo
KQ0KZXZlbiBpZiBvbmx5IGxpbWl0ZWQgdG8gYm9vdCBwYXRocyBmb3Igc2ltcGxpY2l0eS4NCg0K
MikgT24gRmFtMTVoIHRocnUgWmVuMSwgWGVuIHNob3VsZCBleHBvc2UgTVNSX1ZJUlRfU1BFQ19D
VFJMIHRvIGd1ZXN0cw0KYnkgZGVmYXVsdCB0byBhYnN0cmFjdCBhd2F5IHRoZSBtb2RlbCBhbmQv
b3IgaHlwZXJ2aXNvciBzcGVjaWZpYw0KZGlmZmVyZW5jZXMgYXdheSBpbiBNU1JfTFNfQ0ZHL01T
Ul9WSVJUX1NQRUNfQ1RSTC4NCg0KMykgT24gWmVuMiBhbmQgbGF0ZXIsIE1TUl9TUEVDX0NUUkwg
ZXhpc3RzIGFuZCBzaG91bGQgYmUgdXNlZCBpbg0KcHJlZmVyZW5jZS7CoCBIb3dldmVyLCBmb3Ig
bWlncmF0aW9uIGNvbXBhdGliaWxpdHksIFhlbiBzaG91bGQgYmUgY2FwYWJsZQ0Kb2Ygb2ZmZXJp
bmcgTVNSX1ZJUlRfU1BFQ19DVFJMIHRvIGd1ZXN0cyAobWF4LCBub3QgZGVmYXVsdCkgaW1wbGVt
ZW50ZWQNCmluIHRlcm1zIG9mIE1TUl9TUEVDX0NUUkwuDQoNClRoaXMgd2F5LCBhIFZNIGxldmVs
bGVkIHRvIHJ1biBvbiBaZW4xIGFuZCBaZW4yIHNlZXMgTVNSX1ZJUlRfU1BFQ19DVFJMDQphbmQg
Y2FuIHVzZSBpdCBvbiBib3RoIGhvc3RzLCB3aGVyZWFzIGEgVk0gb25seSBpbnRlbmRpbmcgdG8g
cnVuIG9uIFplbjINCmdldHMgTVNSX1NQRUNfQ1RSTCBieSBkZWZhdWx0Lg0KDQpPYnZpb3VzbHkg
dGhpcyBtZWFucyB0aGF0IGEgVk0gb24gWmVuMiBjYW4gb3B0IGluIHRvIE1TUl9WSVJUX1NQRUNf
Q1RSTA0KYmVjYXVzZSBvZiBob3cgbWF4IHZzIGRlZmF1bHQgd29ya3MgYW5kIHRoaXMgaXMgYSBs
ZWdhbCBjb25maWd1cmF0aW9uLA0KZXZlbiBpZiBpdCdzIG5vdCBvbmUgeW91J2QgZXhwZWN0IHRv
IHNlZSBvdXRzaWRlIG9mIHRlc3Rpbmcgc2NlbmFyaW9zLg0KDQp+QW5kcmV3DQo=

