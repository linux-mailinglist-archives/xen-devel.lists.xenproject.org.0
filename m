Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2543514FE6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 17:50:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317477.536820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkSsW-00031p-Bj; Fri, 29 Apr 2022 15:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317477.536820; Fri, 29 Apr 2022 15:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkSsW-0002zk-8O; Fri, 29 Apr 2022 15:49:56 +0000
Received: by outflank-mailman (input) for mailman id 317477;
 Fri, 29 Apr 2022 15:49:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHQo=VH=citrix.com=prvs=11116ec15=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nkSsU-0002ze-Tg
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 15:49:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0141dc46-c7d4-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 17:49:52 +0200 (CEST)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 11:49:49 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB4853.namprd03.prod.outlook.com (2603:10b6:a03:138::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 29 Apr
 2022 15:49:47 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 15:49:47 +0000
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
X-Inumbo-ID: 0141dc46-c7d4-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651247392;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=gfm93Iow1XlI7W8OE9eMiTHaj1VPxEntJ+JhVXCXesA=;
  b=Ag/3+SuM6TQdzJ7qI4Jny4y88zk10EqHQyW5sm4xj+w9jXtb0+SaRD95
   LDfKndZF89ZUuEBbdlr6vKp4llMj6pwoMdIl9MNUBWEVAE7pm3kVQifaT
   UQ9JicZC0i4YGKrOMqmyIJ3z93qcn49g1iceTt9ocIH9E98mMfzqjczNx
   U=;
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 70126961
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2oUmzKL2EzfG3NMZFE+RpZQlxSXFcZb7ZxGr2PjKsXjdYENShDRUz
 DRNUTyHMqmLYmanKdB+b9nk9RgOvsDRx4JjSFZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh3tQ52YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PhQq9++Ey4sApeSgeQQbR50HX9MLaITrdcrIVDn2SCS52vvViK1htlLUgQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHM+FGvuajTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SGmKWMJ9gv9Sawfxnfu4i4rjZ7XDf3nJseTWvVqnl6Ju
 TeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCn1m71mEVThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1iPwQPJVGuw+rQ2IlKzd5l/AAnBeF2ARLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqWJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:KR5nV636yZe05OSioeWmCAqjBSFyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtrp
 uIEJIOdOEYb2IK6voSiTPQe7hA/DDEytHPuQ639QYRcegAUdAF0+4WMHf4LqUgLzM2f6bRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITA9OL8y7pvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wI9HdwGOtx5Dt
 //Q9pVfYF1P7ArhJ1GdZY8qOuMexvwqEH3QRSvyWqOLtB1B1v977jK3Z4S2MaGPLQ18bpaou
 WybLofjx95R37T
X-IronPort-AV: E=Sophos;i="5.91,185,1647316800"; 
   d="scan'208";a="70126961"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0at7XvN6Dsj1W8u+FhSV8AdTmzu7cBAP4uYhhowny7MsM8jzEMyjhoJPBeSG3VchZ1Sqhq2YnQgEETQkgf9IdyccXWCp/KsUzS2sXo99Hf94FyXhYi91dp8TwPIbFxYCypplnZ+OgFMWu1GJJm1ujOkDm8mxLCDiHSyba0+XJ8/CWvh1Mty1zoAMrgiB2hSFmjtaciZFjWjkBGGCitPIY0JfRnMNSYv+H/N/2mbR2V/USPi2cvzhuMfCIl2APQTtBdeoSh+S2QXap0T14lpfInaBM93jFHsOX55RjgBW3zK7PVGkP59RV6nfM0fRlU91KIG+tu36gXog2kwcJbTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqwtYr9MbPq26BhjSG4A0OamkZZIVBOEQ7KVXnMEnCY=;
 b=hPGzwDExYT7yhZZ6wRX3+OUDSYiKVyFOoHjp35EXwI4sxTl5XFgaY5pFkufvcxyrLunn0cP8IYjhr+gnGjPuRhbmNXiB0Z2RjkS4K1eIg7eADEswDsUYhX9qVbR2vKIVPsXQu0IbGiYXov/CaK9IDT/Xvl3A0bweVADQgIgN0WOnmoEZ3GF5Bhtt70ZWTxXKWhkE4u6/XQNI0xaSn71r7j9Ip6+edtrCkxGrwDvwuN9+Y9R3erlgWfjxMYHd51BfO0bbPhNx5C7ORFhsKMoJw4ifzXXt7Z7UYwT54KvVXjhEzcuH0i/OmCaeYeyYyq0wGy3viLf5ZL90eXpY6Ehiqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqwtYr9MbPq26BhjSG4A0OamkZZIVBOEQ7KVXnMEnCY=;
 b=JxgEd2EgHqg9kygohNS9w0Zb5vXz/ItmAVhZluDlKVopEca8GxOkZhp/bOgIGVLGwtBd+tZ7mXhWd+tEOXT45ceQWe1fiOirqeJlpDshl1Rnx4vD6PqvXDgE9n/4FU1/oHy1SdqNVdnkeVEe9bptlngNHfbXauJ8b10zUHp3xBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 29 Apr 2022 17:49:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Message-ID: <YmwJFqcfOX8oFcyI@Air-de-Roger>
References: <20220427104718.81342-1-roger.pau@citrix.com>
 <20220427104718.81342-4-roger.pau@citrix.com>
 <38f0e56e-f72f-698f-c4c3-5973ec9e46a3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <38f0e56e-f72f-698f-c4c3-5973ec9e46a3@suse.com>
X-ClientProxiedBy: LO4P123CA0194.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a0c71c5-201d-4027-ec24-08da29f7e35f
X-MS-TrafficTypeDiagnostic: BYAPR03MB4853:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB4853252B9CBDA25A9D1AB34F8FFC9@BYAPR03MB4853.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LjPf4BcYJJH/lwFfHhBrsqki5YyGnBYPJ5lk30OmG0szc2V2ZxYvPuC8JJyQEviSTRAilHvpQ9lecEKVtFURMf8tpgoLQC2ZFZuFXwlA2CzHMn1PjM/hGB/uJbvF8J2aWrCFgfS54s1aIu5atpCBaZPBcD3CsWhlUFjhS8q7IeQfxpzMkyJ1FpkEWpyCUzPqIJm27zrPl6ckkhStlYqOYfRw0ylnPmEGNO5dlH7qvH8141i3ITSBT1ggx+a8idjBQ9e8r2wKDuNO3oSejCPV5VOfn/h/dbcKavsriQozGJuawSPW7lD33kQv/8/QARgd3G+Rp+o3P41XC0C0I9EMG62QmfO3Oq8x+DdJlSj+hAT3tbBppKX2r0IzQYu1q5O9hK3uqOBMuvTd5P5OcRePw4sNMTJyVctfUpJKnrDg6EDtbzRkzXlUsvGZU18dxwhP9eT1SAjvxlbVpjwBMAgMNXHwIUpCwMZzLlp31uD1sIDbTIO9fravRJOJQ4KJxQ40YvWRG2ilf44WwhoftnhvtkxzZlQbLEkxlYVwb3QW3piCQGpZzAvwqWAzCX1Zv76lMXDeIdkQxvvL4n+KZ1iLyf93lh5XhwV4Vbo975t2eB5kyIf9hLzCqEa0VNm0y2CyPoOm9HCP9eZtbAuhqzmbpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(26005)(82960400001)(4326008)(316002)(66556008)(6666004)(66946007)(6512007)(5660300002)(8936002)(33716001)(2906002)(86362001)(38100700002)(508600001)(6486002)(54906003)(66476007)(8676002)(83380400001)(9686003)(6916009)(186003)(6506007)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEt3UUxRMVFWQzRSR3R4ZkJJeGNxYU5LN0lIa1dDVGtycVJiMEVEVzd3RVRw?=
 =?utf-8?B?cldqMWRkWks2ckhGOXU0Nmh0cHZBbStkYzJNMUhZMEVPcDUvbVlVblFHUk5U?=
 =?utf-8?B?V1ZRVWVNc1hDcGNjbUZCNWpQUnI4NmdGeFNqQXgzTUNQR1F0MXVFQWUvMFRz?=
 =?utf-8?B?ZENFNW1lMEluMEdBSGFONVRPKzF5VmlaeWplTHZGQkZMeFBBSVkvWDRHMXdM?=
 =?utf-8?B?L2tIaDhhUEFQeC9FZ0xoWGowTGdWNGtUWGZON2o0aDBFdlorRnFrTGtWTGIx?=
 =?utf-8?B?eE9xWldhaEtHcHlTZWdlWEx6M3AzbUFDbHQvcDBpMnpudFF1YVE1OE5Wa0NV?=
 =?utf-8?B?ZWhCMWF5aVBTdWlRYldWNUNxOXJBRzM3L1pibitQNG41OWR4SGpJRUZlTXJJ?=
 =?utf-8?B?dnhhb0QvUTRTN3dNNmFDR01aTURYRjFoWm02OVBzNmthUFVoMUlHLzF4TjJS?=
 =?utf-8?B?OWpLc1EwRjJ0bnI5V09jTmIwU3hFYkNvYTZRMHZpakJWTVBocDZuSXVNOGg3?=
 =?utf-8?B?S3RRSkFlTWFwRWJ4RW5TenFidDNTbk5KdEQzVDBIMktsMlNCZ1pBOFY0aSs4?=
 =?utf-8?B?M0xmVE9GYnZDcnlvTm5XSUpWZk1ZM3NQYlYzemVqOTN5SSt4bStockw2WmVF?=
 =?utf-8?B?bnA4MTNjN3RGQ0dxRXo5T1RsSUpQRlNhdmlNcmtHRDZ0U2VadVo1TVg3b0hw?=
 =?utf-8?B?YVFycjFTRU44ZWZIOUFyRHo4S3MwWWV4Yk1hamxkY3kyQzdldDVqMlN4aUZV?=
 =?utf-8?B?K1FmYVc2M1VWZDNwWlZHdUxxbmRZZytZREFLVkdBMWlTMnZSTmJoc3crUmU3?=
 =?utf-8?B?enptbGV2TCs2UVVJOEMvSjJJWG1FK3JERU1DZHZEYXZ4dWVITUJiKzc1N3J3?=
 =?utf-8?B?YW1meUwrOHpoNTBtaDNUWkkxaUh6TG5WSFFKeDhIdU1yYzliMFVHU1N1Mnp1?=
 =?utf-8?B?TmQ5VGlIcGU4eHQ3SWdzT00yRkhWdmlzMU5saWxzVkJmRmo2Mk1ST20vWU5Y?=
 =?utf-8?B?SjNwUmhUNzYzSWtCbTVoWXBkaWRaS3JMbXRKYVB6VVhhcitxZnBWVzllak5K?=
 =?utf-8?B?QzZ1VUpqdDY1c00xcjRRVFB5cTBTQTJOZkdPL2luTGtQR1BrOXVCOXpyVXpZ?=
 =?utf-8?B?RmZKUXFqVFF1eDRqMVVLZG4vM1JzTFlYdkV4M25VWXRWS2gxaldGanpQU3Rh?=
 =?utf-8?B?T01tZFBudWMwOENSbldLaFVaWEpGUWpib1F6T0lwQjB1bUhCOVJYajJrbXF4?=
 =?utf-8?B?OEozMzhZRForTEhCN01yU3hLdjByWmMrRkltVDlWSldXOU9hOUd1TUFVUEpz?=
 =?utf-8?B?Tk8yRm9qMndORVBlb2RSdnJ5VytXdkpVdFdHM2pGNkJORy9mejNCUzlYZ0oz?=
 =?utf-8?B?WFlvdWRrem8zcWZrSnU0dmx6Ky9TYS9xNGdnSnhVQURFRjNzWkloVWxrdXl0?=
 =?utf-8?B?VElEbFFJT2xBR0hFQU5POE1lRElSbXUyMVNKcDREUmlJSDM4RzI5WW1jSzJF?=
 =?utf-8?B?Rk9vK3dWUXZhYnl5NHFHbU96dEVrNW0xWEdPNUZFT0ozRDRXNnA4UEwvQTlJ?=
 =?utf-8?B?dnhueS91THNjL3hHZ21XeDRTdysvbU1mZ3pBQ3hUMWovOUc2T1pkZTc3ZklK?=
 =?utf-8?B?aEg1Szkrb0ZQQitpRXlkZFdzQ3p1MkZ4YndZK3lvaXlmTVkvZENWM21oS0x2?=
 =?utf-8?B?bUpIUkJ6aXM2VWRhUDhEV2w5dXhqc3duNGdCMGNYTlZnTTk4eUtLRFphVUNx?=
 =?utf-8?B?NmZDcXZLL1B5VWI3MHlrcHVKTEhxMTF6NGdCUTZzbUxFMDI1VHJ5Vmdrem1S?=
 =?utf-8?B?VGRvdVo4U2p5L1NVclc2dU5MWWgxTmpHUnRzKzZWWWFEQ2lHWTE3R2JlWXFa?=
 =?utf-8?B?KzRHOUE5MDhNQ0tJcDBFbldsZW9vaTRQbkZub3E0TjFyMXVXY1FMeWZrSWMv?=
 =?utf-8?B?aTZHK3RFOHNwbGV2bldsVDFPZXRGUDE3R2k5dkh6dkZKNGgxQjFYSHNPbGFl?=
 =?utf-8?B?NGNwLzI3ZGtNRFJzaXJiaURsK1UwSnN1TEpYblpuMUV2Tk1ibU96UjJIUDRk?=
 =?utf-8?B?cDBld3AxWTFac2VWeHdKSzFacmE4Z1JucE0zWlhuenZhZ1FpUzlXNnF1WURY?=
 =?utf-8?B?cS9GL0NYZmIvK0hhRm02bVlVRnptYlhXMVhpQzM5blRKMzZQQTJMdnBra3RS?=
 =?utf-8?B?ZklWSGhEaUorbzZ0N21rMld5STNKOCtKTTBtb0UrNklVdVE5c1NYTE9sazM4?=
 =?utf-8?B?cTIydUt4SWkxb0dRMzR0bk96NVNMTTJ1TmczK0VTMytsN3NSdW45aTRpeXhC?=
 =?utf-8?B?TUJMRktqVUgreStYZ1k5RUx1OTBJQitSRGZESXBaVFZZRWlpN3JFQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0c71c5-201d-4027-ec24-08da29f7e35f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 15:49:47.6440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZLrAmzYU+53xWmredixELGe7Ld5eFCG2G0A5GCDW/BkDoHxCUOSQLqPHEaeMfEAILJUEaSLnbLmKRY2znhkIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4853

On Fri, Apr 29, 2022 at 12:59:58PM +0200, Jan Beulich wrote:
> On 27.04.2022 12:47, Roger Pau Monne wrote:> Changes since v3:>  - Align ssbd per-core struct to a cache line.>  - Open code a simple spinlock to avoid playing tricks with the lock>    detector.>  - s/ssbd_core/ssbd_ls_cfg/.>  - Fix log message wording.>  - Fix define name and remove comment.>  - Also handle Hygon processors (Fam18h).>  - Add changelog entry.
> What is this last line about?

Hm, seems like I forgot to do a patch refresh... So new version will
have an entry about adding VIRT_SSBD support to HVM guests. Sorry for
spoiling the surprise.

> > +bool __init amd_setup_legacy_ssbd(void)
> > +{
> > +	unsigned int i;
> > +
> > +	if ((boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
> > +	    boot_cpu_data.x86_num_siblings <= 1)
> > +		return true;
> > +
> > +	/*
> > +	 * One could be forgiven for thinking that c->x86_max_cores is the
> > +	 * correct value to use here.
> > +	 *
> > +	 * However, that value is derived from the current configuration, and
> > +	 * c->cpu_core_id is sparse on all but the top end CPUs.  Derive
> > +	 * max_cpus from ApicIdCoreIdSize which will cover any sparseness.
> > +	 */
> > +	if (boot_cpu_data.extended_cpuid_level >= 0x80000008) {
> > +		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008), 0xf000);
> > +		ssbd_max_cores /= boot_cpu_data.x86_num_siblings;
> > +	}
> > +	if (!ssbd_max_cores)
> > +		return false;
> > +
> > +	ssbd_ls_cfg = xzalloc_array(struct ssbd_ls_cfg,
> > +	                            ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS);
> > +	if (!ssbd_ls_cfg)
> > +		return false;
> > +
> > +	for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++)
> > +		/* Record initial state, also applies to any hotplug CPU. */
> > +		if (opt_ssbd)
> > +			ssbd_ls_cfg[i].count = boot_cpu_data.x86_num_siblings;
> 
> Perhaps flip if() and for()?

