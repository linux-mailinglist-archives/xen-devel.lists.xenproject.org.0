Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3740F6C321E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 13:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512604.792601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pebZB-0005x1-7W; Tue, 21 Mar 2023 12:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512604.792601; Tue, 21 Mar 2023 12:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pebZB-0005uH-4L; Tue, 21 Mar 2023 12:58:17 +0000
Received: by outflank-mailman (input) for mailman id 512604;
 Tue, 21 Mar 2023 12:58:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNSa=7N=citrix.com=prvs=4373eb648=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pebZ9-0005ts-Ex
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 12:58:15 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08516baa-c7e8-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 13:58:13 +0100 (CET)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 08:57:44 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5320.namprd03.prod.outlook.com (2603:10b6:610:9a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 12:57:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 12:57:41 +0000
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
X-Inumbo-ID: 08516baa-c7e8-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679403493;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6Cj64h/Vu6F25WCo3ZjQJFnKPjft5Q48BTc032XcliU=;
  b=M6Qvov17RVlKhjidMlgaNuap2YYgY7R4LJTnUXb5FGTHjfvOitGDqEWm
   hX3fPl3gLbZcTt4JxYHa6vWNS/f55T1/NxtEt+2FRopvxE7rmRT9+YLJN
   DBLsW3g88u9a+j8tgiOQSGF5yA5CBKbdCFISccXeJJPGmHWRty3hmNhCk
   c=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 101611370
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xzSH+KIbzVdqptSXFE+RNZQlxSXFcZb7ZxGr2PjKsXjdYENS0mRSz
 DAdXG2PaamPNmv9KY11PY/i9BgGvJ/WzIIyTAdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZnPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5oBE1V0
 fgzLgtKdx2+pf2L+b6CQONj05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGMlGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHuiBttLT+LgnhJsqFGz6zY6VSwwbF+ijtLhg3T5WvRid
 2VBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQkvsIrQT0h1
 neSgsjkQzdotdW9Vna15rqS6zSoNkA9L2AYYjQfZRAY+NSlq4Y25jrNU9JiHaidntDzXzbqz
 FiitzMijr8eicoK0aST/l3dhT+o4J/TQWYICh7/W2uk6kZyY9ejbonxsFzDt68fdMCeU0WLu
 2UCl46G9ucSAJqRlSuLBuIQALWu4PXDOzrZ6bJyI6QcG/2W0ybLVehtDPtWei+F7u5slefVX
 XLu
IronPort-HdrOrdr: A9a23:mZJ7LazokMygj7EgB6JmKrPw/b1zdoMgy1knxilNoHtuA66lfq
 GV7ZcmPHrP41wssR4b9OxoR5PwJk80maQY3WBzB9eftWvd1ldARbsKhbcKqAeAJ8SRzIFgPK
 5bAs5DIcy1BVxoydz8+k29H8w7yNeKtKCk7N2uqktFXEVjb7Il9QBiThyGGVd9XwleGJo+E9
 6V/c0vnUvFRUgq
X-IronPort-AV: E=Sophos;i="5.98,279,1673931600"; 
   d="scan'208";a="101611370"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ev4kVfNGOQo74V6n21J+vWxWq32XxmPRLQVDXm5qbyqGOQ5CZ8VivGnPCaVhPVXiVqEQWcqACccJLd5LLD3sbBjxzLy3N2P7pP0VRFI3EVVedwlCsnAzILgViDK0I1LZIqkrzQLzTd1O9/aQp6xRzXZVW+34pUa14fqmg0V3+K4fOdX15rhP4+1vs9nOtQRxO4pTrNTRJpqz4HvOiGIvai1c3VbGQqhaijQT7qLLKhTaPLrRaJphyp7w60Mijt3t9PLE/T3xoA73aj83JrilUseCwn4MNb1c451H1ecXidZFdwMgz/EbGmBekJ9epUB+qMxrQLVTUVWppxi4DTQUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNFyh/9oxcyVIn2jiben5GD1DjE53W2DkVAi1UAnoE8=;
 b=I3l6vulGmzxKEoi+ZFAd0Ruz9mx8hTncF5e4NNNlIqVh5usv/QZ9LFNyw5vMzmQgQxiMtj3/zkcqQ3aAFu0NwVvcox9bSvQBJAsHcjjrz/1qedbPpqKuVAppHYklqhtZHi1tJYouUoSiH2NbmXuYkued5b4f+DYBebi5ZeIc4itKpTbmjE5piLpmOelHPol7HGQXqqYnRjdWJKNjDICak45Vy6KsloLwoYEKLX6BqXV2f3B3uHBsZJRrfYM5wIASLYcb+56AWXzBf5F0eXkRqS61zZohytVIrx/cOqzMvwqXxx5o8uUWeg4hMrON0/qcMYviE4G/FDiQbHA5k1okLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNFyh/9oxcyVIn2jiben5GD1DjE53W2DkVAi1UAnoE8=;
 b=ueyNGwTDBbemy17jxLQQ8gEqq6XJdnr222Aaa85oUMHuBpjtVdI0oFnw85dz8VY0tVWkGW33DsE8k5KzwAO848youFIAGZvOhynYFWBHJwQ+aw60Cfb7xSQF47F8urszh5a/GW6+8WHE8DuZom1wuldcM5s5wkPMdMaXm4t3Cis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dc60938e-50db-2fa0-bfd0-8f9e1d0a5b61@citrix.com>
Date: Tue, 21 Mar 2023 12:57:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/3] tools/xenctrl: add xc_get_cpu_version()
Content-Language: en-GB
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230321114745.11044-1-sergey.dyasli@citrix.com>
 <20230321114745.11044-2-sergey.dyasli@citrix.com>
