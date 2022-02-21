Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC7A4BD96A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 12:29:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276213.472322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6sD-00029w-5k; Mon, 21 Feb 2022 11:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276213.472322; Mon, 21 Feb 2022 11:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6sD-00027J-2i; Mon, 21 Feb 2022 11:28:57 +0000
Received: by outflank-mailman (input) for mailman id 276213;
 Mon, 21 Feb 2022 11:28:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fvXl=TE=citrix.com=prvs=044a77a3b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nM6sA-00026z-WD
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 11:28:55 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 722bc29b-9309-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 12:28:53 +0100 (CET)
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
X-Inumbo-ID: 722bc29b-9309-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645442933;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=n5apCjhoVMy71g7V5RBuAG/yN31n8pPIi39Bvc9yN5E=;
  b=Lm8EHMK/B0RcouA2DjSnsWN24fqgI3Mygw3W805lXAjf8YaHCJeujHnG
   I7Ccf33KayG0zztbltH+V5M02y8YhDintEHIEp75Vr7DZHevPZ1W5r0Oi
   q+78uIURleBJAiFSrvrI2ijgE+Ac/aYnJqoLzro+DkbhYD0eW1MlvWGl1
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66885553
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hIPcV60FkxEPFO3GqfbD5QNxkn2cJEfYwER7XKvMYLTBsI5bpz0Ax
 zFKCzyAOq3bMDfyfoxzO4ripE1Q7cDQm9QwGQFspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQy2IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Llqy9cCUEY5fyo+AYUh5AOGJfAoNvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiAN
 5pENGc0BPjGSw9sNnRIS8xhpsKTql6hKxtlq2ynu7VitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRAAweNdGZ4SqI9DSrnOCntTvyRYY6BLC+sPlwjzW73XcPARcbUV+6p/iRiUOkXd9bb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6YGWosXjNHcMYhtsI9WXotz
 FDht/HDCCFrsbaVYWmA7brSpjS3URX5NkdbO3VCF1FcpYC+/sdj1XojU+qPDoazre34IBPdn
 gq0lyw7hrILpo0q6IuSqAWvby2XmrDFSQs85wPyV22j7x9kaIPNW7FE+WQ3/t4bct/HEwDpU
 Gws3pHHsbtQVc3leDmlHb1VdIxF8cppJ9E1bbRHO5A6vwqg9He4FWy7yGEvfRw5WirolNKAX
 aMyhe+zzMIJVJdJRfUuC25UNyjN5fK9fekJrtiOMrJzjmFZLWdrBh1Ga0+KxHzKm0Mxi6w5M
 przWZ/yUStBWfg2kWvrHbZ1PVoXKscWnz67eHwG507/jer2iIC9Et/pz2dinshmtfjZ8W05A
 v5UNteQygU3bQENSnK/zGLnFnhTdSJTLcmv86R/L7ffSiI7SDBJI6KAmtsJJt0695m5Y8+Vp
 xlRrGcDkwGh7ZAGQC3XAk1ehETHB8gn9itjZXR2VbtqslB6CbuSAG4kX8JfVZEs9fB5zO4yS
 P8Aes6aBe9IRCiB8DMYBaQRZqQ/HPh3rWpi5xaYXQU=
IronPort-HdrOrdr: A9a23:ScxaAaEfCic+8bEepLqFRpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdtZJkh8erwXZVp2RvnhNFICPoqTMuftW7dySWVxeBZnMffKljbdREWmdQtrJ
 uIH5IOa+EYSGIK9/oSgzPIUurIouP3iJxA7N22pxwGLGFXguNbnnxE426gYxZLrWJ9dP4E/e
 +nl6x6Tk2bCBMqh6qAdxs4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1SsV
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RGIFq/QpF4t1H2mxa1O
 UkkC1QePibLEmhOF1dlCGdnjUIFgxeskMKh2Xo2UcL6vaJOw7SQ/Ax+76xNCGpsXbI9esMoJ
 6ilQiixutqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MciFW5uYd499RjBmcga+S
 hVfbXhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zo93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkf8IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehTKYd0s8LAo23FUgMyPeFOwC1zxdLkHqbrUn8ki