Indeed, thanks.

> > +void amd_set_legacy_ssbd(bool enable)
> > +{
> > +	const struct cpuinfo_x86 *c = &current_cpu_data;
> > +	struct ssbd_ls_cfg *status;
> > +
> > +	if (c->x86 != 0x17 || c->x86_num_siblings <= 1) {
> > +		BUG_ON(!set_legacy_ssbd(c, enable));
> > +		return;
> > +	}
> > +
> > +	BUG_ON(c->phys_proc_id >= AMD_FAM17H_MAX_SOCKETS);
> > +	BUG_ON(c->cpu_core_id >= ssbd_max_cores);
> > +	status = &ssbd_ls_cfg[c->phys_proc_id * ssbd_max_cores +
> > +	                      c->cpu_core_id];
> > +
> > +	/*
> > +	 * Open code a very simple spinlock: this function is used with GIF==0
> > +	 * and different IF values, so would trigger the checklock detector.
> > +	 * Instead of trying to workaround the detector, use a very simple lock
> > +	 * implementation: it's better to reduce the amount of code executed
> > +	 * with GIF==0.
> > +	 */
> > +	while ( test_and_set_bool(status->locked) )
> > +	    cpu_relax();
> > +	status->count += enable ? 1 : -1;
> > +	ASSERT(status->count <= c->x86_num_siblings);
> > +	if (enable ? status->count == 1 : !status->count)
> > +		BUG_ON(!set_legacy_ssbd(c, enable));
> 
> What are the effects of ASSERT() or BUG_ON() triggering in a GIF=0
> region?

So AFAICT the BUG itself works, the usage of a crash kernel however
won't work as it's booted with GIF==0.

Maybe we need to issue an stgi as part of BUG_FRAME if required?
(maybe that's too naive...)

> > --- a/xen/arch/x86/cpuid.c
> > +++ b/xen/arch/x86/cpuid.c
> > @@ -544,6 +544,16 @@ static void __init calculate_hvm_max_policy(void)
> >      if ( !boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
> >          /* Clear VIRT_SSBD if VIRT_SPEC_CTRL is not exposed to guests. */
> >          __clear_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
> > +    else
> > +        /*
> > +         * Expose VIRT_SSBD if VIRT_SPEC_CTRL is supported, as that implies the
> > +         * underlying hardware is capable of setting SSBD using
> > +         * non-architectural way or VIRT_SSBD is available.
> > +         *
> > +         * Note that if the hardware supports VIRT_SSBD natively this setting
> > +         * will just override an already set bit.
> > +         */
> > +        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
> 
> With the 's' annotation gone from the public header, is this last
> sentence of the comment actually true? Aiui code near the top of
> the function would have zapped the bit from hvm_featureset[].

This comment is now gone, and there are no changes to
calculate_hvm_max_policy in this patch anymore.

> > --- a/xen/arch/x86/hvm/svm/svm.c
> > +++ b/xen/arch/x86/hvm/svm/svm.c
> > @@ -3126,6 +3126,8 @@ void vmexit_virt_spec_ctrl(void)
> >  
> >      if ( cpu_has_virt_ssbd )
> >          wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
> > +    else
> > +         amd_set_legacy_ssbd(opt_ssbd);
> 
> Nit: Indentation is off by one here. Of course this alone could
> easily be adjusted while committing.
> 
> > @@ -3138,6 +3140,9 @@ void vmentry_virt_spec_ctrl(void)
> >  
> >      if ( cpu_has_virt_ssbd )
> >          wrmsr(MSR_VIRT_SPEC_CTRL, current->arch.msrs->virt_spec_ctrl.raw, 0);
> > +    else
> > +        amd_set_legacy_ssbd(current->arch.msrs->virt_spec_ctrl.raw &
> > +                            SPEC_CTRL_SSBD);
> 
> Would seem cheaper to use !val here (and then val for symmetry in
> the other function).

I could even use !opt_ssbd, and that would be more similar to what's
done in vmexit_virt_spec_ctrl?

Thanks, Roger.

