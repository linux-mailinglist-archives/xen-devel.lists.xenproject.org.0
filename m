Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A9F2C0532
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 13:08:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34113.64953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khAde-0006nv-AZ; Mon, 23 Nov 2020 12:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34113.64953; Mon, 23 Nov 2020 12:08:10 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khAde-0006nW-73; Mon, 23 Nov 2020 12:08:10 +0000
Received: by outflank-mailman (input) for mailman id 34113;
 Mon, 23 Nov 2020 12:08:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1khAdc-0006mg-6j
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:08:08 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18cbe7dd-4d42-4d43-87ad-77d1413812dd;
 Mon, 23 Nov 2020 12:08:07 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/SOx=E5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1khAdc-0006mg-6j
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:08:08 +0000
X-Inumbo-ID: 18cbe7dd-4d42-4d43-87ad-77d1413812dd
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 18cbe7dd-4d42-4d43-87ad-77d1413812dd;
	Mon, 23 Nov 2020 12:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606133287;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2LP87x5kjG2xivPZkwr9dApE+dAaOSQIhfqR9PmApl4=;
  b=KDHTFSsoYyn8ozmNptcYn+Gau5zxg7BAJlFWFrbj61NB8qf24Zoz0hdr
   RMaGbxw1B4NmZT8dTbR18qjTOvQNKBEm54PyA7/DhTByMvCoPAsDF/xr4
   d6bF7/9nGjoe8s3Sv0IPQraAR5buOSfkqsqCU3BKGIsMiJyGMdyXLrLEK
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: l3yS6Hc2TnEnP+vWPTqEpy7cMQaku9aSTL2C99NqzgO9a23Z/uFNb7gwm28huXkn/3EgMgEJhv
 Q6OfKoM1oWrm3s8XI3Z2iLTIHwoS6QcCjwItBvoT/q8Wgi2xB97/TfQ1yjIzYSG2Vqn+TxtPxL
 BB8WF/6QdnSgsBDjG++2TQlfsXFnLANFCrCSDypAL8fbVqK9n0RQrWfJONWtpNBlXIRqCIpNxh
 ASSHyZXPIaA5mNTXkPsiJkbbchw8o6ZDMGl1kHqZ7zj2yySshnTPrTXnBR1rDKNhSoUPH5+LjI
 pfs=
X-SBRS: None
X-MesageID: 32891285
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="32891285"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoPX1qJc0JnbIiBaSzttsS3w5EeV45naksqI+2K/ha7I8rWAUpB+APd5pPkubK7hR4whD6Kj3dX1L8raBwEWADg9ZoAWwG4zqS4v90bm9U9redRHCtb5zIefCli/phW203sJDUmu73QdOUSYN4Fqh9t/TStL7GwHy+wkCKUiCWePv/cevAqKxMLRSG+tyMJe+9yb8rHN2FVwGasQOzn6MHihG23p3sNEJdLHKUvEh/2OgsZyq7b1aFc8+fdxusqOLIuenV4EN2lnASMyZYGZZ4y27MBQwMgcWIPTRj2r0ATfaZPN1y1KEANfqO5vbf9SOC8kvR28GPFnUzc++FH16Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZfya7UYdqHgTdqJL+cOXpho71GTWHJAI5CqVUxcWcY=;
 b=fh25HphKfHP1B7nmXoLyZ0cq3GyMXHiweesUZTPTZs9ckLcA5KXcmiQac+coy3PZ3tQ5bD0lHN4sFP55QApvNUyzuC3p0jrljn7ZQgfrFJUav5sqBzFB1Tg2gfocokR0NNuIIM/eyNuvycxKzA1eS6ka2MfchfVrUIUyxhpZzArXeMHAqOL+JMFJZiWGbU1UWV1bc4R+foHOLzuevoiOj7vv9RwregfH6J3T2HviUsxLR0n/wRusGLY2taMrKpTRgtt5Rpo4+QzLGzkoHIBL7kaTvqrlTCZg6g0RsV2jfYbQjiuNeJiQcq4YkRd9rNSSpf2iY0NKk0kXFH44c2fbHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZfya7UYdqHgTdqJL+cOXpho71GTWHJAI5CqVUxcWcY=;
 b=lvqq/1VuIDkKrffyYuITkRocSR5cu0KMCEflbqmUR4VDsZbsJ7ml70QQmu7++BOOKMrSEbJyZFH9aeQmrHPQyJnvpHAgMpa14AQLPXqvDICZcfxrq2Fnyd1BH7BzRGIQNfQku/89JEMT+ZddE+YOmrau19LpZOYGs2K3GOCJ/hY=
