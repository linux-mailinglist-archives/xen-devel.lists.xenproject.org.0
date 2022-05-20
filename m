Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C583152EA0B
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 12:39:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333756.557660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns02D-0004iV-5V; Fri, 20 May 2022 10:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333756.557660; Fri, 20 May 2022 10:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns02D-0004fz-18; Fri, 20 May 2022 10:39:05 +0000
Received: by outflank-mailman (input) for mailman id 333756;
 Fri, 20 May 2022 10:39:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns02B-0004ft-N4
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 10:39:03 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f370b26-d829-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 12:39:02 +0200 (CEST)
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 06:38:58 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB3592.namprd03.prod.outlook.com (2603:10b6:a02:ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Fri, 20 May
 2022 10:38:55 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 10:38:55 +0000
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
X-Inumbo-ID: 0f370b26-d829-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653043142;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=daoX953iOxPnmzVX4DqZgysDzroHTTyfQ1x+s/wWFYw=;
  b=ax9Yf0k17wDGMo//a3bVq/mUX481GgTRgk/ovQJu1+OYnWsutJ9Y0blr
   M5SJTomBhJD6l4UbK8G1N0ESUZul6HKz7Gah9zfcY0BcyBthcgxAWcb5b
   Py3CSuUj41ZHNWvrrqFiIP1iKDmlYTAr4Z73HYQVfIMdpOIfHMtKbrL3x
   c=;
X-IronPort-RemoteIP: 104.47.70.107
X-IronPort-MID: 71774954
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:af6xd6BM2nxc1BVW/yXiw5YqxClBgxIJ4kV8jS/XYbTApGwg1jIFx
 2FLWG/UM/2CZmL1e95za4ngp0xX6sLdzNA2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng09Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhy2
 OdUs6OACj0oYPT9hMgtbkQGDRxxaPguFL/veRBTsOS15mifKz7G5aorC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6l+B8mbHM0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjx2SajImAEwL6TjbcT/XaP/DIq6bPsLsrlIMOOVetwslnN8
 woq+Ey8WHn2Lue3yzCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAa7EW2SvHtUhv+p2SL1jYfVsRRFasm6QiL4qvS/wudQGMDS1Z8hMcOscY3QXkg0
 ACPltawXTh36uTNFjSa66ueqi60NW4NN2geaCQYTAwDpd7+vIU0iRGJRdFmeEKosuDI9fjL6
 2jihEADa3871KbnC43TEYj7vg+R
IronPort-HdrOrdr: A9a23:oM/TmauZg1DKABxUB8aiU2ie7skC/4Mji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVeUiz9bUN1LNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJrJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUUHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0k9
 gsfJ4Y0I2mdfVmHJ6VNN1xP/dfNVa9MS4kEFjiV2gPR5t3ck4klfbMkccIzdDvXqA0570Pv7
 mEeG9klAcJCjfT4Iu1rdB2ziw=
X-IronPort-AV: E=Sophos;i="5.91,238,1647316800"; 
   d="scan'208";a="71774954"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJDqH7JHk/zT4P8o0rW/tMz9LgtjPgHjDvFljcFoZWOutEpR9i4ZbcscSjzJCEAJsVMU7pSzw8RW3sUFaN0Y+0Dn4EOslZQ+jG2fozQw18VivhXUGhHAR7yBXU5nbSpmaxvpFnqcFgcNov6pygX22x5WT7UF3FkpVGkj3W7c73a4NAZMY/a08gblxRjSc1/izIrFF9/cm0eOwVXALGx4pNrVUOPz2G/pELM6S0ef0S9YZAn4i+E5Tx8gNUAAxXtoV2a1uIECInB8LguZSj6GQzaAAGgbCBV53JJRXbUHf0OBgMUZJ7s5cDkOSqHkBwc0kvPhhLnoE6J2qKWwcNZqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vX2awDhbP6uvAySCIHuiB3VbLGxnueUtPToMQYR9gpc=;
 b=ncqozEhafFSC6n3YxoCQr6OhxJMuC7nyYuf8s4zTaxsFCApdq4jh3ViokD9S+tV2XAufhi71WHbZ2CwN95PqRt7zA7ruZXFvKr5CSpjXbuDdM0DLpWnaeWviUsKE0eF0VnIu2g/IN4hecSylvKexCj+Ze9BkaoL8ho+02IpMQGocu2FIvtrzrcuoL/GjxpisduwqyBAXvDmb9ZZvZFDVMt6Waa9QP5c74p9GQkosv4J8lu2HNmMj92sQvJwG7PWBjMRJRudkIzUkbpRcFOjW8bFHWW4fU7n5SGkIWheGpmBqo3F5qhBSYL2616jAHOdUUAHpNjr5bdkBeNs+2Vm5Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vX2awDhbP6uvAySCIHuiB3VbLGxnueUtPToMQYR9gpc=;
 b=eX6n+3FAJhaIEz0LkKkHD873aA2ftCIy8z7GAwA9gAbQrZEaI0Mt01ne54DlFd+W/ZLcA6ouhyyXyQsYJmxvrmTHyCrA/3uEwV6HGbJlJO7M1yODIE36hwn5SYxwY3njlIZRFbRdYUcC0prTekzCW5Sz7EZQBBWRW/Qd1SQQuIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 May 2022 12:38:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v4 18/21] VT-d: replace all-contiguous page tables by
 superpage mappings