X-IronPort-AV: E=Sophos;i="5.88,385,1635220800"; 
   d="scan'208";a="66885553"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WP/6U2nnyCnIiEfY0d60OP60WJgdSYpV2DEyiSyKk4XaBYD3kIdx7G5RHlz8yzFvbCHuiNlFtg9skVQbDyGIukVLjkXq3zDdoXCucKHOQmz5eCjgM4He9edQChIhuEiTHO1ZJWoHponD21cG+pyS5y3rMKq36LUe7cOu2qlRSagmbofU7c6bpWBx0xUC2ByKAeZLzyRDEFP3nnpHdRhXaBFg3584enJxD/QpzWFXHgGsV2iDpfMctM5IcQArtSJQ4lH/ZfcRdC6NOYMLsTZClIOworqO9R/UqRV2xookCIqgiHbJWOX8xertfvvfl79DL9vq55R5bzLkjVIDL/BJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5apCjhoVMy71g7V5RBuAG/yN31n8pPIi39Bvc9yN5E=;
 b=gQ83Plxt4URdOF8lz2K0t1b+UuKJLhUfsTQZ75kcflIQ0syBd7SzyxNW08xlqu81biZS60YX7/3VHai1fTaW6Gj9qv4Hv7lm9iJsTUuvIF6rRmnbddd/ueOMk9xxd1wWZDBzdWKclyGmLUYfTk+gCrhHrcBqEbduTAqON+dVn4Dc+9f9JQZYe62gRJomOvqQo74+P2KYeidTa3cpXnzczQWlBsjb0ZbUhoeA+Uukmssj/26kIFKKaiZccH3gUQ+9LOKd0BDqd7vT1b0ulPfyTjc4ACMhYZx0lICY3mdf7Rc35I5ooY9ut08IhBETdQH1YGuthvdhc78CsJuXByToWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5apCjhoVMy71g7V5RBuAG/yN31n8pPIi39Bvc9yN5E=;
 b=tTQwYyO1wK7ybzsmrwOPuimJ4L+PTQDOoFHvgGuX1xPT8a4RsbA0JWwqOzni6bbhAZ7oTdpgAoamiKaLjhzneLJ9PBKtxlbROxjDbE6rhByA9YATAB0JKWDDykjjQfwu3nzy71icU1PEfPtDhp/tHkY31eVBqBnAUx2USJgzcrQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 2/3] xen: Rename asprintf() to xasprintf()
Thread-Topic: [PATCH 2/3] xen: Rename asprintf() to xasprintf()
Thread-Index: AQHYJwpOs0szyq0MVUKA4rk1u5+GKayd3CkAgAACGQA=
Date: Mon, 21 Feb 2022 11:28:39 +0000
Message-ID: <ada67c6c-bcd5-9732-c3e0-76032692ad23@citrix.com>
References: <20220221100254.13661-1-andrew.cooper3@citrix.com>
 <20220221100254.13661-3-andrew.cooper3@citrix.com>
 <YhN1pJIDIiJscvjF@Air-de-Roger>