Date: Mon, 23 Nov 2020 13:07:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: E801 memory "map" use implies no ACPI
Message-ID: <20201123120758.aefatbbaqy5s7l3t@Air-de-Roger>
References: <18ca8671-1478-3dc8-7b91-041dbc18829f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18ca8671-1478-3dc8-7b91-041dbc18829f@suse.com>
X-ClientProxiedBy: MRXP264CA0020.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59625594-2b0e-4f08-b159-08d88fa86df8
X-MS-TrafficTypeDiagnostic: DM6PR03MB5273:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5273923B47ED60EE89FD0BF28FFC0@DM6PR03MB5273.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P3t9ANiecFMwOQzeMN7SgtFFdAyO2jy5AIqK99Vt3/QFtE7mf7OChw4aHpH80qB8P5lHafM61yyz4XIRkWAs1O1MtgsByJG+VZfqLdbl6yFoAR+XizGgfy/h6A0JfuLTnYMjpCCheC6pZmCHYBl65DYOg1oe3COT7xWgHsG5aHAI8IH+gZnZfRFnVXgfiaM9ZI/8hAlOIr67wDPmGcTyeQ+n6ovz+nPfb2UuELUaepSRULVI5Acn1sARY/HXeRjSduj6C/tyIV/iJsoM40+5oWDIIlIJbTicrNl3oLE7Kia8IhWvUg1USjWsv9LA0e2ab/IMx6II1KSajxOP2P4QqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(136003)(346002)(366004)(396003)(376002)(54906003)(8936002)(186003)(6496006)(16526019)(316002)(66476007)(66946007)(26005)(8676002)(66556008)(6486002)(956004)(6666004)(4744005)(5660300002)(6916009)(478600001)(2906002)(4326008)(33716001)(9686003)(86362001)(85182001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: k81HFAKxWX0npd/lwSyZwnv3qGy9x8qVBdvg6xQxKigpsfI1XrarcADq0grFqTgoSK5o/Bm9//Yv1X5kxqI50+mZ/wed9MMIOYlq3lDZUwdHvF6htbNlFdl1N0VGL8MQ5Akxue3zNk5Y5P8NPHihnoioxtnNOII1IbhvYeuY9NqWEisl9Rc0Art2lbIrOMOWtMSwlqw9iMrHVqprf7a9bk1nZL++ZRa1UZLt1tlPaUU9MDMUoYtD8zwTwG0l8+zhNbxd8p4WIXf5QC191XXm3pG57lCL5ggG7KUaS05+PPA6xf1Xj1PDDTsDBMg03s023qv8LokKVHtzXtd57Veew8P7MiXuCYikCmMxEc2A+CVv/5CRgeGMU1xLKb6ZR11BsXDpJfFj5GP0+eZMEioBQUH8xl0yXwfQ1WsQdS0L44krUHlA33sFPXOzxPosKC30sKtWWwsAWC462mXeDkOuaV79z4Yuz6J510ZWqvhz9wW5I3fFtCCNRxcgxWo7b+yPvyqfgmMtZ+9gbwvzb22JdR/c1k4S70Aup1Qrg1R3guCc94Asanma42GpWfQ/0kqpCVXJPYDkZ4HsMNjSA6q4DGd5jtQ0Dquf2hPxgUaQn6L2RluQntSbVOWMAt+pjwbK8Mb7IQiZtJvhf7wS80bmvI60prgJ7sclJXHRpUyBc/Ns3LTOAbk1gAZhk7oKnbH9c6yfFs5Fk3z2EcQH3yy04JWCO7K3FDSnnjUx1Oi0c02R6O1rIK4rXfh8J9i03t8v15i/kym4zJddNgtZXCiEnLrn7eG+0NaH3eP1k/ZCrRcgRJAqMnwSXH8zakHo5+v+ICo+BICEYL+Q0KVGix57agLltGNAcK5peecmTBdih1stq1XHPMEsUBb2G14lKlCNqC/zUcSqXIeDWF+W3GCF0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 59625594-2b0e-4f08-b159-08d88fa86df8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 12:08:03.6283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJvSZa0CF3YKwF1Vtag80PwXqcLoKbLiU6BY5bDs+LAPC81cLaoCvQm8ACjdH9jbQUz/DHoEfvlrQF+ZjX81Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5273
X-OriginatorOrg: citrix.com

On Fri, Nov 20, 2020 at 01:45:19PM +0100, Jan Beulich wrote:
> ACPI mandates use of E820 (or newer, e.g. EFI), and in fact firmware
> has been observed to include E820_ACPI ranges in what E801 reports as
> available (really "configured") memory.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> TBD: Alternatively we could drop all use of E801 (and older), since
>      there shouldn't be any 64-bit systems not supporting the more
>      modern E820.

That seems fine to me, but I don't want to force you to do the work.
If you want to go that route it seems better to me - as I image it
would be code removal mostly.


Thanks, Roger.