In-Reply-To: <20230321114745.11044-2-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0116.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH2PR03MB5320:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f42a90-d42f-46fd-fba3-08db2a0bdaf8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7+JVVMRoUoPMiqs4yKbiuZ0y+nKxvAujJxgucVmDsGtvlPo6EtG/pXYo1ow1H2XEycmpJbm2IuRS2DIN4D47HSpeffggEA07fxwn7tZgmzPW1ByM84h8CQLsT9+53ihtEWrrkByLW3+TMLRhdTy7mnBulBRxqlp5veyf5VAbF7JnlgsmRAO9Gflgt6tqQ3DS8bRJVbhJvpY2GDxeLPHbTl6UJz12Kz4Qxg5u64DCbjfjEnw/wus9wJeXNEMUO1C+I3Y1uiD+hXi+/H8PKyqmccMW4yGIKUcpjryeW5YnFx58IpRbSk2LnwODZ6YXCqVxc+Lq2dIbLSmDnMRCh8l+rsyqIiVBYJrS9Vss4yakAj73KvYpPvc7Ke83CpaBHILov+R7l3CUH4Qzrsa2I5xEtpUKgzXyHGU5gjKbR/l9Ek5Vdr+UHUPty9BKn42Cpz88arIFp4/c9IaPMg9A7FU/AO66aPltUEVCbMdxvKZnOu7uFaSao8sDt6mFx7vWhwQ8JI3h/p3KIZVxPNXa/JQoiPFIX+RqSnpjsMuWS0SmFP+YrzbzWxvxQD76riPWlf2v61TdwjO9OnUE3yspBcAkM3hqGa9kslzVcpAac2/M9kRH7QPLBppsH5KlnFpYoAGjOCIs/eigljKQ/d9C/Uw4+te8WIKOmf37gnKs9w/HLUkj8vj65Oej4RV+bvHI6VYD5sWdUnyxKvwmsTaiUmJKcDzYq9QWOIkQB8Yh9kFGV1Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199018)(8936002)(4744005)(41300700001)(7416002)(5660300002)(31696002)(36756003)(86362001)(38100700002)(4326008)(82960400001)(2906002)(54906003)(83380400001)(6506007)(31686004)(53546011)(6512007)(478600001)(6666004)(186003)(6486002)(26005)(8676002)(66476007)(66556008)(66946007)(2616005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2xqOVBIc1JlY2VyQWlEMGxNaGs5WE00Zmg1aVYzZWtxaUs5Nmd2WmQzSjN2?=
 =?utf-8?B?c1NsSUNSekpUczFMK3doTjFDZExTOFFFSEg4eEwyNEh2TXNQamRpOE1KRTFu?=
 =?utf-8?B?RFZ2QTE4QnNiMEU0YW1nZFdXK2ZwOTZIQi84MzVaWWRHV05YOHllTG9FTmFn?=
 =?utf-8?B?YTNHYy95WmdYTDdjQmVER2RJbGN2OE9ub3dUZDVOZzRIeFltTHY0TXpvSm82?=
 =?utf-8?B?eGhIZTJyajJXd3pBTFcvRDh4NlMxcVJnT3dTRy8vbVdUaWpldUw2VFBKRHJq?=
 =?utf-8?B?ajEwRVhoNURRY2FoRVkzOHcrVEd4S29PQTRId0kvdkFhSGxoVm5qZ1h0Q2hW?=
 =?utf-8?B?REo1NlBoUkpza0Y3UnhLOGIyVU5kZVdKMVRVWktMRHRNYTRMZVVmTVlMY0sv?=
 =?utf-8?B?dk9ZbG5CT0srVG0zYUFBT2IrT1NzRXZ6Rk0yQXdEUVNiY2JqMVY3LzNBUFhz?=
 =?utf-8?B?eUI5RVd6Q25ZSmE0NFM5eXBBYnJXSWJ0WkVzQ2ZhRWtaNmdDNW90Q1RXaHRO?=
 =?utf-8?B?TThtSDFWTE5pTjQzdTVPWDRHcTdzalBPdU5mNXR1MnlxOVk5Ykk4VkVZWEN5?=
 =?utf-8?B?eUJqMktFN3NqSmlGcDI1S1p2VFhKb0FOaXRMUElFalRaVEJVbjQ3dStic1c5?=
 =?utf-8?B?US9YVWVVRWwrRWFSVXJCSGxyVHhoM2FZTThjc09leWh6MEJ1ZGZPUS9XNEli?=
 =?utf-8?B?Mk9jdk50dTRFYUg1YzhVV2NnTExXUXd5ZzIwRlBmRmZHM3VWT05oZEJ1UXJC?=
 =?utf-8?B?ZU1QTHZ1V25sMHJXVlhKUE54cXFydThETVc3cU1uMnJiZVZmQmhqMDlzNzgx?=
 =?utf-8?B?UDNiMjd5all0V0tTUXRpdjRLdlVZRXA3MlcrSmQrRXZoRmRRUXpyOVdtZy9U?=
 =?utf-8?B?WmRib1Y1d2hqWkFaVXlKSmlNTlp4YSs5OHQ1aEpQbGVhL0xFUm4vUnh2cFZy?=
 =?utf-8?B?d3FUQzNtakNYL2RIMW1aMituazZsbEtXQWx6OUhNMlhyc1lINjhxNFZoU1pR?=
 =?utf-8?B?QU9ZVS9Sa2hLQXMzZ2l2WHVJd2ppZUNzTURVMnpFbmNVV3BhbUxobXNsa0JV?=
 =?utf-8?B?emoyY25XMDk0SU9wbTZOSlNBTitJWGdmMGQvUXV6QVoyZ1FkZ1N0dGh6YVlq?=
 =?utf-8?B?RzMwdzNUU2VPcW9vTkNKRGlScEVBMzc1aXBwd0plNmk5SFNNWm1QN21xRUlZ?=
 =?utf-8?B?SnYxNHNBVlJnczZUSW9rOWNjYkVNUW9OM3phbGgvMmxNelQ1eTV6QmFHS2V2?=
 =?utf-8?B?R1J3VE1XOVdtQ1JIMDdnLyt0cDQxM0FWS3F1VHhTaE55NXRzVmxLc0hzcHBh?=
 =?utf-8?B?eXJIK3paK0JCS004ODRySldFMzIxQmxVd2ZQTTljcGkrZThYaVBPQjB2Rm1m?=
 =?utf-8?B?Y3RleWp2NjFMUWVwb2x3Q3RBLzVWNHJUa1dMYWtibGNDWnZBVTZDbGg5eEs2?=
 =?utf-8?B?Nkh5UFpBZGlpMHU5ZFlxeXZiYnA0WWxlTTZFUzNFYVRuM0QxMndJb25Rb2tR?=
 =?utf-8?B?Q2RKbmlzckp3SGVBZkRtNi94RUNBaDVzbGFjSnB2cXFoWUQyVTVwYmtzTjZY?=
 =?utf-8?B?WE1ibk1NbDVHZ1pzeVZrcGwwZHpPTHZSU3V2dmM2ZE80NCtvQ2VJZ3RjTlFz?=
 =?utf-8?B?dTN1c0lRempscDJNbjBRN2d3MlJnNDJtbVdYVHY1YjZvY0dEVm94UFpVV1c0?=
 =?utf-8?B?SmZON2ZQUEwzbkFFUnZoQzJjbGxsOUdYQnlGTHFCNU9ZMzJrQW5jUnlWZllQ?=
 =?utf-8?B?dzRPNDJ6MUI4dUtOaXB3eDBBemVnN1NVQ1N5Tk5NRzZGckhXbFdQN3d4YlNk?=
 =?utf-8?B?Uzc0SkxSVEd2T3ErRGJob1BPQ3JTKzJmdmpCWlI3bDN0N3dGSEVMaXdTRDdB?=
 =?utf-8?B?aW82eURoQ0ZlNFMrTDBUYkFlOUxPbC81c2gzSVR0WXlhVjB0WlFtbWZUNm5q?=
 =?utf-8?B?OXVFOGY5RkptVFYxWWEvWER2UjN5RHVaSW5YbElmLzJ0eVZRaVRlYTZIdUFD?=
 =?utf-8?B?UGtOM0VpQS9EeTN5cnlxRDJXR1A4NmN6Yi95VWRQZHBhL25MRm16WFFBWW9S?=
 =?utf-8?B?Z2hkdHBndTNSRm1DTVNwV0lXZ3dNcXB2N1BSV0xUajJmNEo3M3ZPVzhTSXIz?=
 =?utf-8?B?bk1ZVHNDd1NMVUdDZlZTQkNwSU81bjhIUUtuR0QxR3N1T1VRTzJGWEovSE9v?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	g+mnfhaFl4JAwUtXn0CZZanYPhbPM/xV6AkFELiLyE2bi2hXwURUjiJ0xL5hQk8lzEN3lkPW7LAlFCmD1vNxbeTsUV1lOrSVJkYH4rF1ZVHRCo2Zar0uDZCvF6R45kDkMXZMVIs2m/SONJDlUoFmP8rc3UzJocbxsEYpMmp1hXrPHEkgZugPdfUWlGxCH1c12KH+fdoA1IXlN7aeHpHoutsRMMSJatNS6EsiGZABbsUPOKP9NcK8L/Q0M9pm1dbCDEFPsH/96hzYGLdzCQTzOeyWbdJ2XbRkNYMYZ+rXCMvvP+6DdFc4Yg2nPr+iLL/e13oV42kKXOVE7wXa8aUTZHN+0ASDdT9N9z7if/9kgkK6UZ6NIzmdrhqzjEwdtxSD6ai1SqmZaAzRumNoHno8LuEzrFo3089bHDOxugcgnRvPKa/K8cNTPH79QKdLm8pQCXNezykYNbIeU2aRwhTfK3fes/HoKyiLY9XvUhycsrVRgNb52pt0ghLIVKRVkCvG/dw6YBJUO4r4ywqd1LxBpD2ueFoO6zZUT9T28sB0I2VZnYcN85k+mJr6hzrF4ljJRuyBazGx7rj2HL+/v01QM2HoTTGgCRBxq0MfkQO4hWXYjRq/qf9d2DTOU25CKyw7TBs8BQ5AtMtig8HLi03UOSDPFP9bx+lHuTNXmixwODShxlHtcOop6agiBaxHnAGZ2kkcUukaRLuFgimB2Hw/crZN3fLPrmIxA+LCW1edkCOeZBaovKa73aa/DNsUr3G4SEInovCznTAKCO0k2LZRJuW+Z8MDbbjpMRrT6XYKc+lfW9aKMhb0Yj/M+DyEed3Tbi+ptB68kojAcUafOLYvcx1DMXprvGDlEMVq3XxXd9A=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f42a90-d42f-46fd-fba3-08db2a0bdaf8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 12:57:41.4032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkhiou9ehYX7E2jK7hQXJwpSIcQ8hj3PhXvvQQpN79M1sk393prQWSTsk0YNtpHbvDmR+nbGokaT+tYBqQDV1GqDMBZI3qiQo0MasDWMzLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5320

On 21/03/2023 11:47 am, Sergey Dyasli wrote:
> diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
> index 265f15ec2d..f2f6e4348e 100644
> --- a/tools/libs/ctrl/xc_misc.c
> +++ b/tools/libs/ctrl/xc_misc.c
> @@ -226,6 +226,26 @@ int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
>      return ret;
>  }
>  
> +int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver)
> +{
> +    int ret;
> +    DECLARE_PLATFORM_OP;
> +
> +    if ( !xch || !cpu_ver )
> +        return -1;

We don't check parameters like this anywhere else.  It's library code,
and the caller is required to DTRT.

Also, we're phasing out the use of the DECLARE macros.  This wants to
change to

struct xen_platform_op op = {
    .cmd = XENPF_get_cpu_version,
    .u.pcpu_version.xen_cpuid = cpu_ver->xen_cpuid,
};

Both can be fixed on commit, if you're happy.

~Andrew