Message-ID: <Yodvuw18WLgcS10F@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <98553b89-6296-9e4c-4677-9201cd7cdeef@suse.com>
 <YnuZFkzfjagzk4Hv@Air-de-Roger>
 <1f029c34-f300-3841-ab20-85aa796b486b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f029c34-f300-3841-ab20-85aa796b486b@suse.com>
X-ClientProxiedBy: LO4P123CA0099.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e831be2-b1ae-46dc-a660-08da3a4cf090
X-MS-TrafficTypeDiagnostic: BYAPR03MB3592:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB35922B6136127874E98FF4318FD39@BYAPR03MB3592.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	frxiuGl8jkYELmnKA+EG0mf2LZ2U8qYx6fKzE5feJV1/0/PIwxEibcD4KrzcfDrtQU1PQ9Knlk2zN7jH9mIPSxrFgflMe4ZEW67mmKzPMcY1iRiJ3jWjKTWypGtLfar2gkASx8h9kBdGHK9d8wYZ5RwGFispz+AqbPk1IRCIvP9r3NsYHbXz3XgSwlJ5tEbrtOFELoed03Yta90FeoBEh2hQwoeDOgCFDwpOo2FZ525J0GHlq4mhR0skfU450dp+d3v8hhljqcp61z9YWlSUf2vwTruuuNmUN5zFhVlq9P0Cz1sr+V+knEkBhbyj0/ETn6KmMQjtBZfUQIh5NetqjRneZaQUCmS8rO0ebUhs0LBdiQpykL552COTwJ/0EdWpsRqIJH/tZ52+xwzJjQxNyzBmx1Y3L1d4o9PzcUkOqZhOAH4Toc5LH6Bl4C4UU3w9tSbGvS4nyNTk74J3hAmMtM1fhErqHjiwJIpNnSK1VK15n5ScqE8DBODasia7l+FkY7/XsnHQUJyfIuP02XI3a8220ZOrVZjgqQOPoDeuIgwffs8/Bm/A4sj20g3diBklQ1X/96muhmHhtsAoJgv/BFS9xxkZPvQbo02yHSbe6LU7OJVMpdTU4G7XsjObAAjCXjcsOyXzroquRiTtvFhMCg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(38100700002)(316002)(54906003)(82960400001)(9686003)(6512007)(83380400001)(8676002)(66946007)(4326008)(66556008)(66476007)(6666004)(2906002)(6486002)(186003)(86362001)(53546011)(6506007)(33716001)(8936002)(85182001)(6916009)(508600001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVBHUktuajR2OVVWeFdZZVJlWnZaQUN3a3B2V0NyK1J3KzlRSG9PdUxDRkpX?=
 =?utf-8?B?SjA2ckRtNzZtZGJPV1padnI1V2V6S05peG9tNCtKSGl0aGlRY01Qa01WUmdJ?=
 =?utf-8?B?WHFLZWRjQ1lxSm9FTENSbWFEN251RlkzazhPaWpJRmIrTFJLbHVMUmFUTXU2?=
 =?utf-8?B?eDZNU2IxeExkWERIMXVwRjNGYnQzdG5UTnFiWERYMENiaU1WaU1ZVEhFY0d4?=
 =?utf-8?B?R2trN2h4MDNZTEd2aHhZUmd0OEdGTzJucEp1ZFk3aEIxQ1F4eVZGTzNxWGJj?=
 =?utf-8?B?UUJOSzF3M29RUExmTnd1ZlcxemZTaStKaW1OZlRMeENiZ2dIOVd1ajhKM1lO?=
 =?utf-8?B?NFp5MmJ5NlU1b2pqaWdDRU95dDZ3aS9lTW83UjRkYS9haXFaNzBieUFKZS9G?=
 =?utf-8?B?L0ZhWitGTnNQTzFlMmdtaXJyT0JiUE5QYzFUa0NsNEZYd1JSdVRrK2JzZGsx?=
 =?utf-8?B?c2t5Sm4rM3VYZzVtYVJkWklQNFVwZFVQMm1vR2dFZ0ZXNnJhYVdQYjlyWmxD?=
 =?utf-8?B?amQ5SzFqMHY4Q0NwTkNrZEVlMEtXM20zNVJhRk1WVE9nQVRkUUY1bkhXTFd1?=
 =?utf-8?B?VFNPQ29RVDM2aHdOMHZWV0JyWjgrdnpDL2c1bzkxWXgzSUdXRTFXK3lFaVpQ?=
 =?utf-8?B?QVFidDBNSlNaK3p4b0N0VTQ4ZWFlSmRXMk9oNGZOTGI1NnlXNUFkTEhSak9W?=
 =?utf-8?B?MW41OUZvY2N2MHFTdmtuWDVzS0RteFZFQjg1YSsyZmhCV0l4OUdLbWVyaDhl?=
 =?utf-8?B?ZlFNZ3NVc2FyN1dNa3BRRmc5UlRGSTdiV28yWTBacVVUMU9TbFJlcFVlZElJ?=
 =?utf-8?B?Z0luRzF0djc5ZENYRFpFczVOQmZwSzN3VW1KYUhuRXI1blIyUUgyMVcwT2tL?=
 =?utf-8?B?cU1VMVVJcE1UbURody9pOTZuZ1lZMkRpVVpKTVJWdTY5Q0NBd1hIdXpSYUpi?=
 =?utf-8?B?VXVEejVYTkE2U05tRW52c0R1R3JVMkUyUlRjaFNvaDd3WVJ2Ri9FZmJzalBN?=
 =?utf-8?B?aE14azg1MitwYTNTR0NmMmdmZUhub1VYRUg5RkliVkNEczI5ZlR2VkZtUWdv?=
 =?utf-8?B?akZSTFBiekJVNlFWSUVFTmMyNHo2NENubFZnSitMb3VlbytoUE1ycjdmUmlu?=
 =?utf-8?B?N2E1UEVVeGJZcVdxakVRTklnU0JPa0J5R29NUkIySXJkQ1I5WmZoZHlSdU1h?=
 =?utf-8?B?cmd2V2NiQjJCN0RQSkRtRVJMdXZlQlpBNGk4cHlOa3J2ZzViaUhKUW8wVEFi?=
 =?utf-8?B?SlNWYi91UGhJWDJadkNNRWk1amxWOFlFcDVwYVFzaE1WbnhWVW05bC9OU2wx?=
 =?utf-8?B?d0owZHpOYWpHRGVOREdtZ3Z1OWtZMUNNZjBINUcvZHVwU2I2ZTd2RzB0azJu?=
 =?utf-8?B?OUJhZWxHSWpjMVR1Y0o4b2NvMXdyMTVOYTNhQU1Ld3lmVDVzWktaMkNMM3Iy?=
 =?utf-8?B?aVdpUlI3cHpBMUE2Y0lIN0NhU2RhK0c4Rml6YU9wOCtHZmQ3NkFxNExBREJ3?=
 =?utf-8?B?amVZblliU0hxdnNVN1ZLSzFWVVVsbVJlWEIrQmM5UVRaWTJpTHI1Sk9HUXB6?=
 =?utf-8?B?TGo2dklNSS9yT05pWkJzZWJoV3lQcXJrSFV1REFvOEZLYWh5U3JyOWV1N292?=
 =?utf-8?B?SDVwN3JlN1dFQ3R1ZnpsamlGbUxMTUtPRnRUN3FTYUV1WGJRa0pHRDFpS1VC?=
 =?utf-8?B?MEJodEtsbi9HQXhOMDhUcGU5aUUzSHpJZ0N5RnhCUXIxbkJ2aS9qdUVERzZE?=
 =?utf-8?B?THlrS3RHOVdqdVErcXVSbGx0VG5iVFVUTXA0K3lLcFFMZ2RjQ3pTMkFpYlpi?=
 =?utf-8?B?czF0VlF5ckJhUXhGb1MvbThrRHZ6LzlNTjc3Rm1EbjRMdjduVDNXQ2w4WmRo?=
 =?utf-8?B?U0QyNW1kaDZ4dUtOZWtTNHpya0YvcDVDYTA1Tk14Zkg5Q3Z4aW1VdkRERzh1?=
 =?utf-8?B?dVFwK0N2cFpXdGF2dzRvSDluaXBXbzlGdERSeHE5R2xxMkVjUy82OVhSaFZv?=
 =?utf-8?B?SEtheXlZMlZUTFBaaFpuNkVnNmpZL3dUaXdETCtOV2p3N1ZveVl3RTI5R0JQ?=
 =?utf-8?B?enVkMG1VSDUrOEpTM2JRTWZvOXFScXNzZjJyRVVQL2JIUGNyelNRZjlzajJ6?=
 =?utf-8?B?V2VOODZaWUtRUWl5R09uaC8wUmg1alJ2UGNjQzREUTIva01PNzh1MFc1alVl?=
 =?utf-8?B?dS93WEZocVpQaW5UTkdwNCtjcXpIVmQxVnFiaXBETklnb2Vhc21kQ1BzSzRR?=
 =?utf-8?B?NWNGU1h2T2o5RXg2Q2tPK2x0V0ViWWdXSm43aU5ONlJKTTBwRmQ3SktMbFNN?=
 =?utf-8?B?N0c5aVJETmlkS3NXekY1clJRK1NFL21rU0hwWWd3RXZ6UnlnVTNoR0l5MG1s?=
 =?utf-8?Q?/WxNrorm28F1zoRk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e831be2-b1ae-46dc-a660-08da3a4cf090
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 10:38:55.6158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Uduqtp4j8H4JMrzzpKm111gKsAzGH9X5K7B4Teq74B5/ueJsyA/FE9qR1TAY5shuAYwn9dzSA0MkWi3frLrYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3592

On Wed, May 18, 2022 at 12:44:06PM +0200, Jan Beulich wrote:
> On 11.05.2022 13:08, Roger Pau Monné wrote:
> > On Mon, Apr 25, 2022 at 10:43:45AM +0200, Jan Beulich wrote:
> >> When a page table ends up with all contiguous entries (including all
> >> identical attributes), it can be replaced by a superpage entry at the
> >> next higher level. The page table itself can then be scheduled for
> >> freeing.
> >>
> >> The adjustment to LEVEL_MASK is merely to avoid leaving a latent trap
> >> for whenever we (and obviously hardware) start supporting 512G mappings.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> > 
> > Like on the AMD side, I wonder whether you can get away with only
> 
> FTAOD I take it you mean "like on the all-empty side", as on AMD we
> don't need to do any cache flushing?

Heh, yes, sorry.

> > doing a cache flush for the last (highest level) PTE, as the lower
> > ones won't be reachable anyway, as the page-table is freed.
> 
> But that freeing will happen only later, with a TLB flush in between.
> Until then we would better make sure the IOMMU sees what was written,
> even if it reading a stale value _should_ be benign.

Hm, but when doing the TLB flush the paging structures will already be
fully updated, and the top level visible entry will have it's cache
flushed, so the lower ones would never be reachable AFAICT.

Thanks, Roger.