In-Reply-To: <YhN1pJIDIiJscvjF@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a22a1778-6975-4590-53d7-08d9f52d4eb1
x-ms-traffictypediagnostic: SN6PR03MB3936:EE_
x-microsoft-antispam-prvs: <SN6PR03MB39364F0A8AD49BCDCB9D208FBA3A9@SN6PR03MB3936.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RJQjLRNdtImNVE81BkKyf8wSYWP2TJ12+FwyjeTNvE6GNOCgPx5fOXva23Fnx5UHRMBSh9uZ6m/WF1qnBCgjEfc/CW982I4iRxir9y07f8Kj7GNEy1CGoQbIm5otQVZheTsvs1suBd4iUXT9pIh1NrycYIH8cSw+qK0O16mDmb+YfdIttLoCQsexFTKVxXfr5XXVcIAKtCkClP7mOChyCTBX8DbXX3cpdWWVOs+h2+sHg1YQK9DeuqqwDrLKqIBABrnEStkB8TfWaHLVsn6mzCLcYF+fphDrU3Tbq0AW7bkRPUYdANdb0UlSqX41nfhS7sgrfLEWPCfXscKNymfXNWnCOa0YmILy1Bvqjawoul/qNG3I+e5nz3rJDra/ap+p/I97u/EHt57LcnasQ/+wFrrvtI5W5kgWQWCWRXs8+lGPnF4mmM2IZtNZh8heKmu28vSztgd5lhUIOejod8eb3kb6RsqUhqssFIQnY5ML7IW3wL8c+jY11BQgFOgZjaz1fyxbhAaT6dstApOKw9rBB0ATKpIw3tP68Oia+0c5SL6ITzNNuqJ/iya2W9QKn37sCnusjvgMuryEw76fz2DtbnBKERsjDle8EP62qQ4I0QqHcSUTgKDBV3NzKNEDvBmyG4gERqPyDYRYucK4HVulX/kLGsjWhsvvKqQwZbLfUatULBvzV6wQpX7qgCEhJLeV6lyUzRMDi5jjg582qS/Pj9CsIUcBniguP5i3Y7+as1wH5K9U63TD/apUamj309UCpd0RI6uGKNsxj5UsQdpb9A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(6506007)(71200400001)(508600001)(6486002)(38070700005)(6512007)(53546011)(31686004)(2616005)(2906002)(38100700002)(64756008)(6862004)(4744005)(5660300002)(186003)(6636002)(54906003)(37006003)(26005)(8936002)(316002)(122000001)(31696002)(86362001)(82960400001)(76116006)(66476007)(66556008)(91956017)(4326008)(8676002)(66446008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2w0dmlDa3FoTXFVUjVHcWk5SGVrejlqN1I5NUJkVlFSc2lEU1lDbVB2ZFhj?=
 =?utf-8?B?UURhN29jV3k1TmM0Y0lrNUZKb2dJWktQclJjRXZwUi80ai9ZUGdncUZpTG4w?=
 =?utf-8?B?aWozeTRVSHN3Wm4yblRBUnRUZjhiR0kzSC8zcC9KWFZsNTRxbXRBZTFja3NF?=
 =?utf-8?B?L01DTEJPR2h4SlJXNzVzYWxNcTRpLzZlRWNnaWpKNWhYVDI3dzhORW01K3Bt?=
 =?utf-8?B?V3dFeFltTmwrYlVYM05GQmQzWWZNL3ZRcXJQYWNIWDdkT28zR2tYSjk3YWkx?=
 =?utf-8?B?UjR2UjlVZFBhb1FJWStxV0ZEZTY4MXUwb2FHNFNvYm9kWnR5Z3FwMnhKdGtN?=
 =?utf-8?B?S041cXNRSi8yekttczFsR2NmUnEvcmxTb0l6SzRnYWZFY3ROd3l4Yk9vclNZ?=
 =?utf-8?B?RzZDVVdhanVQM3BkeW82d3hDVmp0cFhqZExoN3NkOGJQNmZqM0V2aWxvUndz?=
 =?utf-8?B?Y1BMMUg5bWZJQW83V0ZQM2ZxcmIyOU0xdkdHNUJpcFRBbDZYUTVGYlgzTmR4?=
 =?utf-8?B?SkFXaCtyWHFUWEcxaUJDdlZzS1plc0VUcVp5dWxlNDg4bTFrTHJZa2xtMWh6?=
 =?utf-8?B?ZXdmaHJ0YmMxaVRmTVlQS05qaS9iK3h2aGYzU1BhdnZzQXRIN3VObWw3QkNV?=
 =?utf-8?B?OHdsOW9RLzI0Z25oeFBSWElNN1djcTBTalRqNDMzQVlIRnpzSWMzVFRhSUZW?=
 =?utf-8?B?OTVwVWJXTkdoa1JiWk9LVlEvMC9xTTl1U1ZCUkE4RHlMN201K0FLTk1FTUtG?=
 =?utf-8?B?TXJCYjJJUXZBZUJtWkpnYnRhNmhuaFZ1VHBSdUREdy9YekZBRFNDRGRmQmNj?=
 =?utf-8?B?a3hoRmlna0N2enFvT1E1M0VoTW1CdGFDb0FvMEpXMHBDR05xeTV5MW9ucTJz?=
 =?utf-8?B?S2pLRXpGVzQweEVsNVNDc013bi9yTEJ5UlR1MGFyTFJYeFMvUFl0OWxRRGY0?=
 =?utf-8?B?MUl5QWlCeWVxNy80OTR5aUM2NlBqL3IydGNZS1lMRWZNYndpNERuR0dabFJt?=
 =?utf-8?B?eDczWERhUG9ETTVvNGd0eTM0WU80ZkFCaWJha2UwZXpraG1MdVF6bEJlMDl1?=
 =?utf-8?B?ajM1UldrZGVxLytSMHBpTzBIZkVtOWxCMjJJTzEwOEh0dFNDUmIvOTBSbzRU?=
 =?utf-8?B?cDJ1em41MkwrNktEcjdvU0tNampIaVUxcDhMOXRkZzFQczQzSUlkTk9kTmhr?=
 =?utf-8?B?a0tkV0FDMjNEdC82ZW1LYlU5WlQrSHcrdnhoOWdMS0dTcnB6QUQ3WmlDTm9j?=
 =?utf-8?B?cWhmakEzR1g2MHpvYUxVbE5VNFNSWW90V05uZWhHRVg1MDFaM0FMK0F3cU9v?=
 =?utf-8?B?bmk3MWFkRzV6bnQyaHJ0R2xHU3NQTkRldUV5ckp5TVVXNWIzc2J3TmZRamlN?=
 =?utf-8?B?RFRkQjNJbGFDR0IzR0NYNVRjUnNETEM4N3FSY0NZQ3BjWTlRV1pPWXhJaENK?=
 =?utf-8?B?SGtYdTk5UkN3c3BrNWxEMnk3QXlHbkNxMUFvOFNjVVJqaHlPVHIxYjl1TXJk?=
 =?utf-8?B?WWdTNHNTdzBKaHYwTDRQNXp1cDFhVXpoNzRqTjlIL016bFJGN2NXN0hSNEtK?=
 =?utf-8?B?M2h4VG4zZnVCeGh4UTcwbFRWRnBZdkkvalNPMUZocUhieG1xTklZRCtnNmRF?=
 =?utf-8?B?K3lIQXJpdUtnb1d2MDhxdHpGYytQTWZTVkkybWkyaWRxMFNVcklQMlhDakE5?=
 =?utf-8?B?RWpGa3VtZXZEMWZFQlpPL2hBRGZHZC94ZFo5Vk9ucGxibm9USldHRjBoY3pD?=
 =?utf-8?B?eERhcHBiWnJkNXNxYzB5aDhDYm1ORU5FZG0rOGJHeUEvS1hlend0TlAyYzZs?=
 =?utf-8?B?SG5SVUxkdnhPenJHaE1CZHd4M3FVMVp5Mi92Ums4Rjl0dVN1NThHbm1reVFi?=
 =?utf-8?B?RkVaLzExTUhFZmtGVkcwWGxJOFlTS0ptMlFWVVMrTTVZYnFOT21hQXQrYWFt?=
 =?utf-8?B?MVZOQnZiQ2Y0bkIzU1ZSeVc0L01Tb1BGNVVPczRFdEJkK0FyY2psa0l1bFlt?=
 =?utf-8?B?ekJpYy9pTEJFM1YxYWExR2FHZ2RZbTh5QkhSeXlhTUhvcjhOQVBxTyt4aTJ3?=
 =?utf-8?B?elZIR0U5WWcxS2ZVcVhsWjJqMzM5bGdDQ0llR2x0YzB6OGNxdlVaVXBFQ2M1?=
 =?utf-8?B?dER1MXRnbmw0NFRIVmt2dlFVMnhMYkkwaVJraXRaWURkNUJaNjI0Zi9DL1NB?=
 =?utf-8?B?VlRxRTZMaTJVaW1Od1ljTHo5dmQ1cnR3MkppcFVDUy9BZVNlRlNPVzZXZVVa?=
 =?utf-8?B?bU1Vc3dTaHpQYzAzaU5INERLOStRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB09A935AF18434EA6B6DDB19DC4D9C2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a22a1778-6975-4590-53d7-08d9f52d4eb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2022 11:28:39.1276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /3tZBDhy5DxtyY5g+5RIlkr0JXA9VJnVAnyBOnTz/xNhLT1SaJDkgp2+PfM7H3jvk4Q9pnVl1NUxuL7uRJtd5GGbZxUxOdI8prKLhrkmfUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3936
X-OriginatorOrg: citrix.com

T24gMjEvMDIvMjAyMiAxMToyMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gTW9uLCBG
ZWIgMjEsIDIwMjIgYXQgMTA6MDI6NTNBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+
IENvdmVyaXR5IHJlcG9ydHMgdGhhdCB0aGVyZSBpcyBhIG1lbW9yeSBsZWFrIGluDQo+PiBpb3Jl
cV9zZXJ2ZXJfYWxsb2NfcmFuZ2VzZXRzKCkuICBUaGlzIHdvdWxkIGJlIHRydWUgaWYgWGVuJ3Mg
aW1wbGVtZW50YXRpb24gb2YNCj4+IGFzcHJpbnRmKCkgaGFkIGdsaWJjJ3MgcmV0dXJuIHNlbWFu
dGljcywgYnV0IGl0IGRvZXNuJ3QuDQo+Pg0KPj4gUmVuYW1lIHRvIHhhc3ByaW50ZigpIHRvIHJl
ZHVjZSBjb25mdXNpb24gZm9yIENvdmVyaXR5IGFuZCBvdGhlciBkZXZlbG9wZXJzLg0KPiBJdCB3
b3VsZCBzZWVtIG1vcmUgbmF0dXJhbCB0byBtZSB0byByZW5hbWUgdG8gYXNwcmludGsuDQoNCldo
eT/CoCBUaGlzIGluZnJhc3RydWN0dXJlIGRvZXNuJ3QgZW1pdCB0aGUgc3RyaW5nIHRvIGFueSBj
b25zb2xlLg0KDQo+ICBJIGFzc3VtZQ0KPiB0aGVyZSdzIG5vIHdheSBmb3IgQ292ZXJpdHkgdG8g
cHJldmVudCBvdmVycmlkZXMgd2l0aCBidWlsdGluIG1vZGVscz8NCj4NCj4gSSd2ZSBiZWVuIHNl
YXJjaGluZywgYnV0IHRoZXJlIGRvZXNuJ3Qgc2VlbSB0byBiZSBhbnkgb3B0aW9uIHRvDQo+IHBy
ZXZlbnQgb3ZlcnJpZGVzIGJ5IGJ1aWx0aW4gbW9kZWxzPw0KDQpObywgYW5kIHdlIGFic29sdXRl
bHkgd291bGRuJ3Qgd2FudCB0byBza2lwIHRoZSBtb2RlbCBldmVuIGlmIHdlIGNvdWxkLA0KYmVj
YXVzZSB0aGF0IHdvdWxkIGJyZWFrIGFzcHJpbnRmKCkgYW5hbHlzaXMgZm9yIHVzZXJzcGFjZS4N
Cg0KfkFuZHJldw0K

